#include "types.h"

#include <errno.h>
#include <err.h>
#include <fcntl.h>

void set_nonblock(int fd)
{
    int flags = fcntl(fd, F_GETFL, 0);
    if (flags == -1)
        err(1, "fcntl(fd, F_GETFL, NULL)");

    if (fcntl(fd, F_SETFL, flags | O_NONBLOCK) == -1)
        err(1, "fcntl(fd, F_SETFL, fl | O_NONBLOCK)");
}
