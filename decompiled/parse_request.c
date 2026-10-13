
int sym.parse_request(int *c,char *method,char *filename,char *version)

{
    int iVar1;
    uint8_t *puVar2;
    char *pcVar3;
    uint8_t uVar4;
    uint32_t uVar5;
    uint8_t *puVar6;
    
    iVar1 = sym.__x86.get_pc_thunk.ax();
    puVar2 = c[8];
    puVar6 = puVar2 + c[9];
    if (puVar2 < puVar6) {
        uVar5 = *puVar2;
        if ((0x16 < uVar5 - 10) || ((0x400009U >> (uVar5 - 10 & 0x1f) & 1) == 0)) {
            pcVar3 = method;
            do {
                puVar2 = puVar2 + 1;
                method = pcVar3 + 1;
                *pcVar3 = uVar5;
                if (puVar6 == puVar2) goto code_r0x08049260;
                uVar5 = *puVar2;
                pcVar3 = method;
            } while ((0x16 < uVar5 - 10) || ((0x400009U >> (uVar5 - 10 & 0x1f) & 1) == 0));
        }
        *method = '\0';
        if (*puVar2 == 0x20) {
            do {
                puVar2 = puVar2 + 1;
                if (puVar6 <= puVar2) goto code_r0x0804926c;
                uVar4 = *puVar2;
            } while (uVar4 == 0x20);
            if ((0x16 < uVar4 - 10) || ((0x400009U >> (uVar4 - 10 & 0x1f) & 1) == 0)) {
                uVar5 = uVar4;
                pcVar3 = filename;
                do {
                    filename = pcVar3 + 1;
                    puVar2 = puVar2 + 1;
                    *pcVar3 = uVar5;
                    if (puVar6 <= puVar2) goto code_r0x0804926c;
                    uVar5 = *puVar2;
                    pcVar3 = filename;
                } while ((0x16 < uVar5 - 10) || ((0x400009U >> (uVar5 - 10 & 0x1f) & 1) == 0));
            }
            *filename = '\0';
            if (*puVar2 == 0x20) {
                do {
                    puVar2 = puVar2 + 1;
                    if (puVar6 <= puVar2) {
                        return -1;
                    }
                } while (*puVar2 == 0x20);
                uVar4 = 0x54;
                iVar1 = iVar1 + 0x771f7;
                if (*puVar2 == 0x48) {
                    while( true ) {
                        puVar2 = puVar2 + 1;
                        if (puVar6 <= puVar2) break;
                        uVar5 = *puVar2;
                        if (uVar4 != *puVar2) {
                            if (uVar4 != 0) {
                                return -1;
                            }
                            pcVar3 = version;
                            if ((0x16 < uVar5 - 10) || ((0x400009U >> (uVar5 - 10 & 0x1f) & 1) == 0))
                            goto code_r0x08049210;
                            goto code_r0x0804922d;
                        }
                        uVar4 = *(iVar1 + 2);
                        iVar1 = iVar1 + 1;
                    }
                    if (uVar4 == 0) goto code_r0x0804922d;
                }
            }
        }
    }
    else {
code_r0x08049260:
        *method = '\0';
        if (*puVar2 == 0x20) {
code_r0x0804926c:
            *filename = '\0';
        }
    }
    return -1;
    while( true ) {
        uVar5 = *puVar2;
        pcVar3 = version;
        if ((uVar5 - 10 < 0x17) && ((0x400009U >> (uVar5 - 10 & 0x1f) & 1) != 0)) break;
code_r0x08049210:
        puVar2 = puVar2 + 1;
        version = pcVar3 + 1;
        *pcVar3 = uVar5;
        if (puVar6 <= puVar2) break;
    }
code_r0x0804922d:
    *version = '\0';
    return 0;
}

