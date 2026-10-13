#include "types.h"

static int is_delimiter(unsigned char ch)
{
    return ch == ' ' || ch == '\r' || ch == '\n';
}

int parse_request(struct client *c, char *method, char *filename, char *version)
{
    char *p = c->request;
    char *end = c->request + c->request_size;

    while (p < end && !is_delimiter(*p))
        *method++ = *p++;
    *method = '\0';

    if (p >= end || *p != ' ')
        return -1;

    while (p < end && *p == ' ')
        p++;

    while (p < end && !is_delimiter(*p))
        *filename++ = *p++;
    *filename = '\0';

    if (p >= end || *p != ' ')
        return -1;

    while (p < end && *p == ' ')
        p++;

    const char *prefix = "HTTP/";
    while (*prefix != '\0') {
        if (p >= end || *p != *prefix)
            return -1;
        p++;
        prefix++;
    }

    while (p < end && !is_delimiter(*p))
        *version++ = *p++;
    *version = '\0';

    return 0;
}
