
void sym.client_send_response(client *c)

{
    char *s;
    size_t sVar1;
    int iVar2;
    int *piVar3;
    uint uVar4;
    int unaff_EBX;
    ulong uVar5;
    
    sym.__x86.get_pc_thunk.bx();
    if (c->response == NULL) {
code_r0x08048f48:
        iVar2 = c->response_fd;
        if (iVar2 < 1) {
            return;
        }
    }
    else {
        s = c->response + c->response_index;
        sVar1 = sym.strlen(s);
        iVar2 = sym.__write(c->fd,s,sVar1);
        if (-1 < iVar2) {
            c->response_index = c->response_index + iVar2;
            sVar1 = sVar1 - iVar2;
        }
        iVar2 = c->response_fd;
        if (iVar2 < 1) {
            if (sVar1 == 0) goto code_r0x08048f60;
            if ((c->ee).events == 5) {
                return;
            }
            (c->ee).events = 5;
            uVar5 = sym.epoll_ctl(_obj.epoll_fd,3,c->fd,&c->ee);
            uVar4 = uVar5 >> 0x20;
            if (uVar5 == -1) goto code_r0x08048f9e;
            goto code_r0x08048f48;
        }
        if (sVar1 == 0) {
            sym.__cfree(c->response);
            c->response = NULL;
            goto code_r0x08048f48;
        }
    }
    iVar2 = sym.sendfile(c->fd,iVar2,0,c->response_file_remaining);
    if (iVar2 == -1) {
        piVar3 = sym.__errno_location();
        if (*piVar3 != 0xb) {
    //WARNING: Subroutine does not return
            sym.err(1,unaff_EBX + 0x76ef8,piVar3,piVar3);
        }
    }
    else {
        sVar1 = c->response_file_remaining - iVar2;
        c->response_file_remaining = sVar1;
        if (sVar1 == 0) {
code_r0x08048f60:
            c->done = true;
            return;
        }
        if ((c->ee).events != 5) {
            (c->ee).events = 5;
            uVar5 = sym.epoll_ctl(_obj.epoll_fd,3,c->fd,&c->ee);
            uVar4 = uVar5 >> 0x20;
            if (uVar5 == -1) {
code_r0x08048f9e:
    //WARNING: Subroutine does not return
                sym.err(1,unaff_EBX + 0x770a3,uVar4,uVar4);
            }
        }
    }
    return;
}

