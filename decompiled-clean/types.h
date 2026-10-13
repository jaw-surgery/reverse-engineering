#ifndef OSY_SERVER_H
#define OSY_SERVER_H

#include <stdbool.h>
#include <stddef.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/epoll.h>
#include <netinet/in.h>

struct client {
    int fd;
    struct sockaddr_in addr;
    struct epoll_event ee;
    char *request;
    size_t request_size;
    size_t request_allocated;
    int state;
    char *response;
    size_t response_index;
    int response_fd;
    off_t response_file_remaining;
    bool done;
};

extern char *www_root;
extern int epoll_fd;

void set_nonblock(int fd);
int parse_request(struct client *c, char *method, char *filename, char *version);
int client_http_error(struct client *c, int status, const char *fmt, ...);
void client_send_response(struct client *c);
int client_process_request(struct client *c);

#endif
