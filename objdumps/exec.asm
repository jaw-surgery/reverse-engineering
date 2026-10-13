
exec:     file format elf32-i386


Disassembly of section .text:

080483f0 <main>:
 80483f0:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 80483f4:	83 e4 f0             	and    esp,0xfffffff0
 80483f7:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 80483fa:	55                   	push   ebp
 80483fb:	89 e5                	mov    ebp,esp
 80483fd:	57                   	push   edi
 80483fe:	56                   	push   esi
 80483ff:	53                   	push   ebx
 8048400:	51                   	push   ecx
 8048401:	e8 da 08 00 00       	call   8048ce0 <__x86.get_pc_thunk.bx>
 8048406:	81 c3 fa 6b 0a 00    	add    ebx,0xa6bfa
 804840c:	83 ec 64             	sub    esp,0x64
 804840f:	8b 71 04             	mov    esi,DWORD PTR [ecx+0x4]
 8048412:	6a ff                	push   0xffffffff
 8048414:	e8 57 a6 02 00       	call   8072a70 <__personality>
 8048419:	83 c4 10             	add    esp,0x10
 804841c:	83 f8 ff             	cmp    eax,0xffffffff
 804841f:	0f 84 10 02 00 00    	je     8048635 <main+0x245>
 8048425:	a9 00 00 04 00       	test   eax,0x40000
 804842a:	75 26                	jne    8048452 <main+0x62>
 804842c:	83 ec 0c             	sub    esp,0xc
 804842f:	68 00 00 04 00       	push   0x40000
 8048434:	e8 37 a6 02 00       	call   8072a70 <__personality>
 8048439:	83 c4 10             	add    esp,0x10
 804843c:	83 c0 01             	add    eax,0x1
 804843f:	0f 84 20 02 00 00    	je     8048665 <main+0x275>
 8048445:	50                   	push   eax
 8048446:	50                   	push   eax
 8048447:	56                   	push   esi
 8048448:	ff 36                	push   DWORD PTR [esi]
 804844a:	e8 61 76 02 00       	call   806fab0 <execvp>
 804844f:	83 c4 10             	add    esp,0x10
 8048452:	57                   	push   edi
 8048453:	6a 00                	push   0x0
 8048455:	6a 01                	push   0x1
 8048457:	6a 02                	push   0x2
 8048459:	e8 32 a9 02 00       	call   8072d90 <__socket>
 804845e:	83 c4 10             	add    esp,0x10
 8048461:	83 f8 ff             	cmp    eax,0xffffffff
 8048464:	89 c6                	mov    esi,eax
 8048466:	0f 84 b9 01 00 00    	je     8048625 <main+0x235>
 804846c:	e8 bf 8d 02 00       	call   8071230 <get_current_dir_name>
 8048471:	c7 c2 e4 09 0f 08    	mov    edx,0x80f09e4
 8048477:	8d 7d dc             	lea    edi,[ebp-0x24]
 804847a:	b9 03 00 00 00       	mov    ecx,0x3
 804847f:	83 ec 0c             	sub    esp,0xc
 8048482:	c7 45 d8 02 00 1f 90 	mov    DWORD PTR [ebp-0x28],0x901f0002
 8048489:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [ebp-0x44],0x1
 8048490:	89 02                	mov    DWORD PTR [edx],eax
 8048492:	31 c0                	xor    eax,eax
 8048494:	f3 ab                	rep stos DWORD PTR es:[edi],eax
 8048496:	8d 45 bc             	lea    eax,[ebp-0x44]
 8048499:	6a 04                	push   0x4
 804849b:	50                   	push   eax
 804849c:	6a 02                	push   0x2
 804849e:	6a 01                	push   0x1
 80484a0:	56                   	push   esi
 80484a1:	e8 6a a8 02 00       	call   8072d10 <setsockopt>
 80484a6:	83 c4 20             	add    esp,0x20
 80484a9:	83 c0 01             	add    eax,0x1
 80484ac:	0f 84 a3 01 00 00    	je     8048655 <main+0x265>
 80484b2:	8d 45 d8             	lea    eax,[ebp-0x28]
 80484b5:	52                   	push   edx
 80484b6:	6a 10                	push   0x10
 80484b8:	50                   	push   eax
 80484b9:	56                   	push   esi
 80484ba:	e8 71 a7 02 00       	call   8072c30 <__bind>
 80484bf:	83 c4 10             	add    esp,0x10
 80484c2:	83 c0 01             	add    eax,0x1
 80484c5:	0f 84 7a 01 00 00    	je     8048645 <main+0x255>
 80484cb:	50                   	push   eax
 80484cc:	50                   	push   eax
 80484cd:	6a 0a                	push   0xa
 80484cf:	56                   	push   esi
 80484d0:	e8 db a7 02 00       	call   8072cb0 <listen>
 80484d5:	83 c4 10             	add    esp,0x10
 80484d8:	83 c0 01             	add    eax,0x1
 80484db:	0f 84 b2 01 00 00    	je     8048693 <main+0x2a3>
 80484e1:	89 f0                	mov    eax,esi
 80484e3:	e8 28 09 00 00       	call   8048e10 <set_nonblock>
 80484e8:	83 ec 0c             	sub    esp,0xc
 80484eb:	6a 01                	push   0x1
 80484ed:	e8 9e a5 02 00       	call   8072a90 <epoll_create>
 80484f2:	c7 c2 e8 09 0f 08    	mov    edx,0x80f09e8
 80484f8:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
 80484ff:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
 8048506:	c7 45 c0 01 00 00 00 	mov    DWORD PTR [ebp-0x40],0x1
 804850d:	89 02                	mov    DWORD PTR [edx],eax
 804850f:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
 8048512:	8d 55 c0             	lea    edx,[ebp-0x40]
 8048515:	52                   	push   edx
 8048516:	56                   	push   esi
 8048517:	6a 01                	push   0x1
 8048519:	50                   	push   eax
 804851a:	e8 91 a5 02 00       	call   8072ab0 <epoll_ctl>
 804851f:	83 c4 20             	add    esp,0x20
 8048522:	83 c0 01             	add    eax,0x1
 8048525:	0f 84 41 02 00 00    	je     804876c <main+0x37c>
 804852b:	c7 c0 b8 f4 0e 08    	mov    eax,0x80ef4b8
 8048531:	83 ec 0c             	sub    esp,0xc
 8048534:	ff 30                	push   DWORD PTR [eax]
 8048536:	e8 55 98 00 00       	call   8051d90 <setlinebuf>
 804853b:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
 804853f:	66 c1 c8 08          	ror    ax,0x8
 8048543:	0f b7 c0             	movzx  eax,ax
 8048546:	5a                   	pop    edx
 8048547:	59                   	pop    ecx
 8048548:	50                   	push   eax
 8048549:	8d 83 c8 0e fd ff    	lea    eax,[ebx-0x2f138]
 804854f:	50                   	push   eax
 8048550:	e8 7b 79 00 00       	call   804fed0 <_IO_printf>
 8048555:	8d 45 cc             	lea    eax,[ebp-0x34]
 8048558:	83 c4 10             	add    esp,0x10
 804855b:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
 804855e:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
 8048561:	8d 83 6c 12 fd ff    	lea    eax,[ebx-0x2ed94]
 8048567:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
 804856a:	8d 83 fe 53 fe ff    	lea    eax,[ebx-0x1ac02]
 8048570:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
 8048573:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 8048576:	6a ff                	push   0xffffffff
 8048578:	6a 01                	push   0x1
 804857a:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
 804857d:	ff 30                	push   DWORD PTR [eax]
 804857f:	e8 5c a5 02 00       	call   8072ae0 <epoll_wait>
 8048584:	83 c4 10             	add    esp,0x10
 8048587:	85 c0                	test   eax,eax
 8048589:	74 e8                	je     8048573 <main+0x183>
 804858b:	83 c0 01             	add    eax,0x1
 804858e:	0f 84 e1 00 00 00    	je     8048675 <main+0x285>
 8048594:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
 8048597:	85 f6                	test   esi,esi
 8048599:	0f 84 dd 01 00 00    	je     804877c <main+0x38c>
 804859f:	8b 46 2c             	mov    eax,DWORD PTR [esi+0x2c]
 80485a2:	85 c0                	test   eax,eax
 80485a4:	0f 84 f9 00 00 00    	je     80486a3 <main+0x2b3>
 80485aa:	83 e8 01             	sub    eax,0x1
 80485ad:	75 0c                	jne    80485bb <main+0x1cb>
 80485af:	83 ec 0c             	sub    esp,0xc
 80485b2:	56                   	push   esi
 80485b3:	e8 c8 08 00 00       	call   8048e80 <client_send_response>
 80485b8:	83 c4 10             	add    esp,0x10
 80485bb:	80 7e 40 00          	cmp    BYTE PTR [esi+0x40],0x0
 80485bf:	74 b2                	je     8048573 <main+0x183>
 80485c1:	83 ec 0c             	sub    esp,0xc
 80485c4:	0f b7 7e 06          	movzx  edi,WORD PTR [esi+0x6]
 80485c8:	ff 76 08             	push   DWORD PTR [esi+0x8]
 80485cb:	66 c1 cf 08          	ror    di,0x8
 80485cf:	e8 5c ae 02 00       	call   8073430 <inet_ntoa>
 80485d4:	0f b7 ff             	movzx  edi,di
 80485d7:	83 c4 0c             	add    esp,0xc
 80485da:	57                   	push   edi
 80485db:	50                   	push   eax
 80485dc:	ff 75 ac             	push   DWORD PTR [ebp-0x54]
 80485df:	e8 ec 78 00 00       	call   804fed0 <_IO_printf>
 80485e4:	58                   	pop    eax
 80485e5:	ff 36                	push   DWORD PTR [esi]
 80485e7:	e8 a4 84 02 00       	call   8070a90 <__libc_close>
 80485ec:	5a                   	pop    edx
 80485ed:	ff 76 20             	push   DWORD PTR [esi+0x20]
 80485f0:	e8 6b 2c 01 00       	call   805b260 <__cfree>
 80485f5:	59                   	pop    ecx
 80485f6:	ff 76 30             	push   DWORD PTR [esi+0x30]
 80485f9:	e8 62 2c 01 00       	call   805b260 <__cfree>
 80485fe:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
 8048601:	83 c4 10             	add    esp,0x10
 8048604:	85 c0                	test   eax,eax
 8048606:	7e 0c                	jle    8048614 <main+0x224>
 8048608:	83 ec 0c             	sub    esp,0xc
 804860b:	50                   	push   eax
 804860c:	e8 7f 84 02 00       	call   8070a90 <__libc_close>
 8048611:	83 c4 10             	add    esp,0x10
 8048614:	83 ec 0c             	sub    esp,0xc
 8048617:	56                   	push   esi
 8048618:	e8 43 2c 01 00       	call   805b260 <__cfree>
 804861d:	83 c4 10             	add    esp,0x10
 8048620:	e9 4e ff ff ff       	jmp    8048573 <main+0x183>
 8048625:	8d 83 bc 10 fd ff    	lea    eax,[ebx-0x2ef44]
 804862b:	56                   	push   esi
 804862c:	56                   	push   esi
 804862d:	50                   	push   eax
 804862e:	6a 01                	push   0x1
 8048630:	e8 6b 9d 02 00       	call   80723a0 <err>
 8048635:	50                   	push   eax
 8048636:	50                   	push   eax
 8048637:	8d 83 9f 0e fd ff    	lea    eax,[ebx-0x2f161]
 804863d:	50                   	push   eax
 804863e:	6a 01                	push   0x1
 8048640:	e8 5b 9d 02 00       	call   80723a0 <err>
 8048645:	50                   	push   eax
 8048646:	50                   	push   eax
 8048647:	8d 83 24 11 fd ff    	lea    eax,[ebx-0x2eedc]
 804864d:	50                   	push   eax
 804864e:	6a 01                	push   0x1
 8048650:	e8 4b 9d 02 00       	call   80723a0 <err>
 8048655:	8d 83 dc 10 fd ff    	lea    eax,[ebx-0x2ef24]
 804865b:	51                   	push   ecx
 804865c:	51                   	push   ecx
 804865d:	50                   	push   eax
 804865e:	6a 01                	push   0x1
 8048660:	e8 3b 9d 02 00       	call   80723a0 <err>
 8048665:	50                   	push   eax
 8048666:	50                   	push   eax
 8048667:	8d 83 9c 10 fd ff    	lea    eax,[ebx-0x2ef64]
 804866d:	50                   	push   eax
 804866e:	6a 01                	push   0x1
 8048670:	e8 2b 9d 02 00       	call   80723a0 <err>
 8048675:	e8 16 1c 00 00       	call   804a290 <__errno_location>
 804867a:	83 38 04             	cmp    DWORD PTR [eax],0x4
 804867d:	0f 84 f0 fe ff ff    	je     8048573 <main+0x183>
 8048683:	50                   	push   eax
 8048684:	50                   	push   eax
 8048685:	8d 83 de 0e fd ff    	lea    eax,[ebx-0x2f122]
 804868b:	50                   	push   eax
 804868c:	6a 01                	push   0x1
 804868e:	e8 0d 9d 02 00       	call   80723a0 <err>
 8048693:	8d 83 b7 0e fd ff    	lea    eax,[ebx-0x2f149]
 8048699:	57                   	push   edi
 804869a:	57                   	push   edi
 804869b:	50                   	push   eax
 804869c:	6a 01                	push   0x1
 804869e:	e8 fd 9c 02 00       	call   80723a0 <err>
 80486a3:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
 80486a6:	3b 46 24             	cmp    eax,DWORD PTR [esi+0x24]
 80486a9:	0f 84 7e 01 00 00    	je     804882d <main+0x43d>
 80486af:	8b 4e 24             	mov    ecx,DWORD PTR [esi+0x24]
 80486b2:	83 e8 01             	sub    eax,0x1
 80486b5:	57                   	push   edi
 80486b6:	29 c8                	sub    eax,ecx
 80486b8:	03 4e 20             	add    ecx,DWORD PTR [esi+0x20]
 80486bb:	50                   	push   eax
 80486bc:	51                   	push   ecx
 80486bd:	ff 36                	push   DWORD PTR [esi]
 80486bf:	e8 9c 81 02 00       	call   8070860 <__libc_read>
 80486c4:	83 c4 10             	add    esp,0x10
 80486c7:	83 f8 ff             	cmp    eax,0xffffffff
 80486ca:	0f 84 8c 01 00 00    	je     804885c <main+0x46c>
 80486d0:	8b 4e 24             	mov    ecx,DWORD PTR [esi+0x24]
 80486d3:	8b 7e 20             	mov    edi,DWORD PTR [esi+0x20]
 80486d6:	01 c1                	add    ecx,eax
 80486d8:	85 c0                	test   eax,eax
 80486da:	89 4e 24             	mov    DWORD PTR [esi+0x24],ecx
 80486dd:	c6 04 0f 00          	mov    BYTE PTR [edi+ecx*1],0x0
 80486e1:	75 2e                	jne    8048711 <main+0x321>
 80486e3:	0f b7 7e 06          	movzx  edi,WORD PTR [esi+0x6]
 80486e7:	83 ec 0c             	sub    esp,0xc
 80486ea:	ff 76 08             	push   DWORD PTR [esi+0x8]
 80486ed:	66 c1 cf 08          	ror    di,0x8
 80486f1:	e8 3a ad 02 00       	call   8073430 <inet_ntoa>
 80486f6:	0f b7 ff             	movzx  edi,di
 80486f9:	83 c4 0c             	add    esp,0xc
 80486fc:	57                   	push   edi
 80486fd:	50                   	push   eax
 80486fe:	8d 83 44 12 fd ff    	lea    eax,[ebx-0x2edbc]
 8048704:	50                   	push   eax
 8048705:	e8 c6 77 00 00       	call   804fed0 <_IO_printf>
 804870a:	c6 46 40 01          	mov    BYTE PTR [esi+0x40],0x1
 804870e:	83 c4 10             	add    esp,0x10
 8048711:	8b 4e 20             	mov    ecx,DWORD PTR [esi+0x20]
 8048714:	8b 7e 24             	mov    edi,DWORD PTR [esi+0x24]
 8048717:	6a 02                	push   0x2
 8048719:	ff 75 a8             	push   DWORD PTR [ebp-0x58]
 804871c:	57                   	push   edi
 804871d:	51                   	push   ecx
 804871e:	89 4d a0             	mov    DWORD PTR [ebp-0x60],ecx
 8048721:	e8 fa 62 01 00       	call   805ea20 <__memmem>
 8048726:	83 c4 10             	add    esp,0x10
 8048729:	85 c0                	test   eax,eax
 804872b:	74 18                	je     8048745 <main+0x355>
 804872d:	83 ec 0c             	sub    esp,0xc
 8048730:	c7 46 2c 01 00 00 00 	mov    DWORD PTR [esi+0x2c],0x1
 8048737:	56                   	push   esi
 8048738:	e8 53 0b 00 00       	call   8049290 <client_process_request>
 804873d:	83 c4 10             	add    esp,0x10
 8048740:	e9 76 fe ff ff       	jmp    80485bb <main+0x1cb>
 8048745:	8b 4d a0             	mov    ecx,DWORD PTR [ebp-0x60]
 8048748:	8d 83 02 0f fd ff    	lea    eax,[ebx-0x2f0fe]
 804874e:	6a 04                	push   0x4
 8048750:	50                   	push   eax
 8048751:	57                   	push   edi
 8048752:	51                   	push   ecx
 8048753:	e8 c8 62 01 00       	call   805ea20 <__memmem>
 8048758:	83 c4 10             	add    esp,0x10
 804875b:	85 c0                	test   eax,eax
 804875d:	75 ce                	jne    804872d <main+0x33d>
 804875f:	81 ff 00 00 01 00    	cmp    edi,0x10000
 8048765:	77 c6                	ja     804872d <main+0x33d>
 8048767:	e9 4f fe ff ff       	jmp    80485bb <main+0x1cb>
 804876c:	8d 83 58 11 fd ff    	lea    eax,[ebx-0x2eea8]
 8048772:	56                   	push   esi
 8048773:	56                   	push   esi
 8048774:	50                   	push   eax
 8048775:	6a 01                	push   0x1
 8048777:	e8 24 9c 02 00       	call   80723a0 <err>
 804877c:	57                   	push   edi
 804877d:	57                   	push   edi
 804877e:	6a 44                	push   0x44
 8048780:	6a 01                	push   0x1
 8048782:	e8 49 2e 01 00       	call   805b5d0 <__calloc>
 8048787:	89 c7                	mov    edi,eax
 8048789:	c7 40 28 00 04 00 00 	mov    DWORD PTR [eax+0x28],0x400
 8048790:	c7 04 24 00 04 00 00 	mov    DWORD PTR [esp],0x400
 8048797:	e8 84 27 01 00       	call   805af20 <__libc_malloc>
 804879c:	8d 55 b8             	lea    edx,[ebp-0x48]
 804879f:	89 47 20             	mov    DWORD PTR [edi+0x20],eax
 80487a2:	8d 47 04             	lea    eax,[edi+0x4]
 80487a5:	83 c4 0c             	add    esp,0xc
 80487a8:	c7 45 b8 10 00 00 00 	mov    DWORD PTR [ebp-0x48],0x10
 80487af:	52                   	push   edx
 80487b0:	50                   	push   eax
 80487b1:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 80487b4:	e8 f7 a3 02 00       	call   8072bb0 <__libc_accept>
 80487b9:	83 c4 10             	add    esp,0x10
 80487bc:	83 f8 ff             	cmp    eax,0xffffffff
 80487bf:	0f 84 87 00 00 00    	je     804884c <main+0x45c>
 80487c5:	83 ec 0c             	sub    esp,0xc
 80487c8:	0f b7 77 06          	movzx  esi,WORD PTR [edi+0x6]
 80487cc:	89 07                	mov    DWORD PTR [edi],eax
 80487ce:	ff 77 08             	push   DWORD PTR [edi+0x8]
 80487d1:	66 c1 ce 08          	ror    si,0x8
 80487d5:	e8 56 ac 02 00       	call   8073430 <inet_ntoa>
 80487da:	83 c4 0c             	add    esp,0xc
 80487dd:	0f b7 d6             	movzx  edx,si
 80487e0:	52                   	push   edx
 80487e1:	50                   	push   eax
 80487e2:	8d 83 e9 0e fd ff    	lea    eax,[ebx-0x2f117]
 80487e8:	50                   	push   eax
 80487e9:	e8 e2 76 00 00       	call   804fed0 <_IO_printf>
 80487ee:	8b 07                	mov    eax,DWORD PTR [edi]
 80487f0:	e8 1b 06 00 00       	call   8048e10 <set_nonblock>
 80487f5:	8d 47 14             	lea    eax,[edi+0x14]
 80487f8:	c7 47 14 01 00 00 00 	mov    DWORD PTR [edi+0x14],0x1
 80487ff:	89 7f 18             	mov    DWORD PTR [edi+0x18],edi
 8048802:	50                   	push   eax
 8048803:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 8048806:	ff 37                	push   DWORD PTR [edi]
 8048808:	6a 01                	push   0x1
 804880a:	ff 30                	push   DWORD PTR [eax]
 804880c:	e8 9f a2 02 00       	call   8072ab0 <epoll_ctl>
 8048811:	83 c4 20             	add    esp,0x20
 8048814:	83 c0 01             	add    eax,0x1
 8048817:	0f 85 56 fd ff ff    	jne    8048573 <main+0x183>
 804881d:	8d 83 c8 11 fd ff    	lea    eax,[ebx-0x2ee38]
 8048823:	51                   	push   ecx
 8048824:	51                   	push   ecx
 8048825:	50                   	push   eax
 8048826:	6a 01                	push   0x1
 8048828:	e8 73 9b 02 00       	call   80723a0 <err>
 804882d:	8b 4e 20             	mov    ecx,DWORD PTR [esi+0x20]
 8048830:	01 c0                	add    eax,eax
 8048832:	89 46 28             	mov    DWORD PTR [esi+0x28],eax
 8048835:	52                   	push   edx
 8048836:	52                   	push   edx
 8048837:	50                   	push   eax
 8048838:	51                   	push   ecx
 8048839:	e8 b2 2a 01 00       	call   805b2f0 <__libc_realloc>
 804883e:	83 c4 10             	add    esp,0x10
 8048841:	89 46 20             	mov    DWORD PTR [esi+0x20],eax
 8048844:	8b 46 28             	mov    eax,DWORD PTR [esi+0x28]
 8048847:	e9 63 fe ff ff       	jmp    80486af <main+0x2bf>
 804884c:	8d 83 90 11 fd ff    	lea    eax,[ebx-0x2ee70]
 8048852:	56                   	push   esi
 8048853:	56                   	push   esi
 8048854:	50                   	push   eax
 8048855:	6a 01                	push   0x1
 8048857:	e8 44 9b 02 00       	call   80723a0 <err>
 804885c:	8d 83 fc 11 fd ff    	lea    eax,[ebx-0x2ee04]
 8048862:	56                   	push   esi
 8048863:	56                   	push   esi
 8048864:	50                   	push   eax
 8048865:	6a 01                	push   0x1
 8048867:	e8 34 9b 02 00       	call   80723a0 <err>
 804886c:	66 90                	xchg   ax,ax
 804886e:	66 90                	xchg   ax,ax

08048870 <init_cacheinfo>:
 8048870:	55                   	push   ebp
 8048871:	57                   	push   edi
 8048872:	56                   	push   esi
 8048873:	53                   	push   ebx
 8048874:	83 ec 2c             	sub    esp,0x2c
 8048877:	a1 60 05 0f 08       	mov    eax,ds:0x80f0560
 804887c:	83 f8 01             	cmp    eax,0x1
 804887f:	74 21                	je     80488a2 <init_cacheinfo+0x32>
 8048881:	83 f8 02             	cmp    eax,0x2
 8048884:	0f 84 a8 01 00 00    	je     8048a32 <init_cacheinfo+0x1c2>
 804888a:	8b 3d 80 f9 0e 08    	mov    edi,DWORD PTR ds:0x80ef980
 8048890:	8d 04 7f             	lea    eax,[edi+edi*2]
 8048893:	01 c0                	add    eax,eax
 8048895:	a3 40 0c 0f 08       	mov    ds:0x80f0c40,eax
 804889a:	83 c4 2c             	add    esp,0x2c
 804889d:	5b                   	pop    ebx
 804889e:	5e                   	pop    esi
 804889f:	5f                   	pop    edi
 80488a0:	5d                   	pop    ebp
 80488a1:	c3                   	ret
 80488a2:	8b 15 64 05 0f 08    	mov    edx,DWORD PTR ds:0x80f0564
 80488a8:	b8 bc 00 00 00       	mov    eax,0xbc
 80488ad:	e8 ce 6a 02 00       	call   806f380 <handle_intel>
 80488b2:	8b 15 64 05 0f 08    	mov    edx,DWORD PTR ds:0x80f0564
 80488b8:	89 c5                	mov    ebp,eax
 80488ba:	b8 bf 00 00 00       	mov    eax,0xbf
 80488bf:	e8 bc 6a 02 00       	call   806f380 <handle_intel>
 80488c4:	8b 15 64 05 0f 08    	mov    edx,DWORD PTR ds:0x80f0564
 80488ca:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 80488ce:	b8 c2 00 00 00       	mov    eax,0xc2
 80488d3:	e8 a8 6a 02 00       	call   806f380 <handle_intel>
 80488d8:	85 c0                	test   eax,eax
 80488da:	89 c7                	mov    edi,eax
 80488dc:	0f 8e a6 02 00 00    	jle    8048b88 <init_cacheinfo+0x318>
 80488e2:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
 80488e9:	00 
 80488ea:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
 80488f1:	00 
 80488f2:	f6 05 77 05 0f 08 10 	test   BYTE PTR ds:0x80f0577,0x10
 80488f9:	0f 84 da 00 00 00    	je     80489d9 <init_cacheinfo+0x169>
 80488ff:	a1 64 05 0f 08       	mov    eax,ds:0x80f0564
 8048904:	83 f8 03             	cmp    eax,0x3
 8048907:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
 804890b:	0f 8e 86 00 00 00    	jle    8048997 <init_cacheinfo+0x127>
 8048911:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 8048916:	bb 03 00 00 00       	mov    ebx,0x3
 804891b:	74 0d                	je     804892a <init_cacheinfo+0xba>
 804891d:	bb 01 00 00 00       	mov    ebx,0x1
 8048922:	c7 44 24 08 ff ff ff 	mov    DWORD PTR [esp+0x8],0xffffffff
 8048929:	ff 
 804892a:	89 6c 24 1c          	mov    DWORD PTR [esp+0x1c],ebp
 804892e:	31 c9                	xor    ecx,ecx
 8048930:	89 fd                	mov    ebp,edi
 8048932:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 8048939:	00 
 804893a:	c6 44 24 13 01       	mov    BYTE PTR [esp+0x13],0x1
 804893f:	89 df                	mov    edi,ebx
 8048941:	8d 71 01             	lea    esi,[ecx+0x1]
 8048944:	b8 04 00 00 00       	mov    eax,0x4
 8048949:	0f a2                	cpuid
 804894b:	a8 1f                	test   al,0x1f
 804894d:	0f 84 78 02 00 00    	je     8048bcb <init_cacheinfo+0x35b>
 8048953:	89 c1                	mov    ecx,eax
 8048955:	c1 e9 05             	shr    ecx,0x5
 8048958:	83 e1 07             	and    ecx,0x7
 804895b:	83 f9 02             	cmp    ecx,0x2
 804895e:	0f 84 04 02 00 00    	je     8048b68 <init_cacheinfo+0x2f8>
 8048964:	83 f9 03             	cmp    ecx,0x3
 8048967:	75 2a                	jne    8048993 <init_cacheinfo+0x123>
 8048969:	f7 c7 02 00 00 00    	test   edi,0x2
 804896f:	74 22                	je     8048993 <init_cacheinfo+0x123>
 8048971:	c1 e8 0e             	shr    eax,0xe
 8048974:	d1 ea                	shr    edx,1
 8048976:	83 e7 fd             	and    edi,0xfffffffd
 8048979:	25 ff 03 00 00       	and    eax,0x3ff
 804897e:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 8048982:	89 d0                	mov    eax,edx
 8048984:	83 e0 01             	and    eax,0x1
 8048987:	88 44 24 13          	mov    BYTE PTR [esp+0x13],al
 804898b:	85 ff                	test   edi,edi
 804898d:	0f 84 1c 01 00 00    	je     8048aaf <init_cacheinfo+0x23f>
 8048993:	89 f1                	mov    ecx,esi
 8048995:	eb aa                	jmp    8048941 <init_cacheinfo+0xd1>
 8048997:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 804899e:	00 
 804899f:	c6 44 24 13 01       	mov    BYTE PTR [esp+0x13],0x1
 80489a4:	0f b6 0d 6e 05 0f 08 	movzx  ecx,BYTE PTR ds:0x80f056e
 80489ab:	85 ff                	test   edi,edi
 80489ad:	7e 0c                	jle    80489bb <init_cacheinfo+0x14b>
 80489af:	85 c9                	test   ecx,ecx
 80489b1:	74 08                	je     80489bb <init_cacheinfo+0x14b>
 80489b3:	89 f8                	mov    eax,edi
 80489b5:	31 d2                	xor    edx,edx
 80489b7:	f7 f1                	div    ecx
 80489b9:	89 c7                	mov    edi,eax
 80489bb:	80 7c 24 13 00       	cmp    BYTE PTR [esp+0x13],0x0
 80489c0:	75 17                	jne    80489d9 <init_cacheinfo+0x169>
 80489c2:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
 80489c6:	85 db                	test   ebx,ebx
 80489c8:	74 0b                	je     80489d5 <init_cacheinfo+0x165>
 80489ca:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 80489ce:	99                   	cdq
 80489cf:	f7 fb                	idiv   ebx
 80489d1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 80489d5:	03 7c 24 04          	add    edi,DWORD PTR [esp+0x4]
 80489d9:	85 ed                	test   ebp,ebp
 80489db:	7e 24                	jle    8048a01 <init_cacheinfo+0x191>
 80489dd:	89 e8                	mov    eax,ebp
 80489df:	89 2d 88 f9 0e 08    	mov    DWORD PTR ds:0x80ef988,ebp
 80489e5:	81 e5 00 ff ff ff    	and    ebp,0xffffff00
 80489eb:	d1 f8                	sar    eax,1
 80489ed:	89 2d 90 f9 0e 08    	mov    DWORD PTR ds:0x80ef990,ebp
 80489f3:	a3 8c f9 0e 08       	mov    ds:0x80ef98c,eax
 80489f8:	89 e8                	mov    eax,ebp
 80489fa:	d1 f8                	sar    eax,1
 80489fc:	a3 94 f9 0e 08       	mov    ds:0x80ef994,eax
 8048a01:	85 ff                	test   edi,edi
 8048a03:	0f 8e 81 fe ff ff    	jle    804888a <init_cacheinfo+0x1a>
 8048a09:	89 f8                	mov    eax,edi
 8048a0b:	89 3d 78 f9 0e 08    	mov    DWORD PTR ds:0x80ef978,edi
 8048a11:	81 e7 00 ff ff ff    	and    edi,0xffffff00
 8048a17:	d1 f8                	sar    eax,1
 8048a19:	89 3d 80 f9 0e 08    	mov    DWORD PTR ds:0x80ef980,edi
 8048a1f:	a3 7c f9 0e 08       	mov    ds:0x80ef97c,eax
 8048a24:	89 f8                	mov    eax,edi
 8048a26:	d1 f8                	sar    eax,1
 8048a28:	a3 84 f9 0e 08       	mov    ds:0x80ef984,eax
 8048a2d:	e9 5e fe ff ff       	jmp    8048890 <init_cacheinfo+0x20>
 8048a32:	b8 bc 00 00 00       	mov    eax,0xbc
 8048a37:	e8 64 6a 02 00       	call   806f4a0 <handle_amd>
 8048a3c:	89 c5                	mov    ebp,eax
 8048a3e:	b8 bf 00 00 00       	mov    eax,0xbf
 8048a43:	e8 58 6a 02 00       	call   806f4a0 <handle_amd>
 8048a48:	89 c7                	mov    edi,eax
 8048a4a:	b8 c2 00 00 00       	mov    eax,0xc2
 8048a4f:	e8 4c 6a 02 00       	call   806f4a0 <handle_amd>
 8048a54:	89 c6                	mov    esi,eax
 8048a56:	b8 00 00 00 80       	mov    eax,0x80000000
 8048a5b:	0f a2                	cpuid
 8048a5d:	85 f6                	test   esi,esi
 8048a5f:	0f 8e 74 ff ff ff    	jle    80489d9 <init_cacheinfo+0x169>
 8048a65:	3d 07 00 00 80       	cmp    eax,0x80000007
 8048a6a:	76 23                	jbe    8048a8f <init_cacheinfo+0x21f>
 8048a6c:	b8 08 00 00 80       	mov    eax,0x80000008
 8048a71:	0f a2                	cpuid
 8048a73:	c1 e9 0c             	shr    ecx,0xc
 8048a76:	bb 01 00 00 00       	mov    ebx,0x1
 8048a7b:	83 e1 0f             	and    ecx,0xf
 8048a7e:	d3 e3                	shl    ebx,cl
 8048a80:	89 f0                	mov    eax,esi
 8048a82:	31 d2                	xor    edx,edx
 8048a84:	f7 f3                	div    ebx
 8048a86:	89 c6                	mov    esi,eax
 8048a88:	01 f7                	add    edi,esi
 8048a8a:	e9 4a ff ff ff       	jmp    80489d9 <init_cacheinfo+0x169>
 8048a8f:	b8 01 00 00 00       	mov    eax,0x1
 8048a94:	0f a2                	cpuid
 8048a96:	81 e2 00 00 00 10    	and    edx,0x10000000
 8048a9c:	74 ea                	je     8048a88 <init_cacheinfo+0x218>
 8048a9e:	c1 eb 10             	shr    ebx,0x10
 8048aa1:	0f b6 db             	movzx  ebx,bl
 8048aa4:	85 db                	test   ebx,ebx
 8048aa6:	75 d8                	jne    8048a80 <init_cacheinfo+0x210>
 8048aa8:	01 f7                	add    edi,esi
 8048aaa:	e9 2a ff ff ff       	jmp    80489d9 <init_cacheinfo+0x169>
 8048aaf:	83 7c 24 18 0a       	cmp    DWORD PTR [esp+0x18],0xa
 8048ab4:	89 fb                	mov    ebx,edi
 8048ab6:	89 ef                	mov    edi,ebp
 8048ab8:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
 8048abc:	0f 8e 1a 01 00 00    	jle    8048bdc <init_cacheinfo+0x36c>
 8048ac2:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 8048ac7:	b8 01 00 00 00       	mov    eax,0x1
 8048acc:	0f 9f c1             	setg   cl
 8048acf:	31 d2                	xor    edx,edx
 8048ad1:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
 8048ad6:	0f 94 c2             	sete   dl
 8048ad9:	21 ca                	and    edx,ecx
 8048adb:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 8048ae0:	0f 8e aa 01 00 00    	jle    8048c90 <init_cacheinfo+0x420>
 8048ae6:	0f b6 c0             	movzx  eax,al
 8048ae9:	89 6c 24 18          	mov    DWORD PTR [esp+0x18],ebp
 8048aed:	89 d9                	mov    ecx,ebx
 8048aef:	01 c0                	add    eax,eax
 8048af1:	89 fd                	mov    ebp,edi
 8048af3:	09 d0                	or     eax,edx
 8048af5:	89 c6                	mov    esi,eax
 8048af7:	85 f6                	test   esi,esi
 8048af9:	0f 84 d7 00 00 00    	je     8048bd6 <init_cacheinfo+0x366>
 8048aff:	8d 79 01             	lea    edi,[ecx+0x1]
 8048b02:	b8 0b 00 00 00       	mov    eax,0xb
 8048b07:	0f a2                	cpuid
 8048b09:	0f b6 db             	movzx  ebx,bl
 8048b0c:	81 e1 00 ff 00 00    	and    ecx,0xff00
 8048b12:	85 db                	test   ebx,ebx
 8048b14:	0f 84 bc 00 00 00    	je     8048bd6 <init_cacheinfo+0x366>
 8048b1a:	85 c9                	test   ecx,ecx
 8048b1c:	0f 84 b4 00 00 00    	je     8048bd6 <init_cacheinfo+0x366>
 8048b22:	81 f9 00 01 00 00    	cmp    ecx,0x100
 8048b28:	74 77                	je     8048ba1 <init_cacheinfo+0x331>
 8048b2a:	81 f9 00 02 00 00    	cmp    ecx,0x200
 8048b30:	74 04                	je     8048b36 <init_cacheinfo+0x2c6>
 8048b32:	89 f9                	mov    ecx,edi
 8048b34:	eb c1                	jmp    8048af7 <init_cacheinfo+0x287>
 8048b36:	f7 c6 02 00 00 00    	test   esi,0x2
 8048b3c:	74 f4                	je     8048b32 <init_cacheinfo+0x2c2>
 8048b3e:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
 8048b43:	0f 84 2a 01 00 00    	je     8048c73 <init_cacheinfo+0x403>
 8048b49:	0f bd 4c 24 08       	bsr    ecx,DWORD PTR [esp+0x8]
 8048b4e:	83 c8 ff             	or     eax,0xffffffff
 8048b51:	83 c1 01             	add    ecx,0x1
 8048b54:	83 eb 01             	sub    ebx,0x1
 8048b57:	d3 e0                	shl    eax,cl
 8048b59:	f7 d0                	not    eax
 8048b5b:	21 d8                	and    eax,ebx
 8048b5d:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 8048b61:	83 e6 fd             	and    esi,0xfffffffd
 8048b64:	89 f9                	mov    ecx,edi
 8048b66:	eb 8f                	jmp    8048af7 <init_cacheinfo+0x287>
 8048b68:	f7 c7 01 00 00 00    	test   edi,0x1
 8048b6e:	0f 84 1f fe ff ff    	je     8048993 <init_cacheinfo+0x123>
 8048b74:	c1 e8 0e             	shr    eax,0xe
 8048b77:	83 e7 fe             	and    edi,0xfffffffe
 8048b7a:	25 ff 03 00 00       	and    eax,0x3ff
 8048b7f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 8048b83:	e9 03 fe ff ff       	jmp    804898b <init_cacheinfo+0x11b>
 8048b88:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
 8048b8c:	c7 44 24 08 ff ff ff 	mov    DWORD PTR [esp+0x8],0xffffffff
 8048b93:	ff 
 8048b94:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
 8048b9b:	00 
 8048b9c:	e9 51 fd ff ff       	jmp    80488f2 <init_cacheinfo+0x82>
 8048ba1:	f7 c6 01 00 00 00    	test   esi,0x1
 8048ba7:	74 89                	je     8048b32 <init_cacheinfo+0x2c2>
 8048ba9:	0f bd 4c 24 0c       	bsr    ecx,DWORD PTR [esp+0xc]
 8048bae:	83 c8 ff             	or     eax,0xffffffff
 8048bb1:	83 c1 01             	add    ecx,0x1
 8048bb4:	83 eb 01             	sub    ebx,0x1
 8048bb7:	d3 e0                	shl    eax,cl
 8048bb9:	83 e6 fe             	and    esi,0xfffffffe
 8048bbc:	89 f9                	mov    ecx,edi
 8048bbe:	f7 d0                	not    eax
 8048bc0:	21 d8                	and    eax,ebx
 8048bc2:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 8048bc6:	e9 2c ff ff ff       	jmp    8048af7 <init_cacheinfo+0x287>
 8048bcb:	89 ef                	mov    edi,ebp
 8048bcd:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
 8048bd1:	e9 ce fd ff ff       	jmp    80489a4 <init_cacheinfo+0x134>
 8048bd6:	89 ef                	mov    edi,ebp
 8048bd8:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
 8048bdc:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 8048be0:	83 f8 01             	cmp    eax,0x1
 8048be3:	83 d8 ff             	sbb    eax,0xffffffff
 8048be6:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 8048bea:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 8048bee:	85 c0                	test   eax,eax
 8048bf0:	7e 57                	jle    8048c49 <init_cacheinfo+0x3d9>
 8048bf2:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
 8048bf7:	75 46                	jne    8048c3f <init_cacheinfo+0x3cf>
 8048bf9:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 8048bfd:	8b 15 98 05 0f 08    	mov    edx,DWORD PTR ds:0x80f0598
 8048c03:	a1 9c 05 0f 08       	mov    eax,ds:0x80f059c
 8048c08:	85 f6                	test   esi,esi
 8048c0a:	74 57                	je     8048c63 <init_cacheinfo+0x3f3>
 8048c0c:	83 fe 02             	cmp    esi,0x2
 8048c0f:	89 f1                	mov    ecx,esi
 8048c11:	0f 86 94 fd ff ff    	jbe    80489ab <init_cacheinfo+0x13b>
 8048c17:	83 fa 06             	cmp    edx,0x6
 8048c1a:	0f 85 8b fd ff ff    	jne    80489ab <init_cacheinfo+0x13b>
 8048c20:	83 f8 4d             	cmp    eax,0x4d
 8048c23:	74 10                	je     8048c35 <init_cacheinfo+0x3c5>
 8048c25:	77 78                	ja     8048c9f <init_cacheinfo+0x42f>
 8048c27:	83 f8 37             	cmp    eax,0x37
 8048c2a:	74 09                	je     8048c35 <init_cacheinfo+0x3c5>
 8048c2c:	83 f8 4a             	cmp    eax,0x4a
 8048c2f:	0f 85 76 fd ff ff    	jne    80489ab <init_cacheinfo+0x13b>
 8048c35:	b9 02 00 00 00       	mov    ecx,0x2
 8048c3a:	e9 6c fd ff ff       	jmp    80489ab <init_cacheinfo+0x13b>
 8048c3f:	89 c1                	mov    ecx,eax
 8048c41:	83 c1 01             	add    ecx,0x1
 8048c44:	e9 62 fd ff ff       	jmp    80489ab <init_cacheinfo+0x13b>
 8048c49:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
 8048c4e:	74 a9                	je     8048bf9 <init_cacheinfo+0x389>
 8048c50:	83 c9 ff             	or     ecx,0xffffffff
 8048c53:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 8048c58:	0f 84 5d fd ff ff    	je     80489bb <init_cacheinfo+0x14b>
 8048c5e:	e9 48 fd ff ff       	jmp    80489ab <init_cacheinfo+0x13b>
 8048c63:	80 7c 24 13 00       	cmp    BYTE PTR [esp+0x13],0x0
 8048c68:	0f 84 67 fd ff ff    	je     80489d5 <init_cacheinfo+0x165>
 8048c6e:	e9 66 fd ff ff       	jmp    80489d9 <init_cacheinfo+0x169>
 8048c73:	0f bd 4c 24 0c       	bsr    ecx,DWORD PTR [esp+0xc]
 8048c78:	83 c8 ff             	or     eax,0xffffffff
 8048c7b:	83 c1 01             	add    ecx,0x1
 8048c7e:	83 eb 01             	sub    ebx,0x1
 8048c81:	d3 e0                	shl    eax,cl
 8048c83:	f7 d0                	not    eax
 8048c85:	21 d8                	and    eax,ebx
 8048c87:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 8048c8b:	e9 d1 fe ff ff       	jmp    8048b61 <init_cacheinfo+0x2f1>
 8048c90:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
 8048c95:	0f 94 c0             	sete   al
 8048c98:	21 c8                	and    eax,ecx
 8048c9a:	e9 47 fe ff ff       	jmp    8048ae6 <init_cacheinfo+0x276>
 8048c9f:	83 f8 5a             	cmp    eax,0x5a
 8048ca2:	74 91                	je     8048c35 <init_cacheinfo+0x3c5>
 8048ca4:	83 f8 5d             	cmp    eax,0x5d
 8048ca7:	0f 85 fe fc ff ff    	jne    80489ab <init_cacheinfo+0x13b>
 8048cad:	eb 86                	jmp    8048c35 <init_cacheinfo+0x3c5>

08048caf <_start>:
 8048caf:	31 ed                	xor    ebp,ebp
 8048cb1:	5e                   	pop    esi
 8048cb2:	89 e1                	mov    ecx,esp
 8048cb4:	83 e4 f0             	and    esp,0xfffffff0
 8048cb7:	50                   	push   eax
 8048cb8:	54                   	push   esp
 8048cb9:	52                   	push   edx
 8048cba:	68 50 a2 04 08       	push   0x804a250
 8048cbf:	68 b0 a1 04 08       	push   0x804a1b0
 8048cc4:	51                   	push   ecx
 8048cc5:	56                   	push   esi
 8048cc6:	68 f0 83 04 08       	push   0x80483f0
 8048ccb:	e8 00 0f 00 00       	call   8049bd0 <__libc_start_main>
 8048cd0:	f4                   	hlt
 8048cd1:	66 90                	xchg   ax,ax
 8048cd3:	66 90                	xchg   ax,ax
 8048cd5:	66 90                	xchg   ax,ax
 8048cd7:	66 90                	xchg   ax,ax
 8048cd9:	66 90                	xchg   ax,ax
 8048cdb:	66 90                	xchg   ax,ax
 8048cdd:	66 90                	xchg   ax,ax
 8048cdf:	90                   	nop

08048ce0 <__x86.get_pc_thunk.bx>:
 8048ce0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 8048ce3:	c3                   	ret
 8048ce4:	66 90                	xchg   ax,ax
 8048ce6:	66 90                	xchg   ax,ax
 8048ce8:	66 90                	xchg   ax,ax
 8048cea:	66 90                	xchg   ax,ax
 8048cec:	66 90                	xchg   ax,ax
 8048cee:	66 90                	xchg   ax,ax

08048cf0 <deregister_tm_clones>:
 8048cf0:	b8 80 ff 0e 08       	mov    eax,0x80eff80
 8048cf5:	3d 80 ff 0e 08       	cmp    eax,0x80eff80
 8048cfa:	74 24                	je     8048d20 <deregister_tm_clones+0x30>
 8048cfc:	b8 00 00 00 00       	mov    eax,0x0
 8048d01:	85 c0                	test   eax,eax
 8048d03:	74 1b                	je     8048d20 <deregister_tm_clones+0x30>
 8048d05:	55                   	push   ebp
 8048d06:	89 e5                	mov    ebp,esp
 8048d08:	83 ec 14             	sub    esp,0x14
 8048d0b:	68 80 ff 0e 08       	push   0x80eff80
 8048d10:	ff d0                	call   eax
 8048d12:	83 c4 10             	add    esp,0x10
 8048d15:	c9                   	leave
 8048d16:	c3                   	ret
 8048d17:	89 f6                	mov    esi,esi
 8048d19:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 8048d20:	f3 c3                	repz ret
 8048d22:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 8048d29:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048d30 <register_tm_clones>:
 8048d30:	b8 80 ff 0e 08       	mov    eax,0x80eff80
 8048d35:	2d 80 ff 0e 08       	sub    eax,0x80eff80
 8048d3a:	c1 f8 02             	sar    eax,0x2
 8048d3d:	89 c2                	mov    edx,eax
 8048d3f:	c1 ea 1f             	shr    edx,0x1f
 8048d42:	01 d0                	add    eax,edx
 8048d44:	d1 f8                	sar    eax,1
 8048d46:	74 20                	je     8048d68 <register_tm_clones+0x38>
 8048d48:	ba 00 00 00 00       	mov    edx,0x0
 8048d4d:	85 d2                	test   edx,edx
 8048d4f:	74 17                	je     8048d68 <register_tm_clones+0x38>
 8048d51:	55                   	push   ebp
 8048d52:	89 e5                	mov    ebp,esp
 8048d54:	83 ec 10             	sub    esp,0x10
 8048d57:	50                   	push   eax
 8048d58:	68 80 ff 0e 08       	push   0x80eff80
 8048d5d:	ff d2                	call   edx
 8048d5f:	83 c4 10             	add    esp,0x10
 8048d62:	c9                   	leave
 8048d63:	c3                   	ret
 8048d64:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048d68:	f3 c3                	repz ret
 8048d6a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

08048d70 <__do_global_dtors_aux>:
 8048d70:	80 3d 80 ff 0e 08 00 	cmp    BYTE PTR ds:0x80eff80,0x0
 8048d77:	75 37                	jne    8048db0 <__do_global_dtors_aux+0x40>
 8048d79:	55                   	push   ebp
 8048d7a:	89 e5                	mov    ebp,esp
 8048d7c:	83 ec 08             	sub    esp,0x8
 8048d7f:	e8 6c ff ff ff       	call   8048cf0 <deregister_tm_clones>
 8048d84:	b8 e0 e8 0b 08       	mov    eax,0x80be8e0
 8048d89:	85 c0                	test   eax,eax
 8048d8b:	74 10                	je     8048d9d <__do_global_dtors_aux+0x2d>
 8048d8d:	83 ec 0c             	sub    esp,0xc
 8048d90:	68 dc ab 0d 08       	push   0x80dabdc
 8048d95:	e8 46 5b 07 00       	call   80be8e0 <__deregister_frame_info_bases>
 8048d9a:	83 c4 10             	add    esp,0x10
 8048d9d:	c6 05 80 ff 0e 08 01 	mov    BYTE PTR ds:0x80eff80,0x1
 8048da4:	c9                   	leave
 8048da5:	c3                   	ret
 8048da6:	8d 76 00             	lea    esi,[esi+0x0]
 8048da9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 8048db0:	f3 c3                	repz ret
 8048db2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 8048db9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048dc0 <frame_dummy>:
 8048dc0:	b8 30 e7 0b 08       	mov    eax,0x80be730
 8048dc5:	e8 00 00 00 00       	call   8048dca <frame_dummy+0xa>
 8048dca:	5a                   	pop    edx
 8048dcb:	81 c2 36 62 0a 00    	add    edx,0xa6236
 8048dd1:	85 c0                	test   eax,eax
 8048dd3:	74 2b                	je     8048e00 <frame_dummy+0x40>
 8048dd5:	55                   	push   ebp
 8048dd6:	89 e5                	mov    ebp,esp
 8048dd8:	83 ec 08             	sub    esp,0x8
 8048ddb:	52                   	push   edx
 8048ddc:	6a 00                	push   0x0
 8048dde:	68 84 ff 0e 08       	push   0x80eff84
 8048de3:	68 dc ab 0d 08       	push   0x80dabdc
 8048de8:	e8 43 59 07 00       	call   80be730 <__register_frame_info_bases>
 8048ded:	83 c4 10             	add    esp,0x10
 8048df0:	c9                   	leave
 8048df1:	e9 3a ff ff ff       	jmp    8048d30 <register_tm_clones>
 8048df6:	8d 76 00             	lea    esi,[esi+0x0]
 8048df9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 8048e00:	e9 2b ff ff ff       	jmp    8048d30 <register_tm_clones>
 8048e05:	66 90                	xchg   ax,ax
 8048e07:	66 90                	xchg   ax,ax
 8048e09:	66 90                	xchg   ax,ax
 8048e0b:	66 90                	xchg   ax,ax
 8048e0d:	66 90                	xchg   ax,ax
 8048e0f:	90                   	nop

08048e10 <set_nonblock>:
 8048e10:	56                   	push   esi
 8048e11:	53                   	push   ebx
 8048e12:	89 c6                	mov    esi,eax
 8048e14:	e8 c7 fe ff ff       	call   8048ce0 <__x86.get_pc_thunk.bx>
 8048e19:	81 c3 e7 61 0a 00    	add    ebx,0xa61e7
 8048e1f:	83 ec 08             	sub    esp,0x8
 8048e22:	6a 00                	push   0x0
 8048e24:	6a 03                	push   0x3
 8048e26:	50                   	push   eax
 8048e27:	e8 c4 7b 02 00       	call   80709f0 <__libc_fcntl>
 8048e2c:	83 c4 10             	add    esp,0x10
 8048e2f:	83 f8 ff             	cmp    eax,0xffffffff
 8048e32:	74 1d                	je     8048e51 <set_nonblock+0x41>
 8048e34:	83 ec 04             	sub    esp,0x4
 8048e37:	80 cc 08             	or     ah,0x8
 8048e3a:	50                   	push   eax
 8048e3b:	6a 04                	push   0x4
 8048e3d:	56                   	push   esi
 8048e3e:	e8 ad 7b 02 00       	call   80709f0 <__libc_fcntl>
 8048e43:	83 c4 10             	add    esp,0x10
 8048e46:	83 f8 ff             	cmp    eax,0xffffffff
 8048e49:	74 16                	je     8048e61 <set_nonblock+0x51>
 8048e4b:	83 c4 04             	add    esp,0x4
 8048e4e:	5b                   	pop    ebx
 8048e4f:	5e                   	pop    esi
 8048e50:	c3                   	ret
 8048e51:	8d 83 68 0d fd ff    	lea    eax,[ebx-0x2f298]
 8048e57:	52                   	push   edx
 8048e58:	52                   	push   edx
 8048e59:	50                   	push   eax
 8048e5a:	6a 01                	push   0x1
 8048e5c:	e8 3f 95 02 00       	call   80723a0 <err>
 8048e61:	50                   	push   eax
 8048e62:	50                   	push   eax
 8048e63:	8d 83 08 0f fd ff    	lea    eax,[ebx-0x2f0f8]
 8048e69:	50                   	push   eax
 8048e6a:	6a 01                	push   0x1
 8048e6c:	e8 2f 95 02 00       	call   80723a0 <err>
 8048e71:	eb 0d                	jmp    8048e80 <client_send_response>
 8048e73:	90                   	nop
 8048e74:	90                   	nop
 8048e75:	90                   	nop
 8048e76:	90                   	nop
 8048e77:	90                   	nop
 8048e78:	90                   	nop
 8048e79:	90                   	nop
 8048e7a:	90                   	nop
 8048e7b:	90                   	nop
 8048e7c:	90                   	nop
 8048e7d:	90                   	nop
 8048e7e:	90                   	nop
 8048e7f:	90                   	nop

08048e80 <client_send_response>:
 8048e80:	55                   	push   ebp
 8048e81:	57                   	push   edi
 8048e82:	56                   	push   esi
 8048e83:	53                   	push   ebx
 8048e84:	e8 57 fe ff ff       	call   8048ce0 <__x86.get_pc_thunk.bx>
 8048e89:	81 c3 77 61 0a 00    	add    ebx,0xa6177
 8048e8f:	83 ec 0c             	sub    esp,0xc
 8048e92:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
 8048e96:	8b 46 30             	mov    eax,DWORD PTR [esi+0x30]
 8048e99:	85 c0                	test   eax,eax
 8048e9b:	0f 84 a7 00 00 00    	je     8048f48 <client_send_response+0xc8>
 8048ea1:	03 46 34             	add    eax,DWORD PTR [esi+0x34]
 8048ea4:	83 ec 0c             	sub    esp,0xc
 8048ea7:	50                   	push   eax
 8048ea8:	89 c7                	mov    edi,eax
 8048eaa:	e8 41 42 01 00       	call   805d0f0 <strlen>
 8048eaf:	83 c4 0c             	add    esp,0xc
 8048eb2:	89 c5                	mov    ebp,eax
 8048eb4:	50                   	push   eax
 8048eb5:	57                   	push   edi
 8048eb6:	ff 36                	push   DWORD PTR [esi]
 8048eb8:	e8 13 7a 02 00       	call   80708d0 <__libc_write>
 8048ebd:	83 c4 10             	add    esp,0x10
 8048ec0:	85 c0                	test   eax,eax
 8048ec2:	78 05                	js     8048ec9 <client_send_response+0x49>
 8048ec4:	01 46 34             	add    DWORD PTR [esi+0x34],eax
 8048ec7:	29 c5                	sub    ebp,eax
 8048ec9:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
 8048ecc:	85 c0                	test   eax,eax
 8048ece:	0f 8e 9c 00 00 00    	jle    8048f70 <client_send_response+0xf0>
 8048ed4:	85 ed                	test   ebp,ebp
 8048ed6:	74 58                	je     8048f30 <client_send_response+0xb0>
 8048ed8:	ff 76 3c             	push   DWORD PTR [esi+0x3c]
 8048edb:	6a 00                	push   0x0
 8048edd:	50                   	push   eax
 8048ede:	ff 36                	push   DWORD PTR [esi]
 8048ee0:	e8 1b 84 02 00       	call   8071300 <sendfile>
 8048ee5:	83 c4 10             	add    esp,0x10
 8048ee8:	83 f8 ff             	cmp    eax,0xffffffff
 8048eeb:	0f 84 bf 00 00 00    	je     8048fb0 <client_send_response+0x130>
 8048ef1:	8b 56 3c             	mov    edx,DWORD PTR [esi+0x3c]
 8048ef4:	29 c2                	sub    edx,eax
 8048ef6:	85 d2                	test   edx,edx
 8048ef8:	89 56 3c             	mov    DWORD PTR [esi+0x3c],edx
 8048efb:	74 63                	je     8048f60 <client_send_response+0xe0>
 8048efd:	83 7e 14 05          	cmp    DWORD PTR [esi+0x14],0x5
 8048f01:	74 24                	je     8048f27 <client_send_response+0xa7>
 8048f03:	8d 46 14             	lea    eax,[esi+0x14]
 8048f06:	c7 46 14 05 00 00 00 	mov    DWORD PTR [esi+0x14],0x5
 8048f0d:	50                   	push   eax
 8048f0e:	c7 c0 e8 09 0f 08    	mov    eax,0x80f09e8
 8048f14:	ff 36                	push   DWORD PTR [esi]
 8048f16:	6a 03                	push   0x3
 8048f18:	ff 30                	push   DWORD PTR [eax]
 8048f1a:	e8 91 9b 02 00       	call   8072ab0 <epoll_ctl>
 8048f1f:	83 c4 10             	add    esp,0x10
 8048f22:	83 f8 ff             	cmp    eax,0xffffffff
 8048f25:	74 77                	je     8048f9e <client_send_response+0x11e>
 8048f27:	83 c4 0c             	add    esp,0xc
 8048f2a:	5b                   	pop    ebx
 8048f2b:	5e                   	pop    esi
 8048f2c:	5f                   	pop    edi
 8048f2d:	5d                   	pop    ebp
 8048f2e:	c3                   	ret
 8048f2f:	90                   	nop
 8048f30:	83 ec 0c             	sub    esp,0xc
 8048f33:	ff 76 30             	push   DWORD PTR [esi+0x30]
 8048f36:	e8 25 23 01 00       	call   805b260 <__cfree>
 8048f3b:	c7 46 30 00 00 00 00 	mov    DWORD PTR [esi+0x30],0x0
 8048f42:	83 c4 10             	add    esp,0x10
 8048f45:	8d 76 00             	lea    esi,[esi+0x0]
 8048f48:	8b 46 38             	mov    eax,DWORD PTR [esi+0x38]
 8048f4b:	85 c0                	test   eax,eax
 8048f4d:	7f 89                	jg     8048ed8 <client_send_response+0x58>
 8048f4f:	83 c4 0c             	add    esp,0xc
 8048f52:	5b                   	pop    ebx
 8048f53:	5e                   	pop    esi
 8048f54:	5f                   	pop    edi
 8048f55:	5d                   	pop    ebp
 8048f56:	c3                   	ret
 8048f57:	89 f6                	mov    esi,esi
 8048f59:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 8048f60:	c6 46 40 01          	mov    BYTE PTR [esi+0x40],0x1
 8048f64:	83 c4 0c             	add    esp,0xc
 8048f67:	5b                   	pop    ebx
 8048f68:	5e                   	pop    esi
 8048f69:	5f                   	pop    edi
 8048f6a:	5d                   	pop    ebp
 8048f6b:	c3                   	ret
 8048f6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048f70:	85 ed                	test   ebp,ebp
 8048f72:	74 ec                	je     8048f60 <client_send_response+0xe0>
 8048f74:	83 7e 14 05          	cmp    DWORD PTR [esi+0x14],0x5
 8048f78:	74 ad                	je     8048f27 <client_send_response+0xa7>
 8048f7a:	8d 46 14             	lea    eax,[esi+0x14]
 8048f7d:	c7 46 14 05 00 00 00 	mov    DWORD PTR [esi+0x14],0x5
 8048f84:	50                   	push   eax
 8048f85:	c7 c0 e8 09 0f 08    	mov    eax,0x80f09e8
 8048f8b:	ff 36                	push   DWORD PTR [esi]
 8048f8d:	6a 03                	push   0x3
 8048f8f:	ff 30                	push   DWORD PTR [eax]
 8048f91:	e8 1a 9b 02 00       	call   8072ab0 <epoll_ctl>
 8048f96:	83 c4 10             	add    esp,0x10
 8048f99:	83 f8 ff             	cmp    eax,0xffffffff
 8048f9c:	75 aa                	jne    8048f48 <client_send_response+0xc8>
 8048f9e:	8d 83 2c 0f fd ff    	lea    eax,[ebx-0x2f0d4]
 8048fa4:	52                   	push   edx
 8048fa5:	52                   	push   edx
 8048fa6:	50                   	push   eax
 8048fa7:	6a 01                	push   0x1
 8048fa9:	e8 f2 93 02 00       	call   80723a0 <err>
 8048fae:	66 90                	xchg   ax,ax
 8048fb0:	e8 db 12 00 00       	call   804a290 <__errno_location>
 8048fb5:	83 38 0b             	cmp    DWORD PTR [eax],0xb
 8048fb8:	0f 84 69 ff ff ff    	je     8048f27 <client_send_response+0xa7>
 8048fbe:	50                   	push   eax
 8048fbf:	50                   	push   eax
 8048fc0:	8d 83 81 0d fd ff    	lea    eax,[ebx-0x2f27f]
 8048fc6:	50                   	push   eax
 8048fc7:	6a 01                	push   0x1
 8048fc9:	e8 d2 93 02 00       	call   80723a0 <err>
 8048fce:	66 90                	xchg   ax,ax

08048fd0 <client_http_error>:
 8048fd0:	55                   	push   ebp
 8048fd1:	57                   	push   edi
 8048fd2:	56                   	push   esi
 8048fd3:	53                   	push   ebx
 8048fd4:	e8 07 fd ff ff       	call   8048ce0 <__x86.get_pc_thunk.bx>
 8048fd9:	81 c3 27 60 0a 00    	add    ebx,0xa6027
 8048fdf:	83 ec 2c             	sub    esp,0x2c
 8048fe2:	8d 44 24 4c          	lea    eax,[esp+0x4c]
 8048fe6:	8b 7c 24 40          	mov    edi,DWORD PTR [esp+0x40]
 8048fea:	8b 74 24 44          	mov    esi,DWORD PTR [esp+0x44]
 8048fee:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
 8048ff5:	00 
 8048ff6:	83 ec 04             	sub    esp,0x4
 8048ff9:	50                   	push   eax
 8048ffa:	ff 74 24 50          	push   DWORD PTR [esp+0x50]
 8048ffe:	8d 44 24 28          	lea    eax,[esp+0x28]
 8049002:	50                   	push   eax
 8049003:	e8 a8 8d 00 00       	call   8051db0 <_IO_vasprintf>
 8049008:	c7 c0 9c f9 0e 08    	mov    eax,0x80ef99c
 804900e:	8d 8b 8a 0d fd ff    	lea    ecx,[ebx-0x2f276]
 8049014:	8b 10                	mov    edx,DWORD PTR [eax]
 8049016:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
 804901a:	83 c4 0c             	add    esp,0xc
 804901d:	51                   	push   ecx
 804901e:	8d 8b 93 0d fd ff    	lea    ecx,[ebx-0x2f26d]
 8049024:	51                   	push   ecx
 8049025:	52                   	push   edx
 8049026:	52                   	push   edx
 8049027:	50                   	push   eax
 8049028:	50                   	push   eax
 8049029:	56                   	push   esi
 804902a:	50                   	push   eax
 804902b:	8d 83 60 0f fd ff    	lea    eax,[ebx-0x2f0a0]
 8049031:	56                   	push   esi
 8049032:	50                   	push   eax
 8049033:	8d 47 30             	lea    eax,[edi+0x30]
 8049036:	50                   	push   eax
 8049037:	e8 b4 6e 00 00       	call   804fef0 <___asprintf>
 804903c:	8b 54 24 4c          	mov    edx,DWORD PTR [esp+0x4c]
 8049040:	0f b7 6f 06          	movzx  ebp,WORD PTR [edi+0x6]
 8049044:	66 c1 cd 08          	ror    bp,0x8
 8049048:	0f b7 ed             	movzx  ebp,bp
 804904b:	89 54 24 3c          	mov    DWORD PTR [esp+0x3c],edx
 804904f:	83 c4 24             	add    esp,0x24
 8049052:	ff 77 08             	push   DWORD PTR [edi+0x8]
 8049055:	e8 d6 a3 02 00       	call   8073430 <inet_ntoa>
 804905a:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
 804905e:	89 14 24             	mov    DWORD PTR [esp],edx
 8049061:	56                   	push   esi
 8049062:	55                   	push   ebp
 8049063:	50                   	push   eax
 8049064:	8d 83 9f 0d fd ff    	lea    eax,[ebx-0x2f261]
 804906a:	50                   	push   eax
 804906b:	e8 60 6e 00 00       	call   804fed0 <_IO_printf>
 8049070:	83 c4 14             	add    esp,0x14
 8049073:	ff 74 24 28          	push   DWORD PTR [esp+0x28]
 8049077:	e8 e4 21 01 00       	call   805b260 <__cfree>
 804907c:	89 3c 24             	mov    DWORD PTR [esp],edi
 804907f:	e8 fc fd ff ff       	call   8048e80 <client_send_response>
 8049084:	83 c4 3c             	add    esp,0x3c
 8049087:	89 f0                	mov    eax,esi
 8049089:	5b                   	pop    ebx
 804908a:	5e                   	pop    esi
 804908b:	5f                   	pop    edi
 804908c:	5d                   	pop    ebp
 804908d:	c3                   	ret
 804908e:	66 90                	xchg   ax,ax

08049090 <parse_request>:
 8049090:	55                   	push   ebp
 8049091:	57                   	push   edi
 8049092:	56                   	push   esi
 8049093:	53                   	push   ebx
 8049094:	e8 51 06 00 00       	call   80496ea <__x86.get_pc_thunk.ax>
 8049099:	05 67 5f 0a 00       	add    eax,0xa5f67
 804909e:	83 ec 08             	sub    esp,0x8
 80490a1:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
 80490a5:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 80490a9:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
 80490ad:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 80490b1:	8b 42 20             	mov    eax,DWORD PTR [edx+0x20]
 80490b4:	8b 7a 24             	mov    edi,DWORD PTR [edx+0x24]
 80490b7:	01 c7                	add    edi,eax
 80490b9:	39 f8                	cmp    eax,edi
 80490bb:	0f 83 9f 01 00 00    	jae    8049260 <parse_request+0x1d0>
 80490c1:	0f b6 30             	movzx  esi,BYTE PTR [eax]
 80490c4:	89 fa                	mov    edx,edi
 80490c6:	8d 7e f6             	lea    edi,[esi-0xa]
 80490c9:	89 fb                	mov    ebx,edi
 80490cb:	80 fb 16             	cmp    bl,0x16
 80490ce:	0f 86 6c 01 00 00    	jbe    8049240 <parse_request+0x1b0>
 80490d4:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
 80490d8:	89 4c 24 24          	mov    DWORD PTR [esp+0x24],ecx
 80490dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 80490e0:	83 c0 01             	add    eax,0x1
 80490e3:	83 c3 01             	add    ebx,0x1
 80490e6:	89 f1                	mov    ecx,esi
 80490e8:	39 c2                	cmp    edx,eax
 80490ea:	88 4b ff             	mov    BYTE PTR [ebx-0x1],cl
 80490ed:	0f 84 65 01 00 00    	je     8049258 <parse_request+0x1c8>
 80490f3:	0f b6 30             	movzx  esi,BYTE PTR [eax]
 80490f6:	8d 7e f6             	lea    edi,[esi-0xa]
 80490f9:	89 f9                	mov    ecx,edi
 80490fb:	80 f9 16             	cmp    cl,0x16
 80490fe:	77 e0                	ja     80490e0 <parse_request+0x50>
 8049100:	b9 09 00 40 00       	mov    ecx,0x400009
 8049105:	0f a3 f9             	bt     ecx,edi
 8049108:	73 d6                	jae    80490e0 <parse_request+0x50>
 804910a:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
 804910e:	89 5c 24 20          	mov    DWORD PTR [esp+0x20],ebx
 8049112:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
 8049116:	c6 07 00             	mov    BYTE PTR [edi],0x0
 8049119:	80 38 20             	cmp    BYTE PTR [eax],0x20
 804911c:	0f 85 4d 01 00 00    	jne    804926f <parse_request+0x1df>
 8049122:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 8049128:	83 c0 01             	add    eax,0x1
 804912b:	39 c2                	cmp    edx,eax
 804912d:	0f 86 39 01 00 00    	jbe    804926c <parse_request+0x1dc>
 8049133:	0f b6 18             	movzx  ebx,BYTE PTR [eax]
 8049136:	80 fb 20             	cmp    bl,0x20
 8049139:	74 ed                	je     8049128 <parse_request+0x98>
 804913b:	89 df                	mov    edi,ebx
 804913d:	88 1c 24             	mov    BYTE PTR [esp],bl
 8049140:	8d 77 f6             	lea    esi,[edi-0xa]
 8049143:	89 f3                	mov    ebx,esi
 8049145:	80 fb 16             	cmp    bl,0x16
 8049148:	77 0a                	ja     8049154 <parse_request+0xc4>
 804914a:	bf 09 00 40 00       	mov    edi,0x400009
 804914f:	0f a3 f7             	bt     edi,esi
 8049152:	72 33                	jb     8049187 <parse_request+0xf7>
 8049154:	0f b6 1c 24          	movzx  ebx,BYTE PTR [esp]
 8049158:	bf 09 00 40 00       	mov    edi,0x400009
 804915d:	89 14 24             	mov    DWORD PTR [esp],edx
 8049160:	83 c1 01             	add    ecx,0x1
 8049163:	83 c0 01             	add    eax,0x1
 8049166:	39 04 24             	cmp    DWORD PTR [esp],eax
 8049169:	88 59 ff             	mov    BYTE PTR [ecx-0x1],bl
 804916c:	0f 86 fa 00 00 00    	jbe    804926c <parse_request+0x1dc>
 8049172:	0f b6 18             	movzx  ebx,BYTE PTR [eax]
 8049175:	8d 73 f6             	lea    esi,[ebx-0xa]
 8049178:	89 f2                	mov    edx,esi
 804917a:	80 fa 16             	cmp    dl,0x16
 804917d:	77 e1                	ja     8049160 <parse_request+0xd0>
 804917f:	0f a3 f7             	bt     edi,esi
 8049182:	73 dc                	jae    8049160 <parse_request+0xd0>
 8049184:	8b 14 24             	mov    edx,DWORD PTR [esp]
 8049187:	c6 01 00             	mov    BYTE PTR [ecx],0x0
 804918a:	80 38 20             	cmp    BYTE PTR [eax],0x20
 804918d:	0f 85 dc 00 00 00    	jne    804926f <parse_request+0x1df>
 8049193:	90                   	nop
 8049194:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049198:	83 c0 01             	add    eax,0x1
 804919b:	39 c2                	cmp    edx,eax
 804919d:	0f 86 cc 00 00 00    	jbe    804926f <parse_request+0x1df>
 80491a3:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
 80491a6:	80 f9 20             	cmp    cl,0x20
 80491a9:	74 ed                	je     8049198 <parse_request+0x108>
 80491ab:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
 80491af:	be 54 00 00 00       	mov    esi,0x54
 80491b4:	80 f9 48             	cmp    cl,0x48
 80491b7:	8d 9f 90 12 fd ff    	lea    ebx,[edi-0x2ed70]
 80491bd:	89 d7                	mov    edi,edx
 80491bf:	89 f2                	mov    edx,esi
 80491c1:	89 fe                	mov    esi,edi
 80491c3:	74 0f                	je     80491d4 <parse_request+0x144>
 80491c5:	e9 a5 00 00 00       	jmp    804926f <parse_request+0x1df>
 80491ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 80491d0:	0f b6 53 01          	movzx  edx,BYTE PTR [ebx+0x1]
 80491d4:	83 c0 01             	add    eax,0x1
 80491d7:	83 c3 01             	add    ebx,0x1
 80491da:	39 c6                	cmp    esi,eax
 80491dc:	0f 86 9a 00 00 00    	jbe    804927c <parse_request+0x1ec>
 80491e2:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
 80491e5:	38 ca                	cmp    dl,cl
 80491e7:	74 e7                	je     80491d0 <parse_request+0x140>
 80491e9:	89 f7                	mov    edi,esi
 80491eb:	89 d6                	mov    esi,edx
 80491ed:	89 f3                	mov    ebx,esi
 80491ef:	89 fa                	mov    edx,edi
 80491f1:	84 db                	test   bl,bl
 80491f3:	75 7a                	jne    804926f <parse_request+0x1df>
 80491f5:	8d 59 f6             	lea    ebx,[ecx-0xa]
 80491f8:	80 fb 16             	cmp    bl,0x16
 80491fb:	77 0a                	ja     8049207 <parse_request+0x177>
 80491fd:	be 09 00 40 00       	mov    esi,0x400009
 8049202:	0f a3 de             	bt     esi,ebx
 8049205:	72 26                	jb     804922d <parse_request+0x19d>
 8049207:	be 09 00 40 00       	mov    esi,0x400009
 804920c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049210:	83 c0 01             	add    eax,0x1
 8049213:	83 c5 01             	add    ebp,0x1
 8049216:	88 4d ff             	mov    BYTE PTR [ebp-0x1],cl
 8049219:	39 c2                	cmp    edx,eax
 804921b:	76 10                	jbe    804922d <parse_request+0x19d>
 804921d:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
 8049220:	8d 59 f6             	lea    ebx,[ecx-0xa]
 8049223:	80 fb 16             	cmp    bl,0x16
 8049226:	77 e8                	ja     8049210 <parse_request+0x180>
 8049228:	0f a3 de             	bt     esi,ebx
 804922b:	73 e3                	jae    8049210 <parse_request+0x180>
 804922d:	c6 45 00 00          	mov    BYTE PTR [ebp+0x0],0x0
 8049231:	83 c4 08             	add    esp,0x8
 8049234:	31 c0                	xor    eax,eax
 8049236:	5b                   	pop    ebx
 8049237:	5e                   	pop    esi
 8049238:	5f                   	pop    edi
 8049239:	5d                   	pop    ebp
 804923a:	c3                   	ret
 804923b:	90                   	nop
 804923c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049240:	bb 09 00 40 00       	mov    ebx,0x400009
 8049245:	0f a3 fb             	bt     ebx,edi
 8049248:	0f 83 86 fe ff ff    	jae    80490d4 <parse_request+0x44>
 804924e:	e9 bf fe ff ff       	jmp    8049112 <parse_request+0x82>
 8049253:	90                   	nop
 8049254:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049258:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
 804925c:	89 5c 24 20          	mov    DWORD PTR [esp+0x20],ebx
 8049260:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
 8049264:	c6 07 00             	mov    BYTE PTR [edi],0x0
 8049267:	80 38 20             	cmp    BYTE PTR [eax],0x20
 804926a:	75 03                	jne    804926f <parse_request+0x1df>
 804926c:	c6 01 00             	mov    BYTE PTR [ecx],0x0
 804926f:	83 c4 08             	add    esp,0x8
 8049272:	b8 ff ff ff ff       	mov    eax,0xffffffff
 8049277:	5b                   	pop    ebx
 8049278:	5e                   	pop    esi
 8049279:	5f                   	pop    edi
 804927a:	5d                   	pop    ebp
 804927b:	c3                   	ret
 804927c:	84 d2                	test   dl,dl
 804927e:	74 ad                	je     804922d <parse_request+0x19d>
 8049280:	eb ed                	jmp    804926f <parse_request+0x1df>
 8049282:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 8049289:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08049290 <client_process_request>:
 8049290:	55                   	push   ebp
 8049291:	57                   	push   edi
 8049292:	56                   	push   esi
 8049293:	53                   	push   ebx
 8049294:	e8 47 fa ff ff       	call   8048ce0 <__x86.get_pc_thunk.bx>
 8049299:	81 c3 67 5d 0a 00    	add    ebx,0xa5d67
 804929f:	81 ec a4 01 00 00    	sub    esp,0x1a4
 80492a5:	8b 84 24 b8 01 00 00 	mov    eax,DWORD PTR [esp+0x1b8]
 80492ac:	89 44 24 7c          	mov    DWORD PTR [esp+0x7c],eax
 80492b0:	8d 84 24 b8 01 00 00 	lea    eax,[esp+0x1b8]
 80492b7:	50                   	push   eax
 80492b8:	8d 84 24 80 00 00 00 	lea    eax,[esp+0x80]
 80492bf:	50                   	push   eax
 80492c0:	8d 83 30 10 fd ff    	lea    eax,[ebx-0x2efd0]
 80492c6:	8d bc 24 98 01 00 00 	lea    edi,[esp+0x198]
 80492cd:	57                   	push   edi
 80492ce:	8d b4 24 9c 00 00 00 	lea    esi,[esp+0x9c]
 80492d5:	56                   	push   esi
 80492d6:	8d ac 24 90 00 00 00 	lea    ebp,[esp+0x90]
 80492dd:	55                   	push   ebp
 80492de:	50                   	push   eax
 80492df:	e8 ec 6b 00 00       	call   804fed0 <_IO_printf>
 80492e4:	83 c4 20             	add    esp,0x20
 80492e7:	57                   	push   edi
 80492e8:	56                   	push   esi
 80492e9:	55                   	push   ebp
 80492ea:	ff b4 24 80 00 00 00 	push   DWORD PTR [esp+0x80]
 80492f1:	e8 9a fd ff ff       	call   8049090 <parse_request>
 80492f6:	83 c4 10             	add    esp,0x10
 80492f9:	85 c0                	test   eax,eax
 80492fb:	0f 85 97 00 00 00    	jne    8049398 <client_process_request+0x108>
 8049301:	80 7c 24 78 47       	cmp    BYTE PTR [esp+0x78],0x47
 8049306:	74 28                	je     8049330 <client_process_request+0xa0>
 8049308:	8d 83 07 0e fd ff    	lea    eax,[ebx-0x2f1f9]
 804930e:	55                   	push   ebp
 804930f:	50                   	push   eax
 8049310:	68 95 01 00 00       	push   0x195
 8049315:	ff b4 24 80 00 00 00 	push   DWORD PTR [esp+0x80]
 804931c:	e8 af fc ff ff       	call   8048fd0 <client_http_error>
 8049321:	83 c4 10             	add    esp,0x10
 8049324:	81 c4 9c 01 00 00    	add    esp,0x19c
 804932a:	5b                   	pop    ebx
 804932b:	5e                   	pop    esi
 804932c:	5f                   	pop    edi
 804932d:	5d                   	pop    ebp
 804932e:	c3                   	ret
 804932f:	90                   	nop
 8049330:	80 7c 24 79 45       	cmp    BYTE PTR [esp+0x79],0x45
 8049335:	75 d1                	jne    8049308 <client_process_request+0x78>
 8049337:	80 7c 24 7a 54       	cmp    BYTE PTR [esp+0x7a],0x54
 804933c:	75 ca                	jne    8049308 <client_process_request+0x78>
 804933e:	80 7c 24 7b 00       	cmp    BYTE PTR [esp+0x7b],0x0
 8049343:	75 c3                	jne    8049308 <client_process_request+0x78>
 8049345:	80 bc 24 88 01 00 00 	cmp    BYTE PTR [esp+0x188],0x31
 804934c:	31 
 804934d:	75 79                	jne    80493c8 <client_process_request+0x138>
 804934f:	8d 83 3b 0e fd ff    	lea    eax,[ebx-0x2f1c5]
 8049355:	83 ec 08             	sub    esp,0x8
 8049358:	50                   	push   eax
 8049359:	56                   	push   esi
 804935a:	e8 71 45 01 00       	call   805d8d0 <strstr>
 804935f:	83 c4 10             	add    esp,0x10
 8049362:	85 c0                	test   eax,eax
 8049364:	0f 84 86 00 00 00    	je     80493f0 <client_process_request+0x160>
 804936a:	8d 83 3e 0e fd ff    	lea    eax,[ebx-0x2f1c2]
 8049370:	83 ec 04             	sub    esp,0x4
 8049373:	50                   	push   eax
 8049374:	68 94 01 00 00       	push   0x194
 8049379:	ff b4 24 80 00 00 00 	push   DWORD PTR [esp+0x80]
 8049380:	e8 4b fc ff ff       	call   8048fd0 <client_http_error>
 8049385:	83 c4 10             	add    esp,0x10
 8049388:	81 c4 9c 01 00 00    	add    esp,0x19c
 804938e:	5b                   	pop    ebx
 804938f:	5e                   	pop    esi
 8049390:	5f                   	pop    edi
 8049391:	5d                   	pop    ebp
 8049392:	c3                   	ret
 8049393:	90                   	nop
 8049394:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049398:	8d 83 fb 0d fd ff    	lea    eax,[ebx-0x2f205]
 804939e:	83 ec 04             	sub    esp,0x4
 80493a1:	50                   	push   eax
 80493a2:	68 90 01 00 00       	push   0x190
 80493a7:	ff b4 24 80 00 00 00 	push   DWORD PTR [esp+0x80]
 80493ae:	e8 1d fc ff ff       	call   8048fd0 <client_http_error>
 80493b3:	83 c4 10             	add    esp,0x10
 80493b6:	81 c4 9c 01 00 00    	add    esp,0x19c
 80493bc:	5b                   	pop    ebx
 80493bd:	5e                   	pop    esi
 80493be:	5f                   	pop    edi
 80493bf:	5d                   	pop    ebp
 80493c0:	c3                   	ret
 80493c1:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
 80493c8:	8d 83 1d 0e fd ff    	lea    eax,[ebx-0x2f1e3]
 80493ce:	57                   	push   edi
 80493cf:	50                   	push   eax
 80493d0:	68 f9 01 00 00       	push   0x1f9
 80493d5:	ff b4 24 80 00 00 00 	push   DWORD PTR [esp+0x80]
 80493dc:	e8 ef fb ff ff       	call   8048fd0 <client_http_error>
 80493e1:	83 c4 10             	add    esp,0x10
 80493e4:	81 c4 9c 01 00 00    	add    esp,0x19c
 80493ea:	5b                   	pop    ebx
 80493eb:	5e                   	pop    esi
 80493ec:	5f                   	pop    edi
 80493ed:	5d                   	pop    ebp
 80493ee:	c3                   	ret
 80493ef:	90                   	nop
 80493f0:	80 bc 24 88 00 00 00 	cmp    BYTE PTR [esp+0x88],0x2f
 80493f7:	2f 
 80493f8:	8d 83 02 3b fe ff    	lea    eax,[ebx-0x1c4fe]
 80493fe:	75 06                	jne    8049406 <client_process_request+0x176>
 8049400:	8d 83 51 59 fe ff    	lea    eax,[ebx-0x1a6af]
 8049406:	83 ec 0c             	sub    esp,0xc
 8049409:	56                   	push   esi
 804940a:	50                   	push   eax
 804940b:	c7 c0 e4 09 0f 08    	mov    eax,0x80f09e4
 8049411:	ff 30                	push   DWORD PTR [eax]
 8049413:	8d 83 50 0e fd ff    	lea    eax,[ebx-0x2f1b0]
 8049419:	50                   	push   eax
 804941a:	8d 6c 24 34          	lea    ebp,[esp+0x34]
 804941e:	55                   	push   ebp
 804941f:	e8 cc 6a 00 00       	call   804fef0 <___asprintf>
 8049424:	83 c4 1c             	add    esp,0x1c
 8049427:	8d 7c 24 20          	lea    edi,[esp+0x20]
 804942b:	57                   	push   edi
 804942c:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 8049430:	6a 03                	push   0x3
 8049432:	e8 c9 72 02 00       	call   8070700 <__xstat>
 8049437:	83 c4 10             	add    esp,0x10
 804943a:	83 f8 ff             	cmp    eax,0xffffffff
 804943d:	0f 84 3d 02 00 00    	je     8049680 <client_process_request+0x3f0>
 8049443:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
 8049447:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
 804944b:	25 00 f0 00 00       	and    eax,0xf000
 8049450:	3d 00 40 00 00       	cmp    eax,0x4000
 8049455:	0f 84 b5 01 00 00    	je     8049610 <client_process_request+0x380>
 804945b:	8b 7c 24 74          	mov    edi,DWORD PTR [esp+0x74]
 804945f:	83 ec 08             	sub    esp,0x8
 8049462:	6a 00                	push   0x0
 8049464:	56                   	push   esi
 8049465:	e8 86 73 02 00       	call   80707f0 <__libc_open>
 804946a:	89 47 38             	mov    DWORD PTR [edi+0x38],eax
 804946d:	8b bc 24 84 00 00 00 	mov    edi,DWORD PTR [esp+0x84]
 8049474:	83 c4 10             	add    esp,0x10
 8049477:	83 7f 38 ff          	cmp    DWORD PTR [edi+0x38],0xffffffff
 804947b:	0f 84 f7 00 00 00    	je     8049578 <client_process_request+0x2e8>
 8049481:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 8049485:	83 ec 08             	sub    esp,0x8
 8049488:	8d ab e2 0d fd ff    	lea    ebp,[ebx-0x2f21e]
 804948e:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
 8049492:	6a 2e                	push   0x2e
 8049494:	50                   	push   eax
 8049495:	e8 6e ed ff ff       	call   8048208 <.plt+0x28>
 804949a:	83 c4 10             	add    esp,0x10
 804949d:	85 c0                	test   eax,eax
 804949f:	89 c6                	mov    esi,eax
 80494a1:	74 5e                	je     8049501 <client_process_request+0x271>
 80494a3:	8d 83 5f 0e fd ff    	lea    eax,[ebx-0x2f1a1]
 80494a9:	83 ec 08             	sub    esp,0x8
 80494ac:	8d ab b4 0d fd ff    	lea    ebp,[ebx-0x2f24c]
 80494b2:	50                   	push   eax
 80494b3:	56                   	push   esi
 80494b4:	e8 67 ed ff ff       	call   8048220 <.plt+0x40>
 80494b9:	83 c4 10             	add    esp,0x10
 80494bc:	85 c0                	test   eax,eax
 80494be:	74 41                	je     8049501 <client_process_request+0x271>
 80494c0:	8d 83 7b 0e fd ff    	lea    eax,[ebx-0x2f185]
 80494c6:	83 ec 08             	sub    esp,0x8
 80494c9:	8d ab cd 0d fd ff    	lea    ebp,[ebx-0x2f233]
 80494cf:	50                   	push   eax
 80494d0:	56                   	push   esi
 80494d1:	e8 4a ed ff ff       	call   8048220 <.plt+0x40>
 80494d6:	83 c4 10             	add    esp,0x10
 80494d9:	85 c0                	test   eax,eax
 80494db:	74 24                	je     8049501 <client_process_request+0x271>
 80494dd:	8d 83 80 0e fd ff    	lea    eax,[ebx-0x2f180]
 80494e3:	83 ec 08             	sub    esp,0x8
 80494e6:	8d ab e2 0d fd ff    	lea    ebp,[ebx-0x2f21e]
 80494ec:	50                   	push   eax
 80494ed:	56                   	push   esi
 80494ee:	e8 2d ed ff ff       	call   8048220 <.plt+0x40>
 80494f3:	83 c4 10             	add    esp,0x10
 80494f6:	85 c0                	test   eax,eax
 80494f8:	8d 83 d8 0d fd ff    	lea    eax,[ebx-0x2f228]
 80494fe:	0f 44 e8             	cmove  ebp,eax
 8049501:	83 ec 0c             	sub    esp,0xc
 8049504:	0f b7 77 06          	movzx  esi,WORD PTR [edi+0x6]
 8049508:	ff 77 08             	push   DWORD PTR [edi+0x8]
 804950b:	66 c1 ce 08          	ror    si,0x8
 804950f:	0f b7 f6             	movzx  esi,si
 8049512:	e8 19 9f 02 00       	call   8073430 <inet_ntoa>
 8049517:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 804951b:	56                   	push   esi
 804951c:	50                   	push   eax
 804951d:	8d 83 85 0e fd ff    	lea    eax,[ebx-0x2f17b]
 8049523:	50                   	push   eax
 8049524:	e8 a7 69 00 00       	call   804fed0 <_IO_printf>
 8049529:	83 c4 14             	add    esp,0x14
 804952c:	ff 74 24 24          	push   DWORD PTR [esp+0x24]
 8049530:	e8 2b 1d 01 00       	call   805b260 <__cfree>
 8049535:	8d 83 60 10 fd ff    	lea    eax,[ebx-0x2efa0]
 804953b:	83 c4 0c             	add    esp,0xc
 804953e:	55                   	push   ebp
 804953f:	50                   	push   eax
 8049540:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
 8049547:	83 c0 30             	add    eax,0x30
 804954a:	50                   	push   eax
 804954b:	e8 a0 69 00 00       	call   804fef0 <___asprintf>
 8049550:	8b 84 24 84 00 00 00 	mov    eax,DWORD PTR [esp+0x84]
 8049557:	8b 54 24 58          	mov    edx,DWORD PTR [esp+0x58]
 804955b:	89 50 3c             	mov    DWORD PTR [eax+0x3c],edx
 804955e:	89 04 24             	mov    DWORD PTR [esp],eax
 8049561:	e8 1a f9 ff ff       	call   8048e80 <client_send_response>
 8049566:	83 c4 10             	add    esp,0x10
 8049569:	b8 c8 00 00 00       	mov    eax,0xc8
 804956e:	e9 b1 fd ff ff       	jmp    8049324 <client_process_request+0x94>
 8049573:	90                   	nop
 8049574:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049578:	e8 13 0d 00 00       	call   804a290 <__errno_location>
 804957d:	8b 38                	mov    edi,DWORD PTR [eax]
 804957f:	83 ec 0c             	sub    esp,0xc
 8049582:	57                   	push   edi
 8049583:	e8 78 39 01 00       	call   805cf00 <strerror>
 8049588:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
 804958c:	8b 84 24 84 00 00 00 	mov    eax,DWORD PTR [esp+0x84]
 8049593:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 8049597:	5a                   	pop    edx
 8049598:	0f b7 70 06          	movzx  esi,WORD PTR [eax+0x6]
 804959c:	ff 70 08             	push   DWORD PTR [eax+0x8]
 804959f:	66 c1 ce 08          	ror    si,0x8
 80495a3:	0f b7 f6             	movzx  esi,si
 80495a6:	e8 85 9e 02 00       	call   8073430 <inet_ntoa>
 80495ab:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
 80495af:	89 14 24             	mov    DWORD PTR [esp],edx
 80495b2:	55                   	push   ebp
 80495b3:	56                   	push   esi
 80495b4:	50                   	push   eax
 80495b5:	8d 83 65 0e fd ff    	lea    eax,[ebx-0x2f19b]
 80495bb:	50                   	push   eax
 80495bc:	e8 0f 69 00 00       	call   804fed0 <_IO_printf>
 80495c1:	83 c4 14             	add    esp,0x14
 80495c4:	ff 74 24 24          	push   DWORD PTR [esp+0x24]
 80495c8:	e8 93 1c 01 00       	call   805b260 <__cfree>
 80495cd:	83 c4 10             	add    esp,0x10
 80495d0:	83 ff 01             	cmp    edi,0x1
 80495d3:	0f 84 e7 00 00 00    	je     80496c0 <client_process_request+0x430>
 80495d9:	83 ff 0d             	cmp    edi,0xd
 80495dc:	0f 84 de 00 00 00    	je     80496c0 <client_process_request+0x430>
 80495e2:	83 ec 0c             	sub    esp,0xc
 80495e5:	57                   	push   edi
 80495e6:	e8 15 39 01 00       	call   805cf00 <strerror>
 80495eb:	50                   	push   eax
 80495ec:	8d 83 66 a1 fe ff    	lea    eax,[ebx-0x15e9a]
 80495f2:	50                   	push   eax
 80495f3:	68 94 01 00 00       	push   0x194
 80495f8:	ff b4 24 90 00 00 00 	push   DWORD PTR [esp+0x90]
 80495ff:	e8 cc f9 ff ff       	call   8048fd0 <client_http_error>
 8049604:	83 c4 20             	add    esp,0x20
 8049607:	e9 18 fd ff ff       	jmp    8049324 <client_process_request+0x94>
 804960c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8049610:	83 ec 0c             	sub    esp,0xc
 8049613:	56                   	push   esi
 8049614:	e8 d7 3a 01 00       	call   805d0f0 <strlen>
 8049619:	83 c4 10             	add    esp,0x10
 804961c:	85 c0                	test   eax,eax
 804961e:	74 22                	je     8049642 <client_process_request+0x3b2>
 8049620:	80 7c 06 ff 2f       	cmp    BYTE PTR [esi+eax*1-0x1],0x2f
 8049625:	8d 50 ff             	lea    edx,[eax-0x1]
 8049628:	75 18                	jne    8049642 <client_process_request+0x3b2>
 804962a:	8d 46 ff             	lea    eax,[esi-0x1]
 804962d:	eb 0a                	jmp    8049639 <client_process_request+0x3a9>
 804962f:	90                   	nop
 8049630:	83 ea 01             	sub    edx,0x1
 8049633:	80 3c 16 2f          	cmp    BYTE PTR [esi+edx*1],0x2f
 8049637:	75 09                	jne    8049642 <client_process_request+0x3b2>
 8049639:	85 d2                	test   edx,edx
 804963b:	c6 44 10 01 00       	mov    BYTE PTR [eax+edx*1+0x1],0x0
 8049640:	75 ee                	jne    8049630 <client_process_request+0x3a0>
 8049642:	8d 83 57 0e fd ff    	lea    eax,[ebx-0x2f1a9]
 8049648:	83 ec 04             	sub    esp,0x4
 804964b:	56                   	push   esi
 804964c:	50                   	push   eax
 804964d:	55                   	push   ebp
 804964e:	e8 9d 68 00 00       	call   804fef0 <___asprintf>
 8049653:	89 34 24             	mov    DWORD PTR [esp],esi
 8049656:	e8 05 1c 01 00       	call   805b260 <__cfree>
 804965b:	83 c4 0c             	add    esp,0xc
 804965e:	57                   	push   edi
 804965f:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 8049663:	6a 03                	push   0x3
 8049665:	e8 96 70 02 00       	call   8070700 <__xstat>
 804966a:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
 804966e:	83 c4 10             	add    esp,0x10
 8049671:	e9 e5 fd ff ff       	jmp    804945b <client_process_request+0x1cb>
 8049676:	8d 76 00             	lea    esi,[esi+0x0]
 8049679:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
 8049680:	e8 0b 0c 00 00       	call   804a290 <__errno_location>
 8049685:	83 ec 0c             	sub    esp,0xc
 8049688:	ff 30                	push   DWORD PTR [eax]
 804968a:	89 c7                	mov    edi,eax
 804968c:	e8 6f 38 01 00       	call   805cf00 <strerror>
 8049691:	31 d2                	xor    edx,edx
 8049693:	83 3f 0d             	cmp    DWORD PTR [edi],0xd
 8049696:	89 34 24             	mov    DWORD PTR [esp],esi
 8049699:	50                   	push   eax
 804969a:	8d 83 62 a1 fe ff    	lea    eax,[ebx-0x15e9e]
 80496a0:	50                   	push   eax
 80496a1:	0f 95 c2             	setne  dl
 80496a4:	81 c2 93 01 00 00    	add    edx,0x193
 80496aa:	52                   	push   edx
 80496ab:	ff b4 24 90 00 00 00 	push   DWORD PTR [esp+0x90]
 80496b2:	e8 19 f9 ff ff       	call   8048fd0 <client_http_error>
 80496b7:	83 c4 20             	add    esp,0x20
 80496ba:	e9 65 fc ff ff       	jmp    8049324 <client_process_request+0x94>
 80496bf:	90                   	nop
 80496c0:	83 ec 0c             	sub    esp,0xc
 80496c3:	57                   	push   edi
 80496c4:	e8 37 38 01 00       	call   805cf00 <strerror>
 80496c9:	50                   	push   eax
 80496ca:	8d 83 66 a1 fe ff    	lea    eax,[ebx-0x15e9a]
 80496d0:	50                   	push   eax
 80496d1:	68 93 01 00 00       	push   0x193
 80496d6:	ff b4 24 90 00 00 00 	push   DWORD PTR [esp+0x90]
 80496dd:	e8 ee f8 ff ff       	call   8048fd0 <client_http_error>
 80496e2:	83 c4 20             	add    esp,0x20
 80496e5:	e9 3a fc ff ff       	jmp    8049324 <client_process_request+0x94>

080496ea <__x86.get_pc_thunk.ax>:
 80496ea:	8b 04 24             	mov    eax,DWORD PTR [esp]
 80496ed:	c3                   	ret
 80496ee:	66 90                	xchg   ax,ax
