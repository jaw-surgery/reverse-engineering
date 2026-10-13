#define _GNU_SOURCE

#include "types.h"

#include <errno.h>
#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/personality.h>
#include <sys/socket.h>
#include <arpa/inet.h>

char *www_root;
int epoll_fd;

int main(int argc, char **argv, char **envp)
{
    int sock;
    struct sockaddr_in addr;
    int one = 1;
    struct epoll_event ee_listen = {0};

    (void)argc;
    (void)envp;

    if (personality(0xffffffff) == -1)
        err(1, "personality(0xffffffff)");

    if (!(personality(0xffffffff) & ADDR_NO_RANDOMIZE)) {
        if (personality(ADDR_NO_RANDOMIZE) == -1)
            err(1, "personality(ADDR_NO_RANDOMIZE)");
        execvp(argv[0], argv);
    }

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == -1)
        err(1, "socket(AF_INET, SOCK_STREAM, 0)");

    www_root = get_current_dir_name();

    addr.sin_family = AF_INET;
    addr.sin_port = htons(8080);
    addr.sin_addr.s_addr = htonl(INADDR_ANY);

    if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)) == -1)
        err(1, "setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &(int){ 1 }, sizeof(int))");

    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) == -1)
        err(1, "bind(sock, (struct sockaddr *)&addr, sizeof(addr))");

    if (listen(sock, 10) == -1)
        err(1, "listen(sock, 10)");

    set_nonblock(sock);
    epoll_fd = epoll_create(1);

    ee_listen.events = EPOLLIN;
    if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, sock, &ee_listen) == -1)
        err(1, "epoll_ctl(epoll_fd, EPOLL_CTL_ADD, sock, &ee_listen)");

    setlinebuf(stdout);
    printf("Listening on port %d\n", ntohs(addr.sin_port));

    for (;;) {
        struct epoll_event ee;
        struct client *c;
        int n;

        for (;;) {
            n = epoll_wait(epoll_fd, &ee, 1, -1);
            if (n == -1) {
                if (errno == EINTR)
                    continue;
                err(1, "epoll_wait");
            }
            if (n == 0)
                continue;

            c = ee.data.ptr;
            if (c == NULL)
                break;

            if (c->state == 0) {
                if (c->request_allocated == c->request_size) {
                    c->request_allocated *= 2;
                    c->request = realloc(c->request, c->request_allocated);
                }

                n = read(c->fd, c->request + c->request_size,
                         c->request_allocated - c->request_size - 1);
                if (n == -1)
                    err(1, "read(c->fd, new_request, c->request_allocated - c->request_size - 1)");

                c->request_size += n;
                c->request[c->request_size] = '\0';

                if (n == 0) {
                    printf("Client %s:%d: Peer closed connection\n",
                           inet_ntoa(c->addr.sin_addr), ntohs(c->addr.sin_port));
                    c->done = true;
                }

                if (memmem(c->request, c->request_size, "\r\n", 2) != NULL ||
                    memmem(c->request, c->request_size, "\r\n\r\n", 4) != NULL ||
                    c->request_size > 0x10000) {
                    c->state = 1;
                    client_process_request(c);
                }
            } else if (c->state == 1) {
                client_send_response(c);
            }

            if (c->done) {
                printf("Client %s:%d: Closing connection\n",
                       inet_ntoa(c->addr.sin_addr), ntohs(c->addr.sin_port));
                close(c->fd);
                free(c->request);
                free(c->response);
                if (c->response_fd > 0)
                    close(c->response_fd);
                free(c);
            }
        }

        c = calloc(1, sizeof(*c));
        c->request_allocated = 0x400;
        c->request = malloc(0x400);

        int caddr_size = sizeof(c->addr);
        c->fd = accept(sock, (struct sockaddr *)&c->addr, (socklen_t *)&caddr_size);
        if (c->fd == -1)
            err(1, "accept(sock, (struct sockaddr *)&c->addr, &caddr_size)");

        printf("Client %s:%d: Connected\n",
               inet_ntoa(c->addr.sin_addr), ntohs(c->addr.sin_port));
        set_nonblock(c->fd);
        c->ee.events = EPOLLIN;
        c->ee.data.ptr = c;

        if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, c->fd, &c->ee) == -1)
            err(1, "epoll_ctl(epoll_fd, EPOLL_CTL_ADD, c->fd, &c->ee)");
    }
}
