
int sym.client_process_request(client *cc)

{
    char cVar1;
    uint16_t uVar2;
    char *pcVar3;
    client *pcVar4;
    client *pcVar5;
    int iVar6;
    int iVar7;
    int iVar8;
    uint uVar9;
    int *piVar10;
    uint uVar11;
    int unaff_EBX;
    char *pcStack_194;
    uchar auStack_190 [16];
    uint32_t uStack_180;
    size_t sStack_164;
    client *pcStack_138;
    char cStack_134;
    char cStack_133;
    char cStack_132;
    char cStack_131;
    char acStack_124 [256];
    char acStack_24 [16];
    uint uStack_14;
    
    uStack_14 = 0x8049299;
    sym.__x86.get_pc_thunk.bx();
    pcStack_138 = cc;
    sym.__printf(unaff_EBX + 0x76d97,&stack0xfffffecc,&stack0xfffffedc,&stack0xffffffdc,&stack0xfffffec8,
                 &sym.client_process_request::cc);
    iVar6 = sym.parse_request(&pcStack_138->fd,&stack0xfffffecc,&stack0xfffffedc,&stack0xffffffdc);
    if (iVar6 != 0) {
        iVar6 = sym.client_http_error(pcStack_138,400,unaff_EBX + 0x76b62);
        return iVar6;
    }
    if ((((cStack_134 == 'G') && (cStack_133 == 'E')) && (cStack_132 == 'T')) && (cStack_131 == '\0')) {
        if (acStack_24[0] != '1') {
            iVar6 = sym.client_http_error(pcStack_138,0x1f9,unaff_EBX + 0x76b84,&stack0xffffffdc);
            return iVar6;
        }
        iVar6 = sym.strstr(&stack0xfffffedc,unaff_EBX + 0x76ba2);
        if (iVar6 != 0) {
            iVar6 = sym.client_http_error(pcStack_138,0x194,unaff_EBX + 0x76ba5);
            return iVar6;
        }
        iVar6 = unaff_EBX + 0x89869;
        if (acStack_124[0] == '/') {
            iVar6 = unaff_EBX + 0x8b6b8;
        }
        sym.__asprintf(&stack0xfffffe6c,unaff_EBX + 0x76bb7,_obj.www_root,iVar6,&stack0xfffffedc);
        iVar6 = sym._xstat(3,pcStack_194,&stack0xfffffe70);
        pcVar3 = pcStack_194;
        if (iVar6 == -1) {
            piVar10 = sym.__errno_location();
            uVar9 = sym.strerror(*piVar10);
            iVar6 = sym.client_http_error
                              (pcStack_138,(*piVar10 != 0xd) + 0x193,unaff_EBX + 0x8fec9,uVar9,&stack0xfffffedc);
        }
        else {
            if ((uStack_180 & 0xf000) == 0x4000) {
                iVar6 = sym.strlen(pcStack_194);
                if (iVar6 != 0) {
                    cVar1 = pcVar3[iVar6 + -1];
                    iVar6 = iVar6 + -1;
                    while ((cVar1 == '/' && (pcVar3[iVar6] = '\0', iVar6 != 0))) {
                        iVar6 = iVar6 + -1;
                        cVar1 = pcVar3[iVar6];
                    }
                }
                sym.__asprintf(&stack0xfffffe6c,unaff_EBX + 0x76bbe,pcVar3);
                sym.__cfree(pcVar3);
                sym._xstat(3,pcStack_194,&stack0xfffffe70);
            }
            pcVar4 = pcStack_138;
            iVar6 = sym.__open(pcStack_194,0);
            pcVar5 = pcStack_138;
            pcVar3 = pcStack_194;
            pcVar4->response_fd = iVar6;
            if (pcStack_138->response_fd == -1) {
                piVar10 = sym.__errno_location();
                iVar6 = *piVar10;
                uVar9 = sym.strerror(iVar6);
                pcVar3 = pcStack_194;
                uVar2 = (pcStack_138->addr).sin_port;
                uVar11 = sym.inet_ntoa((pcStack_138->addr).sin_addr.s_addr);
                sym.__printf(unaff_EBX + 0x76bcc,uVar11,uVar2 >> 8 | uVar2 << 8,pcVar3,uVar9);
                sym.__cfree(pcStack_194);
                if ((iVar6 == 1) || (iVar6 == 0xd)) {
                    uVar9 = sym.strerror(iVar6);
                    iVar6 = sym.client_http_error(pcStack_138,0x193,unaff_EBX + 0x8fecd,uVar9);
                }
                else {
                    uVar9 = sym.strerror(iVar6);
                    iVar6 = sym.client_http_error(pcStack_138,0x194,unaff_EBX + 0x8fecd,uVar9);
                }
            }
            else {
                iVar7 = fcn.08048208(pcStack_194,0x2e);
                iVar6 = unaff_EBX + 0x76b49;
                if (iVar7 != 0) {
                    iVar8 = func_0x08048220(iVar7,unaff_EBX + 0x76bc6);
                    iVar6 = unaff_EBX + 0x76b1b;
                    if (iVar8 != 0) {
                        iVar8 = func_0x08048220(iVar7,unaff_EBX + 0x76be2);
                        iVar6 = unaff_EBX + 0x76b34;
                        if (iVar8 != 0) {
                            iVar7 = func_0x08048220(iVar7,unaff_EBX + 0x76be7);
                            iVar6 = unaff_EBX + 0x76b49;
                            if (iVar7 == 0) {
                                iVar6 = unaff_EBX + 0x76b3f;
                            }
                        }
                    }
                }
                uVar2 = (pcVar5->addr).sin_port;
                uVar9 = sym.inet_ntoa((pcVar5->addr).sin_addr.s_addr);
                sym.__printf(unaff_EBX + 0x76bec,uVar9,uVar2 >> 8 | uVar2 << 8,pcVar3);
                sym.__cfree(pcStack_194);
                sym.__asprintf(&pcStack_138->response,unaff_EBX + 0x76dc7,iVar6);
                pcStack_138->response_file_remaining = sStack_164;
                sym.client_send_response(pcStack_138);
                iVar6 = 200;
            }
        }
    }
    else {
        iVar6 = sym.client_http_error(pcStack_138,0x195,unaff_EBX + 0x76b6e,&stack0xfffffecc);
    }
    return iVar6;
}

