
void sym.set_nonblock(int fd)

{
    uint uVar1;
    int iVar2;
    int unaff_EBX;
    ulong uVar3;
    
    uVar1 = sym.__x86.get_pc_thunk.bx();
    uVar3 = sym.__libc_fcntl(uVar1,3,0);
    uVar1 = uVar3 >> 0x20;
    if (uVar3 == -1) {
    //WARNING: Subroutine does not return
        sym.err(1,unaff_EBX + 0x76f4f,uVar1,uVar1);
    }
    iVar2 = sym.__libc_fcntl();
    if (iVar2 != -1) {
        return;
    }
    //WARNING: Subroutine does not return
    sym.err(1,unaff_EBX + 0x770ef,0xffffffff,0xffffffff);
}

