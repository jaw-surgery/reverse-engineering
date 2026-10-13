#include "types.h"

#include <errno.h>
#include <err.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/sendfile.h>

static void wait_writable(struct client *c)
{
    if (c->ee.events == (EPOLLIN | EPOLLOUT))
        return;

    c->ee.events = EPOLLIN | EPOLLOUT;
    if (epoll_ctl(epoll_fd, EPOLL_CTL_MOD, c->fd, &c->ee) == -1)
        err(1, "epoll_ctl(epoll_fd, EPOLL_CTL_MOD, c->fd, &c->ee)");
}

void client_send_response(struct client *c)
{
    if (c->response != NULL) {
        size_t remaining = strlen(c->response + c->response_index);
        int written = write(c->fd, c->response + c->response_index, remaining);

        if (written == -1 && errno == EAGAIN) {
            wait_writable(c);
            return;
        }

        c->response_index += written;
        remaining -= written;

        if (remaining != 0) {
            wait_writable(c);
            return;
        }

        free(c->response);
        c->response = NULL;
    }

    if (c->response_fd < 1) {
        c->done = true;
        return;
    }

    int sent = sendfile(c->fd, c->response_fd, NULL, c->response_file_remaining);
    if (sent == -1) {
        if (errno != EAGAIN)
            err(1, "sendfile");
        return;
    }

    c->response_file_remaining -= sent;
    if (c->response_file_remaining == 0) {
        c->done = true;
        return;
    }

    wait_writable(c);
}
