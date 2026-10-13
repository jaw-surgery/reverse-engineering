
//WARNING: Restarted to delay deadcode elimination for space: ram

void main(int argc,char **argv,char **envp)

{
    uint16_t uVar1;
    uint *puVar2;
    void *big;
    int32_t cc;
    uint32_t uVar3;
    int iVar4;
    uint uVar5;
    int *piVar6;
    int extraout_ECX;
    int iVar7;
    uint extraout_ECX_00;
    int iVar8;
    uint extraout_ECX_01;
    int unaff_EBX;
    int *big_len;
    uint8_t uVar9;
    char *format;
    int in_stack_ffffff90;
    int32_t var_60h;
    int32_t var_5ch;
    int32_t var_58h;
    int32_t var_54h;
    int32_t var_50h;
    int32_t var_4ch;
    int32_t var_48h;
    int32_t var_44h;
    int32_t var_40h;
    int32_t var_3ch;
    int32_t var_38h;
    int32_t var_34h;
    int32_t var_30h;
    uchar auStack_30 [6];
    int16_t var_26h;
    int32_t var_24h;
    uint uStack_1c;
    uchar *puStack_18;
    
    uVar9 = 0;
    puStack_18 = &stack0x00000004;
    uStack_1c = 0x8048406;
    sym.__x86.get_pc_thunk.bx();
    puVar2 = *(extraout_ECX + 4);
    uVar3 = sym.personality(0xffffffff);
    if (uVar3 == 0xffffffff) {
    //WARNING: Subroutine does not return
        sym.err(1,unaff_EBX + 0x77a99,0xffffffff,0xffffffff);
    }
    if ((uVar3 & 0x40000) == 0) {
        iVar4 = sym.personality(0x40000);
        iVar4 = iVar4 + 1;
        if (iVar4 == 0) {
    //WARNING: Subroutine does not return
            sym.err(1,unaff_EBX + 0x77c96,0,0);
        }
        sym.execvp(*puVar2,puVar2,iVar4,iVar4);
    }
    iVar4 = sym.socket(2,1,0);
    if (iVar4 == -1) {
    //WARNING: Subroutine does not return
        sym.err(1,unaff_EBX + 0x77cb6,0xffffffff,0xffffffff);
    }
    _obj.www_root = sym.get_current_dir_name();
    auStack_30._0_2_ = 2;
    auStack_30[2] = '\x1f';
    auStack_30[3] = -0x70;
    var_48h = 1;
    big_len = &stack0xffffffd4;
    for (iVar7 = 3; iVar7 != 0; iVar7 = iVar7 + -1) {
        *big_len = 0;
        big_len = big_len + uVar9 * -2 + 1;
    }
    iVar7 = sym.setsockopt(iVar4,1,2,&main::var_48h,4);
    if (iVar7 == -1) {
    //WARNING: Subroutine does not return
        sym.err(1,unaff_EBX + 0x77cd6,extraout_ECX_00,extraout_ECX_00);
    }
    iVar7 = sym.bind(iVar4,&stack0xffffffd0,0x10);
    iVar7 = iVar7 + 1;
    if (iVar7 == 0) {
    //WARNING: Subroutine does not return
        sym.err(1,unaff_EBX + 0x77d1e,0,0);
    }
    iVar7 = sym.__listen(iVar4,10,iVar7,iVar7);
    if (iVar7 != -1) {
        sym.set_nonblock(in_stack_ffffff90);
        _obj.epoll_fd = sym.epoll_create(1);
        var_40h = 0;
        var_3ch = 0;
        var_44h = 1;
        iVar7 = sym.epoll_ctl(_obj.epoll_fd,1,iVar4,&main::var_44h);
        if (iVar7 == -1) {
    //WARNING: Subroutine does not return
            sym.err(1,unaff_EBX + 0x77d52,iVar4,iVar4);
        }
        sym.setlinebuf(_obj.stdout);
        sym.__printf(unaff_EBX + 0x77ac2,auStack_30._2_2_ >> 8 | auStack_30._2_2_ << 8);
        do {
            while( true ) {
                while( true ) {
                    do {
                        iVar7 = sym.epoll_wait(_obj.epoll_fd,&main::var_38h,1,0xffffffff);
                        cc = var_34h;
                    } while (iVar7 == 0);
                    if (iVar7 != -1) break;
                    piVar6 = sym.__errno_location();
                    if (*piVar6 != 4) {
    //WARNING: Subroutine does not return
                        sym.err(1,unaff_EBX + 0x77ad8,piVar6,piVar6);
                    }
                }
                if (var_34h == 0) break;
                if (*(var_34h + 0x2c) == 0) {
                    iVar7 = *(var_34h + 0x28);
                    if (iVar7 == *(var_34h + 0x24)) {
                        *(var_34h + 0x28) = iVar7 * 2;
                        uVar5 = sym.__libc_realloc(*(var_34h + 0x20),iVar7 * 2);
                        *(cc + 0x20) = uVar5;
                        iVar7 = *(cc + 0x28);
                    }
                    iVar7 = sym.__read(*cc,*(cc + 0x24) + *(cc + 0x20),(iVar7 + -1) - *(cc + 0x24));
                    if (iVar7 == -1) {
    //WARNING: Subroutine does not return
                        sym.err(1,unaff_EBX + 0x77df6,cc,cc);
                    }
                    iVar8 = *(cc + 0x24) + iVar7;
                    *(cc + 0x24) = iVar8;
                    *(*(cc + 0x20) + iVar8) = 0;
                    if (iVar7 == 0) {
                        uVar1 = *(cc + 6);
                        uVar5 = sym.inet_ntoa(*(cc + 8));
                        sym.__printf(unaff_EBX + 0x77e3e,uVar5,uVar1 >> 8 | uVar1 << 8,big_len);
                        *(cc + 0x40) = 1;
                    }
                    big = *(cc + 0x20);
                    big_len = *(cc + 0x24);
                    iVar7 = sym.memmem(big,big_len,unaff_EBX + 0x8bff8,2);
                    if (((iVar7 != 0) || (iVar7 = sym.memmem(big,big_len,unaff_EBX + 0x77afc,4), iVar7 != 0)) ||
                       (0x10000 < big_len)) {
                        *(cc + 0x2c) = 1;
                        sym.client_process_request(cc);
                    }
                }
                else if (*(var_34h + 0x2c) == 1) {
                    sym.client_send_response(var_34h);
                }
                if (*(cc + 0x40) != '\0') {
                    uVar1 = *(cc + 6);
                    uVar5 = sym.inet_ntoa(*(cc + 8));
                    big_len = uVar1 >> 8 | uVar1 << 8;
                    sym.__printf(unaff_EBX + 0x77e66,uVar5,big_len);
                    sym.__libc_close(*cc);
                    sym.__cfree(*(cc + 0x20));
                    sym.__cfree(*(cc + 0x30));
                    if (0 < *(cc + 0x38)) {
                        sym.__libc_close(*(cc + 0x38));
                    }
                    sym.__cfree(cc);
                }
            }
            piVar6 = big_len;
            big_len = sym.__calloc(1,0x44);
            big_len[10] = 0x400;
            iVar7 = sym.malloc(0x400);
            big_len[8] = iVar7;
            var_4ch = 0x10;
            iVar7 = sym.__libc_accept(iVar4,big_len + 1,&main::var_4ch,piVar6);
            if (iVar7 == -1) {
    //WARNING: Subroutine does not return
                sym.err(1,unaff_EBX + 0x77d8a,0,0);
            }
            uVar1 = *(big_len + 6);
            *big_len = iVar7;
            uVar5 = sym.inet_ntoa(big_len[2]);
            format = unaff_EBX + 0x77ae3;
            sym.__printf(format,uVar5,uVar1 >> 8 | uVar1 << 8);
            sym.set_nonblock(format);
            big_len[5] = 1;
            big_len[6] = big_len;
            iVar7 = sym.epoll_ctl(_obj.epoll_fd,1,*big_len,big_len + 5);
        } while (iVar7 != -1);
    //WARNING: Subroutine does not return
        sym.err(1,unaff_EBX + 0x77dc2,extraout_ECX_01,extraout_ECX_01);
    }
    //WARNING: Subroutine does not return
    sym.err(1,unaff_EBX + 0x77ab1,big_len,big_len);
}

