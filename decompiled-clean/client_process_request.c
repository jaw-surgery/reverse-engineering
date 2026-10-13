#include "types.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <arpa/inet.h>

int client_process_request(struct client *cc)
{
    char method[16];
    char filename[256];
    char version[16];
    char *path;
    struct stat st;
    int fd;
    const char *content_type;
    char *dot;

    printf("method:%p  filename:%p  version:%p  c:%p cc:%p\n",
           method, filename, version, cc, &cc);

    if (parse_request(cc, method, filename, version) != 0)
        return client_http_error(cc, 400, "Bad request");

    if (!(method[0] == 'G' && method[1] == 'E' && method[2] == 'T' && method[3] == '\0'))
        return client_http_error(cc, 405, "Method %s not allowed", method);

    if (version[0] != '1')
        return client_http_error(cc, 505, "HTTP version %s not supported", version);

    if (strstr(filename, "..") != NULL)
        return client_http_error(cc, 404, "Invalid file name");

    asprintf(&path, "%s%s%s", www_root, filename[0] == '/' ? "" : "/", filename);

    if (stat(path, &st) == -1) {
        int saved_errno = errno;
        return client_http_error(cc, saved_errno == EACCES ? 403 : 404,
                                 "%s", strerror(saved_errno));
    }

    if (S_ISDIR(st.st_mode)) {
        size_t len = strlen(path);
        while (len > 0 && path[len - 1] == '/')
            path[--len] = '\0';

        char *index_path;
        asprintf(&index_path, "%s/index.html", path);
        free(path);
        path = index_path;
        stat(path, &st);
    }

    fd = open(path, O_RDONLY);
    cc->response_fd = fd;

    if (fd == -1) {
        int saved_errno = errno;
        printf("Client %s:%d: %s: %s\n",
               inet_ntoa(cc->addr.sin_addr), ntohs(cc->addr.sin_port),
               path, strerror(saved_errno));
        free(path);
        return client_http_error(cc, saved_errno == ENOENT || saved_errno == EACCES ? 404 : 500,
                                 "%s", strerror(saved_errno));
    }

    dot = strrchr(path, '.');
    content_type = "application/octet-stream";
    if (dot != NULL) {
        if (strcmp(dot, ".html") == 0)
            content_type = "text/html; charset=UTF-8";
        else if (strcmp(dot, ".jpg") == 0)
            content_type = "image/jpeg";
        else if (strcmp(dot, ".png") == 0)
            content_type = "image/png";
    }

    printf("Client %s:%d: Sending %s\n",
           inet_ntoa(cc->addr.sin_addr), ntohs(cc->addr.sin_port), path);
    free(path);

    asprintf(&cc->response,
             "HTTP/1.0 200 OK\r\n"
             "Connection: close\r\n"
             "Content-Type: %s\r\n"
             "\r\n",
             content_type);
    cc->response_file_remaining = st.st_size;
    client_send_response(cc);

    return 200;
}
