#include "types.h"

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>

int client_http_error(struct client *c, int status, const char *fmt, ...)
{
    va_list ap;
    char *msg = NULL;

    va_start(ap, fmt);
    vasprintf(&msg, fmt, ap);
    va_end(ap);

    asprintf(&c->response,
             "HTTP/1.0 %03d %s\r\n"
             "Content-Type: text/html; charset=UTF-8\r\n"
             "\r\n"
             "<!DOCTYPE HTML><html><head><title>%d %s</title></head>\n"
             "<body><h1>%s</h1><hr>\n"
             "<address><a href='/%s'>%s</a> version %s %s</address>\n"
             "</body></html>\n",
             status, msg, status, msg, msg,
             "exec", "exec", "Dec  3 2017", "14:07:19");

    printf("Client %s:%d: %d %s\n",
           inet_ntoa(c->addr.sin_addr), ntohs(c->addr.sin_port), status, msg);

    free(msg);
    client_send_response(c);

    return status;
}
