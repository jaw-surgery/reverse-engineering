
int sym.client_http_error(client *c,int status,char *fmt,...)

{
    uint16_t uVar1;
    uint uVar2;
    uint uVar3;
    int unaff_EBX;
    uint auStack_20 [3];
    uint uStack_14;
    
    uStack_14 = 0x8048fd9;
    sym.__x86.get_pc_thunk.bx();
    auStack_20[0] = 0;
    sym._IO_vasprintf(&stack0xffffffe0,fmt,&stack0x00000010);
    sym.__asprintf(&c->response,unaff_EBX + 0x76f87,status,auStack_20[0],status,auStack_20[0],auStack_20[0],
                   str.QI_r_bQI_r_b._0_4_,str.QI_r_bQI_r_b._0_4_,unaff_EBX + 0x76dba,unaff_EBX + 0x76db1);
    uVar2 = auStack_20[0];
    uVar1 = (c->addr).sin_port;
    uVar3 = sym.inet_ntoa((c->addr).sin_addr.s_addr);
    sym.__printf(unaff_EBX + 0x76dc6,uVar3,uVar1 >> 8 | uVar1 << 8,status,uVar2);
    sym.__cfree(auStack_20[0]);
    sym.client_send_response(c);
    return status;
}

