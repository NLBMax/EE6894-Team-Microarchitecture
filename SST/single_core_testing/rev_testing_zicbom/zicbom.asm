
zicbom.exe:     file format elf64-littleriscv


Disassembly of section .text:

0000000000010120 <exit>:
   10120:	1141                	c.addi	sp,-16
   10122:	4581                	c.li	a1,0
   10124:	e022                	c.sdsp	s0,0(sp)
   10126:	e406                	c.sdsp	ra,8(sp)
   10128:	842a                	c.mv	s0,a0
   1012a:	001000ef          	jal	ra,1092a <__call_exitprocs>
   1012e:	8201b783          	ld	a5,-2016(gp) # 129b8 <__stdio_exit_handler>
   10132:	c391                	c.beqz	a5,10136 <exit+0x16>
   10134:	9782                	c.jalr	a5
   10136:	8522                	c.mv	a0,s0
   10138:	5f8010ef          	jal	ra,11730 <_exit>

000000000001013c <register_fini>:
   1013c:	00000793          	addi	a5,zero,0
   10140:	c791                	c.beqz	a5,1014c <register_fini+0x10>
   10142:	6545                	c.lui	a0,0x11
   10144:	65a50513          	addi	a0,a0,1626 # 1165a <__libc_fini_array>
   10148:	0b10006f          	jal	zero,109f8 <atexit>
   1014c:	8082                	c.jr	ra

000000000001014e <_start>:
   1014e:	00003197          	auipc	gp,0x3
   10152:	04a18193          	addi	gp,gp,74 # 13198 <__global_pointer$>
   10156:	82018513          	addi	a0,gp,-2016 # 129b8 <__stdio_exit_handler>
   1015a:	0000f617          	auipc	a2,0xf
   1015e:	e1e60613          	addi	a2,a2,-482 # 1ef78 <__BSS_END__>
   10162:	8e09                	c.sub	a2,a0
   10164:	4581                	c.li	a1,0
   10166:	71a000ef          	jal	ra,10880 <memset>
   1016a:	00001517          	auipc	a0,0x1
   1016e:	88e50513          	addi	a0,a0,-1906 # 109f8 <atexit>
   10172:	c519                	c.beqz	a0,10180 <_start+0x32>
   10174:	00001517          	auipc	a0,0x1
   10178:	4e650513          	addi	a0,a0,1254 # 1165a <__libc_fini_array>
   1017c:	07d000ef          	jal	ra,109f8 <atexit>
   10180:	696000ef          	jal	ra,10816 <__libc_init_array>
   10184:	4502                	c.lwsp	a0,0(sp)
   10186:	002c                	c.addi4spn	a1,sp,8
   10188:	4601                	c.li	a2,0
   1018a:	04e000ef          	jal	ra,101d8 <main>
   1018e:	bf49                	c.j	10120 <exit>

0000000000010190 <__do_global_dtors_aux>:
   10190:	1141                	c.addi	sp,-16
   10192:	e022                	c.sdsp	s0,0(sp)
   10194:	8581c783          	lbu	a5,-1960(gp) # 129f0 <completed.1>
   10198:	e406                	c.sdsp	ra,8(sp)
   1019a:	ef91                	c.bnez	a5,101b6 <__do_global_dtors_aux+0x26>
   1019c:	00000793          	addi	a5,zero,0
   101a0:	cb81                	c.beqz	a5,101b0 <__do_global_dtors_aux+0x20>
   101a2:	6549                	c.lui	a0,0x12
   101a4:	83850513          	addi	a0,a0,-1992 # 11838 <__EH_FRAME_BEGIN__>
   101a8:	00000097          	auipc	ra,0x0
   101ac:	000000e7          	jalr	ra,0(zero) # 0 <exit-0x10120>
   101b0:	4785                	c.li	a5,1
   101b2:	84f18c23          	sb	a5,-1960(gp) # 129f0 <completed.1>
   101b6:	60a2                	c.ldsp	ra,8(sp)
   101b8:	6402                	c.ldsp	s0,0(sp)
   101ba:	0141                	c.addi	sp,16
   101bc:	8082                	c.jr	ra

00000000000101be <frame_dummy>:
   101be:	00000793          	addi	a5,zero,0
   101c2:	cb91                	c.beqz	a5,101d6 <frame_dummy+0x18>
   101c4:	6549                	c.lui	a0,0x12
   101c6:	86018593          	addi	a1,gp,-1952 # 129f8 <object.0>
   101ca:	83850513          	addi	a0,a0,-1992 # 11838 <__EH_FRAME_BEGIN__>
   101ce:	00000317          	auipc	t1,0x0
   101d2:	00000067          	jalr	zero,0(zero) # 0 <exit-0x10120>
   101d6:	8082                	c.jr	ra

00000000000101d8 <main>:
   101d8:	7139                	c.addi16sp	sp,-64
   101da:	fc06                	c.sdsp	ra,56(sp)
   101dc:	f822                	c.sdsp	s0,48(sp)
   101de:	0080                	c.addi4spn	s0,sp,64
   101e0:	87aa                	c.mv	a5,a0
   101e2:	fcb43023          	sd	a1,-64(s0)
   101e6:	fcf42623          	sw	a5,-52(s0)
   101ea:	fe042423          	sw	zero,-24(s0)
   101ee:	fe042623          	sw	zero,-20(s0)
   101f2:	67cd                	c.lui	a5,0x13
   101f4:	a2878793          	addi	a5,a5,-1496 # 12a28 <A>
   101f8:	fef43023          	sd	a5,-32(s0)
   101fc:	67dd                	c.lui	a5,0x17
   101fe:	a2878793          	addi	a5,a5,-1496 # 16a28 <B>
   10202:	fcf43c23          	sd	a5,-40(s0)
   10206:	67ed                	c.lui	a5,0x1b
   10208:	a2878793          	addi	a5,a5,-1496 # 1aa28 <C>
   1020c:	fcf43823          	sd	a5,-48(s0)
   10210:	fe042623          	sw	zero,-20(s0)
   10214:	a0bd                	c.j	10282 <main+0xaa>
   10216:	fcc42783          	lw	a5,-52(s0)
   1021a:	873e                	c.mv	a4,a5
   1021c:	fec42783          	lw	a5,-20(s0)
   10220:	9fb9                	c.addw	a5,a4
   10222:	0007871b          	addiw	a4,a5,0
   10226:	67cd                	c.lui	a5,0x13
   10228:	a2878693          	addi	a3,a5,-1496 # 12a28 <A>
   1022c:	fec42783          	lw	a5,-20(s0)
   10230:	078a                	c.slli	a5,0x2
   10232:	97b6                	c.add	a5,a3
   10234:	c398                	c.sw	a4,0(a5)
   10236:	fcc42783          	lw	a5,-52(s0)
   1023a:	873e                	c.mv	a4,a5
   1023c:	fec42783          	lw	a5,-20(s0)
   10240:	02f707bb          	mulw	a5,a4,a5
   10244:	0007871b          	addiw	a4,a5,0
   10248:	67dd                	c.lui	a5,0x17
   1024a:	a2878693          	addi	a3,a5,-1496 # 16a28 <B>
   1024e:	fec42783          	lw	a5,-20(s0)
   10252:	078a                	c.slli	a5,0x2
   10254:	97b6                	c.add	a5,a3
   10256:	c398                	c.sw	a4,0(a5)
   10258:	fec42783          	lw	a5,-20(s0)
   1025c:	fcc42703          	lw	a4,-52(s0)
   10260:	00f717bb          	sllw	a5,a4,a5
   10264:	0007871b          	addiw	a4,a5,0
   10268:	67ed                	c.lui	a5,0x1b
   1026a:	a2878693          	addi	a3,a5,-1496 # 1aa28 <C>
   1026e:	fec42783          	lw	a5,-20(s0)
   10272:	078a                	c.slli	a5,0x2
   10274:	97b6                	c.add	a5,a3
   10276:	c398                	c.sw	a4,0(a5)
   10278:	fec42783          	lw	a5,-20(s0)
   1027c:	2785                	c.addiw	a5,1
   1027e:	fef42623          	sw	a5,-20(s0)
   10282:	fec42783          	lw	a5,-20(s0)
   10286:	0007871b          	addiw	a4,a5,0
   1028a:	6785                	c.lui	a5,0x1
   1028c:	f8f745e3          	blt	a4,a5,10216 <main+0x3e>
   10290:	fe043783          	ld	a5,-32(s0)
   10294:	0017a00f          	cbo.clean	(a5)
   10298:	fef43023          	sd	a5,-32(s0)
   1029c:	fd843783          	ld	a5,-40(s0)
   102a0:	0027a00f          	cbo.flush	(a5)
   102a4:	fcf43c23          	sd	a5,-40(s0)
   102a8:	fd043783          	ld	a5,-48(s0)
   102ac:	0007a00f          	cbo.inval	(a5)
   102b0:	fcf43823          	sd	a5,-48(s0)
   102b4:	4781                	c.li	a5,0
   102b6:	853e                	c.mv	a0,a5
   102b8:	70e2                	c.ldsp	ra,56(sp)
   102ba:	7442                	c.ldsp	s0,48(sp)
   102bc:	6121                	c.addi16sp	sp,64
   102be:	8082                	c.jr	ra

00000000000102c0 <__fp_lock>:
   102c0:	4501                	c.li	a0,0
   102c2:	8082                	c.jr	ra

00000000000102c4 <stdio_exit_handler>:
   102c4:	6649                	c.lui	a2,0x12
   102c6:	65c5                	c.lui	a1,0x11
   102c8:	6549                	c.lui	a0,0x12
   102ca:	01860613          	addi	a2,a2,24 # 12018 <__sglue>
   102ce:	35258593          	addi	a1,a1,850 # 11352 <_fclose_r>
   102d2:	03050513          	addi	a0,a0,48 # 12030 <_impure_data>
   102d6:	acad                	c.j	10550 <_fwalk_sglue>

00000000000102d8 <cleanup_stdio>:
   102d8:	650c                	c.ld	a1,8(a0)
   102da:	1141                	c.addi	sp,-16
   102dc:	0001f7b7          	lui	a5,0x1f
   102e0:	e022                	c.sdsp	s0,0(sp)
   102e2:	e406                	c.sdsp	ra,8(sp)
   102e4:	a2878793          	addi	a5,a5,-1496 # 1ea28 <__sf>
   102e8:	842a                	c.mv	s0,a0
   102ea:	00f58463          	beq	a1,a5,102f2 <cleanup_stdio+0x1a>
   102ee:	064010ef          	jal	ra,11352 <_fclose_r>
   102f2:	680c                	c.ld	a1,16(s0)
   102f4:	0001f7b7          	lui	a5,0x1f
   102f8:	ad878793          	addi	a5,a5,-1320 # 1ead8 <__sf+0xb0>
   102fc:	00f58563          	beq	a1,a5,10306 <cleanup_stdio+0x2e>
   10300:	8522                	c.mv	a0,s0
   10302:	050010ef          	jal	ra,11352 <_fclose_r>
   10306:	6c0c                	c.ld	a1,24(s0)
   10308:	0001f7b7          	lui	a5,0x1f
   1030c:	b8878793          	addi	a5,a5,-1144 # 1eb88 <__sf+0x160>
   10310:	00f58863          	beq	a1,a5,10320 <cleanup_stdio+0x48>
   10314:	8522                	c.mv	a0,s0
   10316:	6402                	c.ldsp	s0,0(sp)
   10318:	60a2                	c.ldsp	ra,8(sp)
   1031a:	0141                	c.addi	sp,16
   1031c:	0360106f          	jal	zero,11352 <_fclose_r>
   10320:	60a2                	c.ldsp	ra,8(sp)
   10322:	6402                	c.ldsp	s0,0(sp)
   10324:	0141                	c.addi	sp,16
   10326:	8082                	c.jr	ra

0000000000010328 <__fp_unlock>:
   10328:	4501                	c.li	a0,0
   1032a:	8082                	c.jr	ra

000000000001032c <global_stdio_init.part.0>:
   1032c:	7179                	c.addi16sp	sp,-48
   1032e:	f022                	c.sdsp	s0,32(sp)
   10330:	67c1                	c.lui	a5,0x10
   10332:	0001f437          	lui	s0,0x1f
   10336:	0001f537          	lui	a0,0x1f
   1033a:	a2840413          	addi	s0,s0,-1496 # 1ea28 <__sf>
   1033e:	f406                	c.sdsp	ra,40(sp)
   10340:	ec26                	c.sdsp	s1,24(sp)
   10342:	e84a                	c.sdsp	s2,16(sp)
   10344:	e44e                	c.sdsp	s3,8(sp)
   10346:	e052                	c.sdsp	s4,0(sp)
   10348:	4711                	c.li	a4,4
   1034a:	2c478793          	addi	a5,a5,708 # 102c4 <stdio_exit_handler>
   1034e:	4621                	c.li	a2,8
   10350:	4581                	c.li	a1,0
   10352:	acc50513          	addi	a0,a0,-1332 # 1eacc <__sf+0xa4>
   10356:	82f1b023          	sd	a5,-2016(gp) # 129b8 <__stdio_exit_handler>
   1035a:	c818                	c.sw	a4,16(s0)
   1035c:	00043023          	sd	zero,0(s0)
   10360:	00043423          	sd	zero,8(s0)
   10364:	0a042623          	sw	zero,172(s0)
   10368:	00043c23          	sd	zero,24(s0)
   1036c:	02042023          	sw	zero,32(s0)
   10370:	02042423          	sw	zero,40(s0)
   10374:	50c000ef          	jal	ra,10880 <memset>
   10378:	67c1                	c.lui	a5,0x10
   1037a:	6a41                	c.lui	s4,0x10
   1037c:	69c1                	c.lui	s3,0x10
   1037e:	6941                	c.lui	s2,0x10
   10380:	64c1                	c.lui	s1,0x10
   10382:	0001f537          	lui	a0,0x1f
   10386:	5d2a0a13          	addi	s4,s4,1490 # 105d2 <__sread>
   1038a:	60e98993          	addi	s3,s3,1550 # 1060e <__swrite>
   1038e:	66090913          	addi	s2,s2,1632 # 10660 <__sseek>
   10392:	69e48493          	addi	s1,s1,1694 # 1069e <__sclose>
   10396:	07a5                	c.addi	a5,9 # 10009 <exit-0x117>
   10398:	4621                	c.li	a2,8
   1039a:	4581                	c.li	a1,0
   1039c:	b7c50513          	addi	a0,a0,-1156 # 1eb7c <__sf+0x154>
   103a0:	0cf42023          	sw	a5,192(s0)
   103a4:	03443c23          	sd	s4,56(s0)
   103a8:	05343023          	sd	s3,64(s0)
   103ac:	05243423          	sd	s2,72(s0)
   103b0:	e824                	c.sd	s1,80(s0)
   103b2:	f800                	c.sd	s0,48(s0)
   103b4:	0a043823          	sd	zero,176(s0)
   103b8:	0a043c23          	sd	zero,184(s0)
   103bc:	14042e23          	sw	zero,348(s0)
   103c0:	0c043423          	sd	zero,200(s0)
   103c4:	0c042823          	sw	zero,208(s0)
   103c8:	0c042c23          	sw	zero,216(s0)
   103cc:	4b4000ef          	jal	ra,10880 <memset>
   103d0:	0001f737          	lui	a4,0x1f
   103d4:	000207b7          	lui	a5,0x20
   103d8:	0001f537          	lui	a0,0x1f
   103dc:	07c9                	c.addi	a5,18 # 20012 <__BSS_END__+0x109a>
   103de:	ad870713          	addi	a4,a4,-1320 # 1ead8 <__sf+0xb0>
   103e2:	c2c50513          	addi	a0,a0,-980 # 1ec2c <__sf+0x204>
   103e6:	4621                	c.li	a2,8
   103e8:	4581                	c.li	a1,0
   103ea:	0f443423          	sd	s4,232(s0)
   103ee:	0f343823          	sd	s3,240(s0)
   103f2:	0f243c23          	sd	s2,248(s0)
   103f6:	10943023          	sd	s1,256(s0)
   103fa:	16f42823          	sw	a5,368(s0)
   103fe:	16043023          	sd	zero,352(s0)
   10402:	16043423          	sd	zero,360(s0)
   10406:	20042623          	sw	zero,524(s0)
   1040a:	16043c23          	sd	zero,376(s0)
   1040e:	18042023          	sw	zero,384(s0)
   10412:	18042423          	sw	zero,392(s0)
   10416:	f078                	c.sd	a4,224(s0)
   10418:	468000ef          	jal	ra,10880 <memset>
   1041c:	0001f7b7          	lui	a5,0x1f
   10420:	b8878793          	addi	a5,a5,-1144 # 1eb88 <__sf+0x160>
   10424:	19443c23          	sd	s4,408(s0)
   10428:	1b343023          	sd	s3,416(s0)
   1042c:	1b243423          	sd	s2,424(s0)
   10430:	1a943823          	sd	s1,432(s0)
   10434:	70a2                	c.ldsp	ra,40(sp)
   10436:	18f43823          	sd	a5,400(s0)
   1043a:	7402                	c.ldsp	s0,32(sp)
   1043c:	64e2                	c.ldsp	s1,24(sp)
   1043e:	6942                	c.ldsp	s2,16(sp)
   10440:	69a2                	c.ldsp	s3,8(sp)
   10442:	6a02                	c.ldsp	s4,0(sp)
   10444:	6145                	c.addi16sp	sp,48
   10446:	8082                	c.jr	ra

0000000000010448 <__sfp>:
   10448:	8201b783          	ld	a5,-2016(gp) # 129b8 <__stdio_exit_handler>
   1044c:	7179                	c.addi16sp	sp,-48
   1044e:	e84a                	c.sdsp	s2,16(sp)
   10450:	f406                	c.sdsp	ra,40(sp)
   10452:	f022                	c.sdsp	s0,32(sp)
   10454:	ec26                	c.sdsp	s1,24(sp)
   10456:	e44e                	c.sdsp	s3,8(sp)
   10458:	892a                	c.mv	s2,a0
   1045a:	c7cd                	c.beqz	a5,10504 <__sfp+0xbc>
   1045c:	64c9                	c.lui	s1,0x12
   1045e:	01848493          	addi	s1,s1,24 # 12018 <__sglue>
   10462:	0b000993          	addi	s3,zero,176
   10466:	4498                	c.lw	a4,8(s1)
   10468:	6880                	c.ld	s0,16(s1)
   1046a:	06e05463          	bge	zero,a4,104d2 <__sfp+0x8a>
   1046e:	1702                	c.slli	a4,0x20
   10470:	9301                	c.srli	a4,0x20
   10472:	03370733          	mul	a4,a4,s3
   10476:	9722                	c.add	a4,s0
   10478:	a029                	c.j	10482 <__sfp+0x3a>
   1047a:	0b040413          	addi	s0,s0,176
   1047e:	04e40a63          	beq	s0,a4,104d2 <__sfp+0x8a>
   10482:	01041783          	lh	a5,16(s0)
   10486:	fbf5                	c.bnez	a5,1047a <__sfp+0x32>
   10488:	77c1                	c.lui	a5,0xffff0
   1048a:	0785                	c.addi	a5,1 # ffffffffffff0001 <__BSS_END__+0xfffffffffffd1089>
   1048c:	0a042623          	sw	zero,172(s0)
   10490:	00043023          	sd	zero,0(s0)
   10494:	00043423          	sd	zero,8(s0)
   10498:	00043c23          	sd	zero,24(s0)
   1049c:	02042023          	sw	zero,32(s0)
   104a0:	02042423          	sw	zero,40(s0)
   104a4:	c81c                	c.sw	a5,16(s0)
   104a6:	4621                	c.li	a2,8
   104a8:	4581                	c.li	a1,0
   104aa:	0a440513          	addi	a0,s0,164
   104ae:	3d2000ef          	jal	ra,10880 <memset>
   104b2:	04043c23          	sd	zero,88(s0)
   104b6:	06042023          	sw	zero,96(s0)
   104ba:	06043c23          	sd	zero,120(s0)
   104be:	08042023          	sw	zero,128(s0)
   104c2:	70a2                	c.ldsp	ra,40(sp)
   104c4:	8522                	c.mv	a0,s0
   104c6:	7402                	c.ldsp	s0,32(sp)
   104c8:	64e2                	c.ldsp	s1,24(sp)
   104ca:	6942                	c.ldsp	s2,16(sp)
   104cc:	69a2                	c.ldsp	s3,8(sp)
   104ce:	6145                	c.addi16sp	sp,48
   104d0:	8082                	c.jr	ra
   104d2:	6080                	c.ld	s0,0(s1)
   104d4:	c019                	c.beqz	s0,104da <__sfp+0x92>
   104d6:	84a2                	c.mv	s1,s0
   104d8:	b779                	c.j	10466 <__sfp+0x1e>
   104da:	2d800593          	addi	a1,zero,728
   104de:	854a                	c.mv	a0,s2
   104e0:	03b000ef          	jal	ra,10d1a <_malloc_r>
   104e4:	842a                	c.mv	s0,a0
   104e6:	c115                	c.beqz	a0,1050a <__sfp+0xc2>
   104e8:	4791                	c.li	a5,4
   104ea:	0561                	c.addi	a0,24
   104ec:	00043023          	sd	zero,0(s0)
   104f0:	c41c                	c.sw	a5,8(s0)
   104f2:	e808                	c.sd	a0,16(s0)
   104f4:	2c000613          	addi	a2,zero,704
   104f8:	4581                	c.li	a1,0
   104fa:	386000ef          	jal	ra,10880 <memset>
   104fe:	e080                	c.sd	s0,0(s1)
   10500:	84a2                	c.mv	s1,s0
   10502:	b795                	c.j	10466 <__sfp+0x1e>
   10504:	e29ff0ef          	jal	ra,1032c <global_stdio_init.part.0>
   10508:	bf91                	c.j	1045c <__sfp+0x14>
   1050a:	0004b023          	sd	zero,0(s1)
   1050e:	47b1                	c.li	a5,12
   10510:	00f92023          	sw	a5,0(s2)
   10514:	b77d                	c.j	104c2 <__sfp+0x7a>

0000000000010516 <__sinit>:
   10516:	653c                	c.ld	a5,72(a0)
   10518:	c391                	c.beqz	a5,1051c <__sinit+0x6>
   1051a:	8082                	c.jr	ra
   1051c:	67c1                	c.lui	a5,0x10
   1051e:	8201b703          	ld	a4,-2016(gp) # 129b8 <__stdio_exit_handler>
   10522:	2d878793          	addi	a5,a5,728 # 102d8 <cleanup_stdio>
   10526:	e53c                	c.sd	a5,72(a0)
   10528:	fb6d                	c.bnez	a4,1051a <__sinit+0x4>
   1052a:	b509                	c.j	1032c <global_stdio_init.part.0>

000000000001052c <__sfp_lock_acquire>:
   1052c:	8082                	c.jr	ra

000000000001052e <__sfp_lock_release>:
   1052e:	8082                	c.jr	ra

0000000000010530 <__fp_lock_all>:
   10530:	6649                	c.lui	a2,0x12
   10532:	65c1                	c.lui	a1,0x10
   10534:	01860613          	addi	a2,a2,24 # 12018 <__sglue>
   10538:	2c058593          	addi	a1,a1,704 # 102c0 <__fp_lock>
   1053c:	4501                	c.li	a0,0
   1053e:	a809                	c.j	10550 <_fwalk_sglue>

0000000000010540 <__fp_unlock_all>:
   10540:	6649                	c.lui	a2,0x12
   10542:	65c1                	c.lui	a1,0x10
   10544:	01860613          	addi	a2,a2,24 # 12018 <__sglue>
   10548:	32858593          	addi	a1,a1,808 # 10328 <__fp_unlock>
   1054c:	4501                	c.li	a0,0
   1054e:	a009                	c.j	10550 <_fwalk_sglue>

0000000000010550 <_fwalk_sglue>:
   10550:	715d                	c.addi16sp	sp,-80
   10552:	f84a                	c.sdsp	s2,48(sp)
   10554:	f44e                	c.sdsp	s3,40(sp)
   10556:	f052                	c.sdsp	s4,32(sp)
   10558:	ec56                	c.sdsp	s5,24(sp)
   1055a:	e85a                	c.sdsp	s6,16(sp)
   1055c:	e45e                	c.sdsp	s7,8(sp)
   1055e:	e062                	c.sdsp	s8,0(sp)
   10560:	e486                	c.sdsp	ra,72(sp)
   10562:	e0a2                	c.sdsp	s0,64(sp)
   10564:	fc26                	c.sdsp	s1,56(sp)
   10566:	8a2a                	c.mv	s4,a0
   10568:	8b2e                	c.mv	s6,a1
   1056a:	89b2                	c.mv	s3,a2
   1056c:	4901                	c.li	s2,0
   1056e:	0b000b93          	addi	s7,zero,176
   10572:	4c05                	c.li	s8,1
   10574:	5afd                	c.li	s5,-1
   10576:	0089a483          	lw	s1,8(s3)
   1057a:	0109b403          	ld	s0,16(s3)
   1057e:	02905963          	bge	zero,s1,105b0 <_fwalk_sglue+0x60>
   10582:	1482                	c.slli	s1,0x20
   10584:	9081                	c.srli	s1,0x20
   10586:	037484b3          	mul	s1,s1,s7
   1058a:	94a2                	c.add	s1,s0
   1058c:	01045783          	lhu	a5,16(s0)
   10590:	00fc7c63          	bgeu	s8,a5,105a8 <_fwalk_sglue+0x58>
   10594:	01241783          	lh	a5,18(s0)
   10598:	85a2                	c.mv	a1,s0
   1059a:	8552                	c.mv	a0,s4
   1059c:	01578663          	beq	a5,s5,105a8 <_fwalk_sglue+0x58>
   105a0:	9b02                	c.jalr	s6
   105a2:	01256933          	or	s2,a0,s2
   105a6:	2901                	c.addiw	s2,0
   105a8:	0b040413          	addi	s0,s0,176
   105ac:	fe9410e3          	bne	s0,s1,1058c <_fwalk_sglue+0x3c>
   105b0:	0009b983          	ld	s3,0(s3)
   105b4:	fc0991e3          	bne	s3,zero,10576 <_fwalk_sglue+0x26>
   105b8:	60a6                	c.ldsp	ra,72(sp)
   105ba:	6406                	c.ldsp	s0,64(sp)
   105bc:	74e2                	c.ldsp	s1,56(sp)
   105be:	79a2                	c.ldsp	s3,40(sp)
   105c0:	7a02                	c.ldsp	s4,32(sp)
   105c2:	6ae2                	c.ldsp	s5,24(sp)
   105c4:	6b42                	c.ldsp	s6,16(sp)
   105c6:	6ba2                	c.ldsp	s7,8(sp)
   105c8:	6c02                	c.ldsp	s8,0(sp)
   105ca:	854a                	c.mv	a0,s2
   105cc:	7942                	c.ldsp	s2,48(sp)
   105ce:	6161                	c.addi16sp	sp,80
   105d0:	8082                	c.jr	ra

00000000000105d2 <__sread>:
   105d2:	1141                	c.addi	sp,-16
   105d4:	e022                	c.sdsp	s0,0(sp)
   105d6:	842e                	c.mv	s0,a1
   105d8:	01259583          	lh	a1,18(a1)
   105dc:	e406                	c.sdsp	ra,8(sp)
   105de:	1c0000ef          	jal	ra,1079e <_read_r>
   105e2:	00054963          	blt	a0,zero,105f4 <__sread+0x22>
   105e6:	685c                	c.ld	a5,144(s0)
   105e8:	60a2                	c.ldsp	ra,8(sp)
   105ea:	97aa                	c.add	a5,a0
   105ec:	e85c                	c.sd	a5,144(s0)
   105ee:	6402                	c.ldsp	s0,0(sp)
   105f0:	0141                	c.addi	sp,16
   105f2:	8082                	c.jr	ra
   105f4:	01045783          	lhu	a5,16(s0)
   105f8:	777d                	c.lui	a4,0xfffff
   105fa:	177d                	c.addi	a4,-1 # ffffffffffffefff <__BSS_END__+0xfffffffffffe0087>
   105fc:	8ff9                	c.and	a5,a4
   105fe:	60a2                	c.ldsp	ra,8(sp)
   10600:	00f41823          	sh	a5,16(s0)
   10604:	6402                	c.ldsp	s0,0(sp)
   10606:	0141                	c.addi	sp,16
   10608:	8082                	c.jr	ra

000000000001060a <__seofread>:
   1060a:	4501                	c.li	a0,0
   1060c:	8082                	c.jr	ra

000000000001060e <__swrite>:
   1060e:	01059783          	lh	a5,16(a1)
   10612:	7179                	c.addi16sp	sp,-48
   10614:	f022                	c.sdsp	s0,32(sp)
   10616:	ec26                	c.sdsp	s1,24(sp)
   10618:	e84a                	c.sdsp	s2,16(sp)
   1061a:	e44e                	c.sdsp	s3,8(sp)
   1061c:	f406                	c.sdsp	ra,40(sp)
   1061e:	1007f713          	andi	a4,a5,256
   10622:	842e                	c.mv	s0,a1
   10624:	8932                	c.mv	s2,a2
   10626:	89b6                	c.mv	s3,a3
   10628:	84aa                	c.mv	s1,a0
   1062a:	e315                	c.bnez	a4,1064e <__swrite+0x40>
   1062c:	777d                	c.lui	a4,0xfffff
   1062e:	177d                	c.addi	a4,-1 # ffffffffffffefff <__BSS_END__+0xfffffffffffe0087>
   10630:	8ff9                	c.and	a5,a4
   10632:	01241583          	lh	a1,18(s0)
   10636:	00f41823          	sh	a5,16(s0)
   1063a:	7402                	c.ldsp	s0,32(sp)
   1063c:	70a2                	c.ldsp	ra,40(sp)
   1063e:	86ce                	c.mv	a3,s3
   10640:	864a                	c.mv	a2,s2
   10642:	69a2                	c.ldsp	s3,8(sp)
   10644:	6942                	c.ldsp	s2,16(sp)
   10646:	8526                	c.mv	a0,s1
   10648:	64e2                	c.ldsp	s1,24(sp)
   1064a:	6145                	c.addi16sp	sp,48
   1064c:	a279                	c.j	107da <_write_r>
   1064e:	01259583          	lh	a1,18(a1)
   10652:	4689                	c.li	a3,2
   10654:	4601                	c.li	a2,0
   10656:	10c000ef          	jal	ra,10762 <_lseek_r>
   1065a:	01041783          	lh	a5,16(s0)
   1065e:	b7f9                	c.j	1062c <__swrite+0x1e>

0000000000010660 <__sseek>:
   10660:	1141                	c.addi	sp,-16
   10662:	e022                	c.sdsp	s0,0(sp)
   10664:	842e                	c.mv	s0,a1
   10666:	01259583          	lh	a1,18(a1)
   1066a:	e406                	c.sdsp	ra,8(sp)
   1066c:	0f6000ef          	jal	ra,10762 <_lseek_r>
   10670:	577d                	c.li	a4,-1
   10672:	01041783          	lh	a5,16(s0)
   10676:	00e50b63          	beq	a0,a4,1068c <__sseek+0x2c>
   1067a:	6705                	c.lui	a4,0x1
   1067c:	8fd9                	c.or	a5,a4
   1067e:	60a2                	c.ldsp	ra,8(sp)
   10680:	e848                	c.sd	a0,144(s0)
   10682:	00f41823          	sh	a5,16(s0)
   10686:	6402                	c.ldsp	s0,0(sp)
   10688:	0141                	c.addi	sp,16
   1068a:	8082                	c.jr	ra
   1068c:	777d                	c.lui	a4,0xfffff
   1068e:	177d                	c.addi	a4,-1 # ffffffffffffefff <__BSS_END__+0xfffffffffffe0087>
   10690:	8ff9                	c.and	a5,a4
   10692:	60a2                	c.ldsp	ra,8(sp)
   10694:	00f41823          	sh	a5,16(s0)
   10698:	6402                	c.ldsp	s0,0(sp)
   1069a:	0141                	c.addi	sp,16
   1069c:	8082                	c.jr	ra

000000000001069e <__sclose>:
   1069e:	01259583          	lh	a1,18(a1)
   106a2:	a009                	c.j	106a4 <_close_r>

00000000000106a4 <_close_r>:
   106a4:	1101                	c.addi	sp,-32
   106a6:	e822                	c.sdsp	s0,16(sp)
   106a8:	e426                	c.sdsp	s1,8(sp)
   106aa:	842a                	c.mv	s0,a0
   106ac:	852e                	c.mv	a0,a1
   106ae:	ec06                	c.sdsp	ra,24(sp)
   106b0:	8201a423          	sw	zero,-2008(gp) # 129c0 <errno>
   106b4:	050010ef          	jal	ra,11704 <_close>
   106b8:	57fd                	c.li	a5,-1
   106ba:	00f50763          	beq	a0,a5,106c8 <_close_r+0x24>
   106be:	60e2                	c.ldsp	ra,24(sp)
   106c0:	6442                	c.ldsp	s0,16(sp)
   106c2:	64a2                	c.ldsp	s1,8(sp)
   106c4:	6105                	c.addi16sp	sp,32
   106c6:	8082                	c.jr	ra
   106c8:	8281a783          	lw	a5,-2008(gp) # 129c0 <errno>
   106cc:	dbed                	c.beqz	a5,106be <_close_r+0x1a>
   106ce:	60e2                	c.ldsp	ra,24(sp)
   106d0:	c01c                	c.sw	a5,0(s0)
   106d2:	6442                	c.ldsp	s0,16(sp)
   106d4:	64a2                	c.ldsp	s1,8(sp)
   106d6:	6105                	c.addi16sp	sp,32
   106d8:	8082                	c.jr	ra

00000000000106da <_reclaim_reent>:
   106da:	67cd                	c.lui	a5,0x13
   106dc:	9a07b783          	ld	a5,-1632(a5) # 129a0 <_impure_ptr>
   106e0:	08a78063          	beq	a5,a0,10760 <_reclaim_reent+0x86>
   106e4:	752c                	c.ld	a1,104(a0)
   106e6:	7179                	c.addi16sp	sp,-48
   106e8:	ec26                	c.sdsp	s1,24(sp)
   106ea:	f406                	c.sdsp	ra,40(sp)
   106ec:	f022                	c.sdsp	s0,32(sp)
   106ee:	84aa                	c.mv	s1,a0
   106f0:	c98d                	c.beqz	a1,10722 <_reclaim_reent+0x48>
   106f2:	e84a                	c.sdsp	s2,16(sp)
   106f4:	e44e                	c.sdsp	s3,8(sp)
   106f6:	4901                	c.li	s2,0
   106f8:	20000993          	addi	s3,zero,512
   106fc:	012587b3          	add	a5,a1,s2
   10700:	6380                	c.ld	s0,0(a5)
   10702:	c801                	c.beqz	s0,10712 <_reclaim_reent+0x38>
   10704:	85a2                	c.mv	a1,s0
   10706:	6000                	c.ld	s0,0(s0)
   10708:	8526                	c.mv	a0,s1
   1070a:	3ce000ef          	jal	ra,10ad8 <_free_r>
   1070e:	f87d                	c.bnez	s0,10704 <_reclaim_reent+0x2a>
   10710:	74ac                	c.ld	a1,104(s1)
   10712:	0921                	c.addi	s2,8
   10714:	ff3914e3          	bne	s2,s3,106fc <_reclaim_reent+0x22>
   10718:	8526                	c.mv	a0,s1
   1071a:	3be000ef          	jal	ra,10ad8 <_free_r>
   1071e:	6942                	c.ldsp	s2,16(sp)
   10720:	69a2                	c.ldsp	s3,8(sp)
   10722:	68ac                	c.ld	a1,80(s1)
   10724:	c581                	c.beqz	a1,1072c <_reclaim_reent+0x52>
   10726:	8526                	c.mv	a0,s1
   10728:	3b0000ef          	jal	ra,10ad8 <_free_r>
   1072c:	70a0                	c.ld	s0,96(s1)
   1072e:	c419                	c.beqz	s0,1073c <_reclaim_reent+0x62>
   10730:	85a2                	c.mv	a1,s0
   10732:	6000                	c.ld	s0,0(s0)
   10734:	8526                	c.mv	a0,s1
   10736:	3a2000ef          	jal	ra,10ad8 <_free_r>
   1073a:	f87d                	c.bnez	s0,10730 <_reclaim_reent+0x56>
   1073c:	7cac                	c.ld	a1,120(s1)
   1073e:	c581                	c.beqz	a1,10746 <_reclaim_reent+0x6c>
   10740:	8526                	c.mv	a0,s1
   10742:	396000ef          	jal	ra,10ad8 <_free_r>
   10746:	64bc                	c.ld	a5,72(s1)
   10748:	c799                	c.beqz	a5,10756 <_reclaim_reent+0x7c>
   1074a:	7402                	c.ldsp	s0,32(sp)
   1074c:	70a2                	c.ldsp	ra,40(sp)
   1074e:	8526                	c.mv	a0,s1
   10750:	64e2                	c.ldsp	s1,24(sp)
   10752:	6145                	c.addi16sp	sp,48
   10754:	8782                	c.jr	a5
   10756:	70a2                	c.ldsp	ra,40(sp)
   10758:	7402                	c.ldsp	s0,32(sp)
   1075a:	64e2                	c.ldsp	s1,24(sp)
   1075c:	6145                	c.addi16sp	sp,48
   1075e:	8082                	c.jr	ra
   10760:	8082                	c.jr	ra

0000000000010762 <_lseek_r>:
   10762:	1101                	c.addi	sp,-32
   10764:	872e                	c.mv	a4,a1
   10766:	e822                	c.sdsp	s0,16(sp)
   10768:	e426                	c.sdsp	s1,8(sp)
   1076a:	85b2                	c.mv	a1,a2
   1076c:	842a                	c.mv	s0,a0
   1076e:	8636                	c.mv	a2,a3
   10770:	853a                	c.mv	a0,a4
   10772:	ec06                	c.sdsp	ra,24(sp)
   10774:	8201a423          	sw	zero,-2008(gp) # 129c0 <errno>
   10778:	7db000ef          	jal	ra,11752 <_lseek>
   1077c:	57fd                	c.li	a5,-1
   1077e:	00f50763          	beq	a0,a5,1078c <_lseek_r+0x2a>
   10782:	60e2                	c.ldsp	ra,24(sp)
   10784:	6442                	c.ldsp	s0,16(sp)
   10786:	64a2                	c.ldsp	s1,8(sp)
   10788:	6105                	c.addi16sp	sp,32
   1078a:	8082                	c.jr	ra
   1078c:	8281a783          	lw	a5,-2008(gp) # 129c0 <errno>
   10790:	dbed                	c.beqz	a5,10782 <_lseek_r+0x20>
   10792:	60e2                	c.ldsp	ra,24(sp)
   10794:	c01c                	c.sw	a5,0(s0)
   10796:	6442                	c.ldsp	s0,16(sp)
   10798:	64a2                	c.ldsp	s1,8(sp)
   1079a:	6105                	c.addi16sp	sp,32
   1079c:	8082                	c.jr	ra

000000000001079e <_read_r>:
   1079e:	1101                	c.addi	sp,-32
   107a0:	872e                	c.mv	a4,a1
   107a2:	e822                	c.sdsp	s0,16(sp)
   107a4:	e426                	c.sdsp	s1,8(sp)
   107a6:	85b2                	c.mv	a1,a2
   107a8:	842a                	c.mv	s0,a0
   107aa:	8636                	c.mv	a2,a3
   107ac:	853a                	c.mv	a0,a4
   107ae:	ec06                	c.sdsp	ra,24(sp)
   107b0:	8201a423          	sw	zero,-2008(gp) # 129c0 <errno>
   107b4:	7cb000ef          	jal	ra,1177e <_read>
   107b8:	57fd                	c.li	a5,-1
   107ba:	00f50763          	beq	a0,a5,107c8 <_read_r+0x2a>
   107be:	60e2                	c.ldsp	ra,24(sp)
   107c0:	6442                	c.ldsp	s0,16(sp)
   107c2:	64a2                	c.ldsp	s1,8(sp)
   107c4:	6105                	c.addi16sp	sp,32
   107c6:	8082                	c.jr	ra
   107c8:	8281a783          	lw	a5,-2008(gp) # 129c0 <errno>
   107cc:	dbed                	c.beqz	a5,107be <_read_r+0x20>
   107ce:	60e2                	c.ldsp	ra,24(sp)
   107d0:	c01c                	c.sw	a5,0(s0)
   107d2:	6442                	c.ldsp	s0,16(sp)
   107d4:	64a2                	c.ldsp	s1,8(sp)
   107d6:	6105                	c.addi16sp	sp,32
   107d8:	8082                	c.jr	ra

00000000000107da <_write_r>:
   107da:	1101                	c.addi	sp,-32
   107dc:	872e                	c.mv	a4,a1
   107de:	e822                	c.sdsp	s0,16(sp)
   107e0:	e426                	c.sdsp	s1,8(sp)
   107e2:	85b2                	c.mv	a1,a2
   107e4:	842a                	c.mv	s0,a0
   107e6:	8636                	c.mv	a2,a3
   107e8:	853a                	c.mv	a0,a4
   107ea:	ec06                	c.sdsp	ra,24(sp)
   107ec:	8201a423          	sw	zero,-2008(gp) # 129c0 <errno>
   107f0:	00e010ef          	jal	ra,117fe <_write>
   107f4:	57fd                	c.li	a5,-1
   107f6:	00f50763          	beq	a0,a5,10804 <_write_r+0x2a>
   107fa:	60e2                	c.ldsp	ra,24(sp)
   107fc:	6442                	c.ldsp	s0,16(sp)
   107fe:	64a2                	c.ldsp	s1,8(sp)
   10800:	6105                	c.addi16sp	sp,32
   10802:	8082                	c.jr	ra
   10804:	8281a783          	lw	a5,-2008(gp) # 129c0 <errno>
   10808:	dbed                	c.beqz	a5,107fa <_write_r+0x20>
   1080a:	60e2                	c.ldsp	ra,24(sp)
   1080c:	c01c                	c.sw	a5,0(s0)
   1080e:	6442                	c.ldsp	s0,16(sp)
   10810:	64a2                	c.ldsp	s1,8(sp)
   10812:	6105                	c.addi16sp	sp,32
   10814:	8082                	c.jr	ra

0000000000010816 <__libc_init_array>:
   10816:	1101                	c.addi	sp,-32
   10818:	e822                	c.sdsp	s0,16(sp)
   1081a:	67c9                	c.lui	a5,0x12
   1081c:	6449                	c.lui	s0,0x12
   1081e:	e04a                	c.sdsp	s2,0(sp)
   10820:	00078793          	addi	a5,a5,0 # 12000 <__init_array_start>
   10824:	00040713          	addi	a4,s0,0 # 12000 <__init_array_start>
   10828:	ec06                	c.sdsp	ra,24(sp)
   1082a:	e426                	c.sdsp	s1,8(sp)
   1082c:	40e78933          	sub	s2,a5,a4
   10830:	00e78d63          	beq	a5,a4,1084a <__libc_init_array+0x34>
   10834:	40395913          	srai	s2,s2,0x3
   10838:	00040413          	addi	s0,s0,0
   1083c:	4481                	c.li	s1,0
   1083e:	601c                	c.ld	a5,0(s0)
   10840:	0485                	c.addi	s1,1
   10842:	0421                	c.addi	s0,8
   10844:	9782                	c.jalr	a5
   10846:	ff24ece3          	bltu	s1,s2,1083e <__libc_init_array+0x28>
   1084a:	67c9                	c.lui	a5,0x12
   1084c:	6449                	c.lui	s0,0x12
   1084e:	01078793          	addi	a5,a5,16 # 12010 <__do_global_dtors_aux_fini_array_entry>
   10852:	00040713          	addi	a4,s0,0 # 12000 <__init_array_start>
   10856:	40e78933          	sub	s2,a5,a4
   1085a:	40395913          	srai	s2,s2,0x3
   1085e:	00e78b63          	beq	a5,a4,10874 <__libc_init_array+0x5e>
   10862:	00040413          	addi	s0,s0,0
   10866:	4481                	c.li	s1,0
   10868:	601c                	c.ld	a5,0(s0)
   1086a:	0485                	c.addi	s1,1
   1086c:	0421                	c.addi	s0,8
   1086e:	9782                	c.jalr	a5
   10870:	ff24ece3          	bltu	s1,s2,10868 <__libc_init_array+0x52>
   10874:	60e2                	c.ldsp	ra,24(sp)
   10876:	6442                	c.ldsp	s0,16(sp)
   10878:	64a2                	c.ldsp	s1,8(sp)
   1087a:	6902                	c.ldsp	s2,0(sp)
   1087c:	6105                	c.addi16sp	sp,32
   1087e:	8082                	c.jr	ra

0000000000010880 <memset>:
   10880:	433d                	c.li	t1,15
   10882:	872a                	c.mv	a4,a0
   10884:	02c37163          	bgeu	t1,a2,108a6 <memset+0x26>
   10888:	00f77793          	andi	a5,a4,15
   1088c:	e3c1                	c.bnez	a5,1090c <memset+0x8c>
   1088e:	e1bd                	c.bnez	a1,108f4 <memset+0x74>
   10890:	ff067693          	andi	a3,a2,-16
   10894:	8a3d                	c.andi	a2,15
   10896:	96ba                	c.add	a3,a4
   10898:	e30c                	c.sd	a1,0(a4)
   1089a:	e70c                	c.sd	a1,8(a4)
   1089c:	0741                	c.addi	a4,16
   1089e:	fed76de3          	bltu	a4,a3,10898 <memset+0x18>
   108a2:	e211                	c.bnez	a2,108a6 <memset+0x26>
   108a4:	8082                	c.jr	ra
   108a6:	40c306b3          	sub	a3,t1,a2
   108aa:	068a                	c.slli	a3,0x2
   108ac:	00000297          	auipc	t0,0x0
   108b0:	9696                	c.add	a3,t0
   108b2:	00a68067          	jalr	zero,10(a3)
   108b6:	00b70723          	sb	a1,14(a4)
   108ba:	00b706a3          	sb	a1,13(a4)
   108be:	00b70623          	sb	a1,12(a4)
   108c2:	00b705a3          	sb	a1,11(a4)
   108c6:	00b70523          	sb	a1,10(a4)
   108ca:	00b704a3          	sb	a1,9(a4)
   108ce:	00b70423          	sb	a1,8(a4)
   108d2:	00b703a3          	sb	a1,7(a4)
   108d6:	00b70323          	sb	a1,6(a4)
   108da:	00b702a3          	sb	a1,5(a4)
   108de:	00b70223          	sb	a1,4(a4)
   108e2:	00b701a3          	sb	a1,3(a4)
   108e6:	00b70123          	sb	a1,2(a4)
   108ea:	00b700a3          	sb	a1,1(a4)
   108ee:	00b70023          	sb	a1,0(a4)
   108f2:	8082                	c.jr	ra
   108f4:	0ff5f593          	andi	a1,a1,255
   108f8:	00859693          	slli	a3,a1,0x8
   108fc:	8dd5                	c.or	a1,a3
   108fe:	01059693          	slli	a3,a1,0x10
   10902:	8dd5                	c.or	a1,a3
   10904:	02059693          	slli	a3,a1,0x20
   10908:	8dd5                	c.or	a1,a3
   1090a:	b759                	c.j	10890 <memset+0x10>
   1090c:	00279693          	slli	a3,a5,0x2
   10910:	00000297          	auipc	t0,0x0
   10914:	9696                	c.add	a3,t0
   10916:	8286                	c.mv	t0,ra
   10918:	fa2680e7          	jalr	ra,-94(a3)
   1091c:	8096                	c.mv	ra,t0
   1091e:	17c1                	c.addi	a5,-16
   10920:	8f1d                	c.sub	a4,a5
   10922:	963e                	c.add	a2,a5
   10924:	f8c371e3          	bgeu	t1,a2,108a6 <memset+0x26>
   10928:	b79d                	c.j	1088e <memset+0xe>

000000000001092a <__call_exitprocs>:
   1092a:	715d                	c.addi16sp	sp,-80
   1092c:	f052                	c.sdsp	s4,32(sp)
   1092e:	f84a                	c.sdsp	s2,48(sp)
   10930:	8301b903          	ld	s2,-2000(gp) # 129c8 <__atexit>
   10934:	e486                	c.sdsp	ra,72(sp)
   10936:	04090663          	beq	s2,zero,10982 <__call_exitprocs+0x58>
   1093a:	f44e                	c.sdsp	s3,40(sp)
   1093c:	ec56                	c.sdsp	s5,24(sp)
   1093e:	e85a                	c.sdsp	s6,16(sp)
   10940:	e45e                	c.sdsp	s7,8(sp)
   10942:	e0a2                	c.sdsp	s0,64(sp)
   10944:	fc26                	c.sdsp	s1,56(sp)
   10946:	e062                	c.sdsp	s8,0(sp)
   10948:	8b2a                	c.mv	s6,a0
   1094a:	8bae                	c.mv	s7,a1
   1094c:	59fd                	c.li	s3,-1
   1094e:	4a85                	c.li	s5,1
   10950:	00892483          	lw	s1,8(s2)
   10954:	fff4841b          	addiw	s0,s1,-1
   10958:	00044e63          	blt	s0,zero,10974 <__call_exitprocs+0x4a>
   1095c:	048e                	c.slli	s1,0x3
   1095e:	94ca                	c.add	s1,s2
   10960:	020b8663          	beq	s7,zero,1098c <__call_exitprocs+0x62>
   10964:	2084b783          	ld	a5,520(s1)
   10968:	03778263          	beq	a5,s7,1098c <__call_exitprocs+0x62>
   1096c:	347d                	c.addiw	s0,-1
   1096e:	14e1                	c.addi	s1,-8
   10970:	ff341ae3          	bne	s0,s3,10964 <__call_exitprocs+0x3a>
   10974:	6406                	c.ldsp	s0,64(sp)
   10976:	74e2                	c.ldsp	s1,56(sp)
   10978:	79a2                	c.ldsp	s3,40(sp)
   1097a:	6ae2                	c.ldsp	s5,24(sp)
   1097c:	6b42                	c.ldsp	s6,16(sp)
   1097e:	6ba2                	c.ldsp	s7,8(sp)
   10980:	6c02                	c.ldsp	s8,0(sp)
   10982:	60a6                	c.ldsp	ra,72(sp)
   10984:	7942                	c.ldsp	s2,48(sp)
   10986:	7a02                	c.ldsp	s4,32(sp)
   10988:	6161                	c.addi16sp	sp,80
   1098a:	8082                	c.jr	ra
   1098c:	00892783          	lw	a5,8(s2)
   10990:	6494                	c.ld	a3,8(s1)
   10992:	37fd                	c.addiw	a5,-1
   10994:	04878c63          	beq	a5,s0,109ec <__call_exitprocs+0xc2>
   10998:	0004b423          	sd	zero,8(s1)
   1099c:	c295                	c.beqz	a3,109c0 <__call_exitprocs+0x96>
   1099e:	31092783          	lw	a5,784(s2)
   109a2:	008a973b          	sllw	a4,s5,s0
   109a6:	00892c03          	lw	s8,8(s2)
   109aa:	8ff9                	c.and	a5,a4
   109ac:	ef99                	c.bnez	a5,109ca <__call_exitprocs+0xa0>
   109ae:	9682                	c.jalr	a3
   109b0:	00892703          	lw	a4,8(s2)
   109b4:	8301b783          	ld	a5,-2000(gp) # 129c8 <__atexit>
   109b8:	03871763          	bne	a4,s8,109e6 <__call_exitprocs+0xbc>
   109bc:	03279563          	bne	a5,s2,109e6 <__call_exitprocs+0xbc>
   109c0:	347d                	c.addiw	s0,-1
   109c2:	14e1                	c.addi	s1,-8
   109c4:	f9341ee3          	bne	s0,s3,10960 <__call_exitprocs+0x36>
   109c8:	b775                	c.j	10974 <__call_exitprocs+0x4a>
   109ca:	31492783          	lw	a5,788(s2)
   109ce:	1084b583          	ld	a1,264(s1)
   109d2:	8f7d                	c.and	a4,a5
   109d4:	ef19                	c.bnez	a4,109f2 <__call_exitprocs+0xc8>
   109d6:	855a                	c.mv	a0,s6
   109d8:	9682                	c.jalr	a3
   109da:	00892703          	lw	a4,8(s2)
   109de:	8301b783          	ld	a5,-2000(gp) # 129c8 <__atexit>
   109e2:	fd870de3          	beq	a4,s8,109bc <__call_exitprocs+0x92>
   109e6:	d7d9                	c.beqz	a5,10974 <__call_exitprocs+0x4a>
   109e8:	893e                	c.mv	s2,a5
   109ea:	b79d                	c.j	10950 <__call_exitprocs+0x26>
   109ec:	00892423          	sw	s0,8(s2)
   109f0:	b775                	c.j	1099c <__call_exitprocs+0x72>
   109f2:	852e                	c.mv	a0,a1
   109f4:	9682                	c.jalr	a3
   109f6:	bf6d                	c.j	109b0 <__call_exitprocs+0x86>

00000000000109f8 <atexit>:
   109f8:	85aa                	c.mv	a1,a0
   109fa:	4681                	c.li	a3,0
   109fc:	4601                	c.li	a2,0
   109fe:	4501                	c.li	a0,0
   10a00:	48f0006f          	jal	zero,1168e <__register_exitproc>

0000000000010a04 <_malloc_trim_r>:
   10a04:	7179                	c.addi16sp	sp,-48
   10a06:	e44e                	c.sdsp	s3,8(sp)
   10a08:	69c9                	c.lui	s3,0x12
   10a0a:	f022                	c.sdsp	s0,32(sp)
   10a0c:	ec26                	c.sdsp	s1,24(sp)
   10a0e:	e84a                	c.sdsp	s2,16(sp)
   10a10:	e052                	c.sdsp	s4,0(sp)
   10a12:	f406                	c.sdsp	ra,40(sp)
   10a14:	8a2e                	c.mv	s4,a1
   10a16:	892a                	c.mv	s2,a0
   10a18:	18898993          	addi	s3,s3,392 # 12188 <__malloc_av_>
   10a1c:	133000ef          	jal	ra,1134e <__malloc_lock>
   10a20:	0109b783          	ld	a5,16(s3)
   10a24:	6405                	c.lui	s0,0x1
   10a26:	fdf40413          	addi	s0,s0,-33 # fdf <exit-0xf141>
   10a2a:	6784                	c.ld	s1,8(a5)
   10a2c:	6785                	c.lui	a5,0x1
   10a2e:	98f1                	c.andi	s1,-4
   10a30:	9426                	c.add	s0,s1
   10a32:	41440433          	sub	s0,s0,s4
   10a36:	8031                	c.srli	s0,0xc
   10a38:	147d                	c.addi	s0,-1
   10a3a:	0432                	c.slli	s0,0xc
   10a3c:	00f44b63          	blt	s0,a5,10a52 <_malloc_trim_r+0x4e>
   10a40:	4581                	c.li	a1,0
   10a42:	854a                	c.mv	a0,s2
   10a44:	3e1000ef          	jal	ra,11624 <_sbrk_r>
   10a48:	0109b783          	ld	a5,16(s3)
   10a4c:	97a6                	c.add	a5,s1
   10a4e:	00f50e63          	beq	a0,a5,10a6a <_malloc_trim_r+0x66>
   10a52:	854a                	c.mv	a0,s2
   10a54:	0fd000ef          	jal	ra,11350 <__malloc_unlock>
   10a58:	70a2                	c.ldsp	ra,40(sp)
   10a5a:	7402                	c.ldsp	s0,32(sp)
   10a5c:	64e2                	c.ldsp	s1,24(sp)
   10a5e:	6942                	c.ldsp	s2,16(sp)
   10a60:	69a2                	c.ldsp	s3,8(sp)
   10a62:	6a02                	c.ldsp	s4,0(sp)
   10a64:	4501                	c.li	a0,0
   10a66:	6145                	c.addi16sp	sp,48
   10a68:	8082                	c.jr	ra
   10a6a:	408005b3          	sub	a1,zero,s0
   10a6e:	854a                	c.mv	a0,s2
   10a70:	3b5000ef          	jal	ra,11624 <_sbrk_r>
   10a74:	57fd                	c.li	a5,-1
   10a76:	02f50b63          	beq	a0,a5,10aac <_malloc_trim_r+0xa8>
   10a7a:	0001f7b7          	lui	a5,0x1f
   10a7e:	c3878793          	addi	a5,a5,-968 # 1ec38 <__malloc_current_mallinfo>
   10a82:	0109b683          	ld	a3,16(s3)
   10a86:	4398                	c.lw	a4,0(a5)
   10a88:	8c81                	c.sub	s1,s0
   10a8a:	0014e493          	ori	s1,s1,1
   10a8e:	854a                	c.mv	a0,s2
   10a90:	9f01                	c.subw	a4,s0
   10a92:	e684                	c.sd	s1,8(a3)
   10a94:	c398                	c.sw	a4,0(a5)
   10a96:	0bb000ef          	jal	ra,11350 <__malloc_unlock>
   10a9a:	70a2                	c.ldsp	ra,40(sp)
   10a9c:	7402                	c.ldsp	s0,32(sp)
   10a9e:	64e2                	c.ldsp	s1,24(sp)
   10aa0:	6942                	c.ldsp	s2,16(sp)
   10aa2:	69a2                	c.ldsp	s3,8(sp)
   10aa4:	6a02                	c.ldsp	s4,0(sp)
   10aa6:	4505                	c.li	a0,1
   10aa8:	6145                	c.addi16sp	sp,48
   10aaa:	8082                	c.jr	ra
   10aac:	4581                	c.li	a1,0
   10aae:	854a                	c.mv	a0,s2
   10ab0:	375000ef          	jal	ra,11624 <_sbrk_r>
   10ab4:	0109b703          	ld	a4,16(s3)
   10ab8:	46fd                	c.li	a3,31
   10aba:	40e507b3          	sub	a5,a0,a4
   10abe:	f8f6dae3          	bge	a3,a5,10a52 <_malloc_trim_r+0x4e>
   10ac2:	8101b603          	ld	a2,-2032(gp) # 129a8 <__malloc_sbrk_base>
   10ac6:	0017e793          	ori	a5,a5,1
   10aca:	0001f6b7          	lui	a3,0x1f
   10ace:	8d11                	c.sub	a0,a2
   10ad0:	e71c                	c.sd	a5,8(a4)
   10ad2:	c2a6ac23          	sw	a0,-968(a3) # 1ec38 <__malloc_current_mallinfo>
   10ad6:	bfb5                	c.j	10a52 <_malloc_trim_r+0x4e>

0000000000010ad8 <_free_r>:
   10ad8:	c5f5                	c.beqz	a1,10bc4 <_free_r+0xec>
   10ada:	1101                	c.addi	sp,-32
   10adc:	e822                	c.sdsp	s0,16(sp)
   10ade:	e426                	c.sdsp	s1,8(sp)
   10ae0:	842e                	c.mv	s0,a1
   10ae2:	84aa                	c.mv	s1,a0
   10ae4:	ec06                	c.sdsp	ra,24(sp)
   10ae6:	069000ef          	jal	ra,1134e <__malloc_lock>
   10aea:	ff843503          	ld	a0,-8(s0)
   10aee:	ff040713          	addi	a4,s0,-16
   10af2:	65c9                	c.lui	a1,0x12
   10af4:	ffe57793          	andi	a5,a0,-2
   10af8:	00f70633          	add	a2,a4,a5
   10afc:	18858593          	addi	a1,a1,392 # 12188 <__malloc_av_>
   10b00:	6614                	c.ld	a3,8(a2)
   10b02:	0105b803          	ld	a6,16(a1)
   10b06:	00157893          	andi	a7,a0,1
   10b0a:	9af1                	c.andi	a3,-4
   10b0c:	12c80963          	beq	a6,a2,10c3e <_free_r+0x166>
   10b10:	e614                	c.sd	a3,8(a2)
   10b12:	00d60833          	add	a6,a2,a3
   10b16:	00883803          	ld	a6,8(a6)
   10b1a:	00187813          	andi	a6,a6,1
   10b1e:	06089e63          	bne	a7,zero,10b9a <_free_r+0xc2>
   10b22:	ff043303          	ld	t1,-16(s0)
   10b26:	6549                	c.lui	a0,0x12
   10b28:	19850513          	addi	a0,a0,408 # 12198 <__malloc_av_+0x10>
   10b2c:	40670733          	sub	a4,a4,t1
   10b30:	01073883          	ld	a7,16(a4)
   10b34:	979a                	c.add	a5,t1
   10b36:	0ea88763          	beq	a7,a0,10c24 <_free_r+0x14c>
   10b3a:	01873303          	ld	t1,24(a4)
   10b3e:	0068bc23          	sd	t1,24(a7)
   10b42:	01133823          	sd	a7,16(t1) # 101de <main+0x6>
   10b46:	12080563          	beq	a6,zero,10c70 <_free_r+0x198>
   10b4a:	0017e693          	ori	a3,a5,1
   10b4e:	e714                	c.sd	a3,8(a4)
   10b50:	e21c                	c.sd	a5,0(a2)
   10b52:	1ff00693          	addi	a3,zero,511
   10b56:	08f6e163          	bltu	a3,a5,10bd8 <_free_r+0x100>
   10b5a:	838d                	c.srli	a5,0x3
   10b5c:	2781                	c.addiw	a5,0
   10b5e:	0017869b          	addiw	a3,a5,1
   10b62:	0016969b          	slliw	a3,a3,0x1
   10b66:	068e                	c.slli	a3,0x3
   10b68:	0085b803          	ld	a6,8(a1)
   10b6c:	96ae                	c.add	a3,a1
   10b6e:	6288                	c.ld	a0,0(a3)
   10b70:	4605                	c.li	a2,1
   10b72:	4027d79b          	sraiw	a5,a5,0x2
   10b76:	00f617b3          	sll	a5,a2,a5
   10b7a:	0107e7b3          	or	a5,a5,a6
   10b7e:	ff068613          	addi	a2,a3,-16
   10b82:	eb08                	c.sd	a0,16(a4)
   10b84:	ef10                	c.sd	a2,24(a4)
   10b86:	e59c                	c.sd	a5,8(a1)
   10b88:	e298                	c.sd	a4,0(a3)
   10b8a:	ed18                	c.sd	a4,24(a0)
   10b8c:	6442                	c.ldsp	s0,16(sp)
   10b8e:	60e2                	c.ldsp	ra,24(sp)
   10b90:	8526                	c.mv	a0,s1
   10b92:	64a2                	c.ldsp	s1,8(sp)
   10b94:	6105                	c.addi16sp	sp,32
   10b96:	7ba0006f          	jal	zero,11350 <__malloc_unlock>
   10b9a:	02081663          	bne	a6,zero,10bc6 <_free_r+0xee>
   10b9e:	6549                	c.lui	a0,0x12
   10ba0:	97b6                	c.add	a5,a3
   10ba2:	19850513          	addi	a0,a0,408 # 12198 <__malloc_av_+0x10>
   10ba6:	6a14                	c.ld	a3,16(a2)
   10ba8:	0017e893          	ori	a7,a5,1
   10bac:	00f70833          	add	a6,a4,a5
   10bb0:	10a68063          	beq	a3,a0,10cb0 <_free_r+0x1d8>
   10bb4:	6e10                	c.ld	a2,24(a2)
   10bb6:	ee90                	c.sd	a2,24(a3)
   10bb8:	ea14                	c.sd	a3,16(a2)
   10bba:	01173423          	sd	a7,8(a4)
   10bbe:	00f83023          	sd	a5,0(a6)
   10bc2:	bf41                	c.j	10b52 <_free_r+0x7a>
   10bc4:	8082                	c.jr	ra
   10bc6:	00156513          	ori	a0,a0,1
   10bca:	fea43c23          	sd	a0,-8(s0)
   10bce:	e21c                	c.sd	a5,0(a2)
   10bd0:	1ff00693          	addi	a3,zero,511
   10bd4:	f8f6f3e3          	bgeu	a3,a5,10b5a <_free_r+0x82>
   10bd8:	0097d693          	srli	a3,a5,0x9
   10bdc:	4611                	c.li	a2,4
   10bde:	08d66b63          	bltu	a2,a3,10c74 <_free_r+0x19c>
   10be2:	0067d693          	srli	a3,a5,0x6
   10be6:	0396851b          	addiw	a0,a3,57
   10bea:	0015151b          	slliw	a0,a0,0x1
   10bee:	050e                	c.slli	a0,0x3
   10bf0:	0386861b          	addiw	a2,a3,56
   10bf4:	952e                	c.add	a0,a1
   10bf6:	6114                	c.ld	a3,0(a0)
   10bf8:	1541                	c.addi	a0,-16
   10bfa:	00d51663          	bne	a0,a3,10c06 <_free_r+0x12e>
   10bfe:	a0d1                	c.j	10cc2 <_free_r+0x1ea>
   10c00:	6a94                	c.ld	a3,16(a3)
   10c02:	00d50663          	beq	a0,a3,10c0e <_free_r+0x136>
   10c06:	6690                	c.ld	a2,8(a3)
   10c08:	9a71                	c.andi	a2,-4
   10c0a:	fec7ebe3          	bltu	a5,a2,10c00 <_free_r+0x128>
   10c0e:	6e88                	c.ld	a0,24(a3)
   10c10:	ef08                	c.sd	a0,24(a4)
   10c12:	eb14                	c.sd	a3,16(a4)
   10c14:	6442                	c.ldsp	s0,16(sp)
   10c16:	e918                	c.sd	a4,16(a0)
   10c18:	60e2                	c.ldsp	ra,24(sp)
   10c1a:	8526                	c.mv	a0,s1
   10c1c:	64a2                	c.ldsp	s1,8(sp)
   10c1e:	ee98                	c.sd	a4,24(a3)
   10c20:	6105                	c.addi16sp	sp,32
   10c22:	a73d                	c.j	11350 <__malloc_unlock>
   10c24:	06081963          	bne	a6,zero,10c96 <_free_r+0x1be>
   10c28:	6e0c                	c.ld	a1,24(a2)
   10c2a:	6a10                	c.ld	a2,16(a2)
   10c2c:	96be                	c.add	a3,a5
   10c2e:	0016e793          	ori	a5,a3,1
   10c32:	ee0c                	c.sd	a1,24(a2)
   10c34:	e990                	c.sd	a2,16(a1)
   10c36:	e71c                	c.sd	a5,8(a4)
   10c38:	9736                	c.add	a4,a3
   10c3a:	e314                	c.sd	a3,0(a4)
   10c3c:	bf81                	c.j	10b8c <_free_r+0xb4>
   10c3e:	96be                	c.add	a3,a5
   10c40:	00089a63          	bne	a7,zero,10c54 <_free_r+0x17c>
   10c44:	ff043503          	ld	a0,-16(s0)
   10c48:	8f09                	c.sub	a4,a0
   10c4a:	6f1c                	c.ld	a5,24(a4)
   10c4c:	6b10                	c.ld	a2,16(a4)
   10c4e:	96aa                	c.add	a3,a0
   10c50:	ee1c                	c.sd	a5,24(a2)
   10c52:	eb90                	c.sd	a2,16(a5)
   10c54:	0016e613          	ori	a2,a3,1
   10c58:	8181b783          	ld	a5,-2024(gp) # 129b0 <__malloc_trim_threshold>
   10c5c:	e710                	c.sd	a2,8(a4)
   10c5e:	e998                	c.sd	a4,16(a1)
   10c60:	f2f6e6e3          	bltu	a3,a5,10b8c <_free_r+0xb4>
   10c64:	8481b583          	ld	a1,-1976(gp) # 129e0 <__malloc_top_pad>
   10c68:	8526                	c.mv	a0,s1
   10c6a:	d9bff0ef          	jal	ra,10a04 <_malloc_trim_r>
   10c6e:	bf39                	c.j	10b8c <_free_r+0xb4>
   10c70:	97b6                	c.add	a5,a3
   10c72:	bf15                	c.j	10ba6 <_free_r+0xce>
   10c74:	4651                	c.li	a2,20
   10c76:	02d67563          	bgeu	a2,a3,10ca0 <_free_r+0x1c8>
   10c7a:	05400613          	addi	a2,zero,84
   10c7e:	04d66d63          	bltu	a2,a3,10cd8 <_free_r+0x200>
   10c82:	00c7d693          	srli	a3,a5,0xc
   10c86:	06f6851b          	addiw	a0,a3,111
   10c8a:	0015151b          	slliw	a0,a0,0x1
   10c8e:	050e                	c.slli	a0,0x3
   10c90:	06e6861b          	addiw	a2,a3,110
   10c94:	b785                	c.j	10bf4 <_free_r+0x11c>
   10c96:	0017e693          	ori	a3,a5,1
   10c9a:	e714                	c.sd	a3,8(a4)
   10c9c:	e21c                	c.sd	a5,0(a2)
   10c9e:	b5fd                	c.j	10b8c <_free_r+0xb4>
   10ca0:	05c6851b          	addiw	a0,a3,92
   10ca4:	0015151b          	slliw	a0,a0,0x1
   10ca8:	050e                	c.slli	a0,0x3
   10caa:	05b6861b          	addiw	a2,a3,91
   10cae:	b799                	c.j	10bf4 <_free_r+0x11c>
   10cb0:	f598                	c.sd	a4,40(a1)
   10cb2:	f198                	c.sd	a4,32(a1)
   10cb4:	ef08                	c.sd	a0,24(a4)
   10cb6:	eb08                	c.sd	a0,16(a4)
   10cb8:	01173423          	sd	a7,8(a4)
   10cbc:	00f83023          	sd	a5,0(a6)
   10cc0:	b5f1                	c.j	10b8c <_free_r+0xb4>
   10cc2:	0085b803          	ld	a6,8(a1)
   10cc6:	4026561b          	sraiw	a2,a2,0x2
   10cca:	4785                	c.li	a5,1
   10ccc:	00c797b3          	sll	a5,a5,a2
   10cd0:	0107e7b3          	or	a5,a5,a6
   10cd4:	e59c                	c.sd	a5,8(a1)
   10cd6:	bf2d                	c.j	10c10 <_free_r+0x138>
   10cd8:	15400613          	addi	a2,zero,340
   10cdc:	00d66c63          	bltu	a2,a3,10cf4 <_free_r+0x21c>
   10ce0:	00f7d693          	srli	a3,a5,0xf
   10ce4:	0786851b          	addiw	a0,a3,120
   10ce8:	0015151b          	slliw	a0,a0,0x1
   10cec:	050e                	c.slli	a0,0x3
   10cee:	0776861b          	addiw	a2,a3,119
   10cf2:	b709                	c.j	10bf4 <_free_r+0x11c>
   10cf4:	55400613          	addi	a2,zero,1364
   10cf8:	00d66c63          	bltu	a2,a3,10d10 <_free_r+0x238>
   10cfc:	0127d693          	srli	a3,a5,0x12
   10d00:	07d6851b          	addiw	a0,a3,125
   10d04:	0015151b          	slliw	a0,a0,0x1
   10d08:	050e                	c.slli	a0,0x3
   10d0a:	07c6861b          	addiw	a2,a3,124
   10d0e:	b5dd                	c.j	10bf4 <_free_r+0x11c>
   10d10:	7f000513          	addi	a0,zero,2032
   10d14:	07e00613          	addi	a2,zero,126
   10d18:	bdf1                	c.j	10bf4 <_free_r+0x11c>

0000000000010d1a <_malloc_r>:
   10d1a:	711d                	c.addi16sp	sp,-96
   10d1c:	e4a6                	c.sdsp	s1,72(sp)
   10d1e:	e0ca                	c.sdsp	s2,64(sp)
   10d20:	ec86                	c.sdsp	ra,88(sp)
   10d22:	e8a2                	c.sdsp	s0,80(sp)
   10d24:	fc4e                	c.sdsp	s3,56(sp)
   10d26:	01758493          	addi	s1,a1,23
   10d2a:	02e00793          	addi	a5,zero,46
   10d2e:	892a                	c.mv	s2,a0
   10d30:	0497eb63          	bltu	a5,s1,10d86 <_malloc_r+0x6c>
   10d34:	02000493          	addi	s1,zero,32
   10d38:	18b4e863          	bltu	s1,a1,10ec8 <_malloc_r+0x1ae>
   10d3c:	612000ef          	jal	ra,1134e <__malloc_lock>
   10d40:	05000793          	addi	a5,zero,80
   10d44:	4591                	c.li	a1,4
   10d46:	69c9                	c.lui	s3,0x12
   10d48:	18898993          	addi	s3,s3,392 # 12188 <__malloc_av_>
   10d4c:	97ce                	c.add	a5,s3
   10d4e:	6780                	c.ld	s0,8(a5)
   10d50:	ff078713          	addi	a4,a5,-16
   10d54:	32e40b63          	beq	s0,a4,1108a <_malloc_r+0x370>
   10d58:	641c                	c.ld	a5,8(s0)
   10d5a:	6c14                	c.ld	a3,24(s0)
   10d5c:	6810                	c.ld	a2,16(s0)
   10d5e:	9bf1                	c.andi	a5,-4
   10d60:	97a2                	c.add	a5,s0
   10d62:	6798                	c.ld	a4,8(a5)
   10d64:	ee14                	c.sd	a3,24(a2)
   10d66:	ea90                	c.sd	a2,16(a3)
   10d68:	00176713          	ori	a4,a4,1
   10d6c:	854a                	c.mv	a0,s2
   10d6e:	e798                	c.sd	a4,8(a5)
   10d70:	5e0000ef          	jal	ra,11350 <__malloc_unlock>
   10d74:	60e6                	c.ldsp	ra,88(sp)
   10d76:	01040513          	addi	a0,s0,16
   10d7a:	6446                	c.ldsp	s0,80(sp)
   10d7c:	64a6                	c.ldsp	s1,72(sp)
   10d7e:	6906                	c.ldsp	s2,64(sp)
   10d80:	79e2                	c.ldsp	s3,56(sp)
   10d82:	6125                	c.addi16sp	sp,96
   10d84:	8082                	c.jr	ra
   10d86:	800007b7          	lui	a5,0x80000
   10d8a:	98c1                	c.andi	s1,-16
   10d8c:	fff7c793          	xori	a5,a5,-1
   10d90:	1297ec63          	bltu	a5,s1,10ec8 <_malloc_r+0x1ae>
   10d94:	12b4ea63          	bltu	s1,a1,10ec8 <_malloc_r+0x1ae>
   10d98:	5b6000ef          	jal	ra,1134e <__malloc_lock>
   10d9c:	1f700793          	addi	a5,zero,503
   10da0:	3e97f063          	bgeu	a5,s1,11180 <_malloc_r+0x466>
   10da4:	0094d793          	srli	a5,s1,0x9
   10da8:	12078b63          	beq	a5,zero,10ede <_malloc_r+0x1c4>
   10dac:	4711                	c.li	a4,4
   10dae:	32f76563          	bltu	a4,a5,110d8 <_malloc_r+0x3be>
   10db2:	0064d793          	srli	a5,s1,0x6
   10db6:	0397859b          	addiw	a1,a5,57 # ffffffff80000039 <__BSS_END__+0xffffffff7ffe10c1>
   10dba:	0015961b          	slliw	a2,a1,0x1
   10dbe:	0387881b          	addiw	a6,a5,56
   10dc2:	060e                	c.slli	a2,0x3
   10dc4:	69c9                	c.lui	s3,0x12
   10dc6:	18898993          	addi	s3,s3,392 # 12188 <__malloc_av_>
   10dca:	964e                	c.add	a2,s3
   10dcc:	6600                	c.ld	s0,8(a2)
   10dce:	1641                	c.addi	a2,-16
   10dd0:	02860163          	beq	a2,s0,10df2 <_malloc_r+0xd8>
   10dd4:	457d                	c.li	a0,31
   10dd6:	a039                	c.j	10de4 <_malloc_r+0xca>
   10dd8:	6c14                	c.ld	a3,24(s0)
   10dda:	28075463          	bge	a4,zero,11062 <_malloc_r+0x348>
   10dde:	00d60a63          	beq	a2,a3,10df2 <_malloc_r+0xd8>
   10de2:	8436                	c.mv	s0,a3
   10de4:	641c                	c.ld	a5,8(s0)
   10de6:	9bf1                	c.andi	a5,-4
   10de8:	40978733          	sub	a4,a5,s1
   10dec:	fee556e3          	bge	a0,a4,10dd8 <_malloc_r+0xbe>
   10df0:	85c2                	c.mv	a1,a6
   10df2:	0209b403          	ld	s0,32(s3)
   10df6:	6849                	c.lui	a6,0x12
   10df8:	19880813          	addi	a6,a6,408 # 12198 <__malloc_av_+0x10>
   10dfc:	27040063          	beq	s0,a6,1105c <_malloc_r+0x342>
   10e00:	641c                	c.ld	a5,8(s0)
   10e02:	46fd                	c.li	a3,31
   10e04:	9bf1                	c.andi	a5,-4
   10e06:	40978733          	sub	a4,a5,s1
   10e0a:	34e6c463          	blt	a3,a4,11152 <_malloc_r+0x438>
   10e0e:	0309b423          	sd	a6,40(s3)
   10e12:	0309b023          	sd	a6,32(s3)
   10e16:	32075363          	bge	a4,zero,1113c <_malloc_r+0x422>
   10e1a:	1ff00713          	addi	a4,zero,511
   10e1e:	0089b503          	ld	a0,8(s3)
   10e22:	26f76963          	bltu	a4,a5,11094 <_malloc_r+0x37a>
   10e26:	838d                	c.srli	a5,0x3
   10e28:	2781                	c.addiw	a5,0
   10e2a:	0017871b          	addiw	a4,a5,1
   10e2e:	0017171b          	slliw	a4,a4,0x1
   10e32:	070e                	c.slli	a4,0x3
   10e34:	974e                	c.add	a4,s3
   10e36:	6310                	c.ld	a2,0(a4)
   10e38:	4027d79b          	sraiw	a5,a5,0x2
   10e3c:	4685                	c.li	a3,1
   10e3e:	00f697b3          	sll	a5,a3,a5
   10e42:	8d5d                	c.or	a0,a5
   10e44:	ff070793          	addi	a5,a4,-16
   10e48:	e810                	c.sd	a2,16(s0)
   10e4a:	ec1c                	c.sd	a5,24(s0)
   10e4c:	00a9b423          	sd	a0,8(s3)
   10e50:	e300                	c.sd	s0,0(a4)
   10e52:	ee00                	c.sd	s0,24(a2)
   10e54:	4025d79b          	sraiw	a5,a1,0x2
   10e58:	4605                	c.li	a2,1
   10e5a:	00f61633          	sll	a2,a2,a5
   10e5e:	08c56763          	bltu	a0,a2,10eec <_malloc_r+0x1d2>
   10e62:	00a677b3          	and	a5,a2,a0
   10e66:	ef81                	c.bnez	a5,10e7e <_malloc_r+0x164>
   10e68:	0606                	c.slli	a2,0x1
   10e6a:	99f1                	c.andi	a1,-4
   10e6c:	00a677b3          	and	a5,a2,a0
   10e70:	2591                	c.addiw	a1,4
   10e72:	e791                	c.bnez	a5,10e7e <_malloc_r+0x164>
   10e74:	0606                	c.slli	a2,0x1
   10e76:	00a677b3          	and	a5,a2,a0
   10e7a:	2591                	c.addiw	a1,4
   10e7c:	dfe5                	c.beqz	a5,10e74 <_malloc_r+0x15a>
   10e7e:	48fd                	c.li	a7,31
   10e80:	0015831b          	addiw	t1,a1,1
   10e84:	0013131b          	slliw	t1,t1,0x1
   10e88:	030e                	c.slli	t1,0x3
   10e8a:	1341                	c.addi	t1,-16
   10e8c:	934e                	c.add	t1,s3
   10e8e:	851a                	c.mv	a0,t1
   10e90:	6d1c                	c.ld	a5,24(a0)
   10e92:	8e2e                	c.mv	t3,a1
   10e94:	26f50363          	beq	a0,a5,110fa <_malloc_r+0x3e0>
   10e98:	6798                	c.ld	a4,8(a5)
   10e9a:	843e                	c.mv	s0,a5
   10e9c:	6f9c                	c.ld	a5,24(a5)
   10e9e:	9b71                	c.andi	a4,-4
   10ea0:	409706b3          	sub	a3,a4,s1
   10ea4:	26d8c263          	blt	a7,a3,11108 <_malloc_r+0x3ee>
   10ea8:	fe06c6e3          	blt	a3,zero,10e94 <_malloc_r+0x17a>
   10eac:	9722                	c.add	a4,s0
   10eae:	6714                	c.ld	a3,8(a4)
   10eb0:	6810                	c.ld	a2,16(s0)
   10eb2:	854a                	c.mv	a0,s2
   10eb4:	0016e693          	ori	a3,a3,1
   10eb8:	e714                	c.sd	a3,8(a4)
   10eba:	ee1c                	c.sd	a5,24(a2)
   10ebc:	eb90                	c.sd	a2,16(a5)
   10ebe:	492000ef          	jal	ra,11350 <__malloc_unlock>
   10ec2:	01040513          	addi	a0,s0,16
   10ec6:	a029                	c.j	10ed0 <_malloc_r+0x1b6>
   10ec8:	47b1                	c.li	a5,12
   10eca:	00f92023          	sw	a5,0(s2)
   10ece:	4501                	c.li	a0,0
   10ed0:	60e6                	c.ldsp	ra,88(sp)
   10ed2:	6446                	c.ldsp	s0,80(sp)
   10ed4:	64a6                	c.ldsp	s1,72(sp)
   10ed6:	6906                	c.ldsp	s2,64(sp)
   10ed8:	79e2                	c.ldsp	s3,56(sp)
   10eda:	6125                	c.addi16sp	sp,96
   10edc:	8082                	c.jr	ra
   10ede:	40000613          	addi	a2,zero,1024
   10ee2:	04000593          	addi	a1,zero,64
   10ee6:	03f00813          	addi	a6,zero,63
   10eea:	bde9                	c.j	10dc4 <_malloc_r+0xaa>
   10eec:	0109b403          	ld	s0,16(s3)
   10ef0:	f456                	c.sdsp	s5,40(sp)
   10ef2:	641c                	c.ld	a5,8(s0)
   10ef4:	ffc7fa93          	andi	s5,a5,-4
   10ef8:	009ae763          	bltu	s5,s1,10f06 <_malloc_r+0x1ec>
   10efc:	409a8733          	sub	a4,s5,s1
   10f00:	47fd                	c.li	a5,31
   10f02:	12e7c763          	blt	a5,a4,11030 <_malloc_r+0x316>
   10f06:	e466                	c.sdsp	s9,8(sp)
   10f08:	f852                	c.sdsp	s4,48(sp)
   10f0a:	8101b703          	ld	a4,-2032(gp) # 129a8 <__malloc_sbrk_base>
   10f0e:	8481ba03          	ld	s4,-1976(gp) # 129e0 <__malloc_top_pad>
   10f12:	ec5e                	c.sdsp	s7,24(sp)
   10f14:	f05a                	c.sdsp	s6,32(sp)
   10f16:	57fd                	c.li	a5,-1
   10f18:	9a26                	c.add	s4,s1
   10f1a:	01540bb3          	add	s7,s0,s5
   10f1e:	2ef70563          	beq	a4,a5,11208 <_malloc_r+0x4ee>
   10f22:	6785                	c.lui	a5,0x1
   10f24:	07fd                	c.addi	a5,31 # 101f <exit-0xf101>
   10f26:	9a3e                	c.add	s4,a5
   10f28:	77fd                	c.lui	a5,0xfffff
   10f2a:	00fa7a33          	and	s4,s4,a5
   10f2e:	85d2                	c.mv	a1,s4
   10f30:	854a                	c.mv	a0,s2
   10f32:	6f2000ef          	jal	ra,11624 <_sbrk_r>
   10f36:	57fd                	c.li	a5,-1
   10f38:	8b2a                	c.mv	s6,a0
   10f3a:	36f50763          	beq	a0,a5,112a8 <_malloc_r+0x58e>
   10f3e:	e862                	c.sdsp	s8,16(sp)
   10f40:	0d756663          	bltu	a0,s7,1100c <_malloc_r+0x2f2>
   10f44:	0001fc37          	lui	s8,0x1f
   10f48:	c38c0c13          	addi	s8,s8,-968 # 1ec38 <__malloc_current_mallinfo>
   10f4c:	000c2703          	lw	a4,0(s8)
   10f50:	0147073b          	addw	a4,a4,s4
   10f54:	00ec2023          	sw	a4,0(s8)
   10f58:	86ba                	c.mv	a3,a4
   10f5a:	34ab8b63          	beq	s7,a0,112b0 <_malloc_r+0x596>
   10f5e:	8101b703          	ld	a4,-2032(gp) # 129a8 <__malloc_sbrk_base>
   10f62:	57fd                	c.li	a5,-1
   10f64:	36f70363          	beq	a4,a5,112ca <_malloc_r+0x5b0>
   10f68:	417b07b3          	sub	a5,s6,s7
   10f6c:	9fb5                	c.addw	a5,a3
   10f6e:	00fc2023          	sw	a5,0(s8)
   10f72:	00fb7c93          	andi	s9,s6,15
   10f76:	2a0c8563          	beq	s9,zero,11220 <_malloc_r+0x506>
   10f7a:	419b0b33          	sub	s6,s6,s9
   10f7e:	6685                	c.lui	a3,0x1
   10f80:	0b41                	c.addi	s6,16
   10f82:	06c1                	c.addi	a3,16 # 1010 <exit-0xf110>
   10f84:	9a5a                	c.add	s4,s6
   10f86:	419686b3          	sub	a3,a3,s9
   10f8a:	414686b3          	sub	a3,a3,s4
   10f8e:	16d2                	c.slli	a3,0x34
   10f90:	0346db93          	srli	s7,a3,0x34
   10f94:	85de                	c.mv	a1,s7
   10f96:	854a                	c.mv	a0,s2
   10f98:	68c000ef          	jal	ra,11624 <_sbrk_r>
   10f9c:	57fd                	c.li	a5,-1
   10f9e:	36f50563          	beq	a0,a5,11308 <_malloc_r+0x5ee>
   10fa2:	41650533          	sub	a0,a0,s6
   10fa6:	01750a33          	add	s4,a0,s7
   10faa:	000b869b          	addiw	a3,s7,0
   10fae:	000c2703          	lw	a4,0(s8)
   10fb2:	0169b823          	sd	s6,16(s3)
   10fb6:	001a6793          	ori	a5,s4,1
   10fba:	9f35                	c.addw	a4,a3
   10fbc:	00fb3423          	sd	a5,8(s6)
   10fc0:	00ec2023          	sw	a4,0(s8)
   10fc4:	03340563          	beq	s0,s3,10fee <_malloc_r+0x2d4>
   10fc8:	467d                	c.li	a2,31
   10fca:	27567b63          	bgeu	a2,s5,11240 <_malloc_r+0x526>
   10fce:	6414                	c.ld	a3,8(s0)
   10fd0:	fe8a8793          	addi	a5,s5,-24
   10fd4:	9bc1                	c.andi	a5,-16
   10fd6:	8a85                	c.andi	a3,1
   10fd8:	8edd                	c.or	a3,a5
   10fda:	e414                	c.sd	a3,8(s0)
   10fdc:	45a5                	c.li	a1,9
   10fde:	00f406b3          	add	a3,s0,a5
   10fe2:	e68c                	c.sd	a1,8(a3)
   10fe4:	ea8c                	c.sd	a1,16(a3)
   10fe6:	20f66763          	bltu	a2,a5,111f4 <_malloc_r+0x4da>
   10fea:	008b3783          	ld	a5,8(s6)
   10fee:	8401b603          	ld	a2,-1984(gp) # 129d8 <__malloc_max_sbrked_mem>
   10ff2:	00e67463          	bgeu	a2,a4,10ffa <_malloc_r+0x2e0>
   10ff6:	84e1b023          	sd	a4,-1984(gp) # 129d8 <__malloc_max_sbrked_mem>
   10ffa:	8381b603          	ld	a2,-1992(gp) # 129d0 <__malloc_max_total_mem>
   10ffe:	00e67463          	bgeu	a2,a4,11006 <_malloc_r+0x2ec>
   11002:	82e1bc23          	sd	a4,-1992(gp) # 129d0 <__malloc_max_total_mem>
   11006:	6c42                	c.ldsp	s8,16(sp)
   11008:	845a                	c.mv	s0,s6
   1100a:	a039                	c.j	11018 <_malloc_r+0x2fe>
   1100c:	29340363          	beq	s0,s3,11292 <_malloc_r+0x578>
   11010:	0109b403          	ld	s0,16(s3)
   11014:	6c42                	c.ldsp	s8,16(sp)
   11016:	641c                	c.ld	a5,8(s0)
   11018:	9bf1                	c.andi	a5,-4
   1101a:	40978733          	sub	a4,a5,s1
   1101e:	2297e563          	bltu	a5,s1,11248 <_malloc_r+0x52e>
   11022:	47fd                	c.li	a5,31
   11024:	22e7d263          	bge	a5,a4,11248 <_malloc_r+0x52e>
   11028:	7a42                	c.ldsp	s4,48(sp)
   1102a:	7b02                	c.ldsp	s6,32(sp)
   1102c:	6be2                	c.ldsp	s7,24(sp)
   1102e:	6ca2                	c.ldsp	s9,8(sp)
   11030:	0014e793          	ori	a5,s1,1
   11034:	e41c                	c.sd	a5,8(s0)
   11036:	94a2                	c.add	s1,s0
   11038:	0099b823          	sd	s1,16(s3)
   1103c:	00176713          	ori	a4,a4,1
   11040:	854a                	c.mv	a0,s2
   11042:	e498                	c.sd	a4,8(s1)
   11044:	30c000ef          	jal	ra,11350 <__malloc_unlock>
   11048:	60e6                	c.ldsp	ra,88(sp)
   1104a:	01040513          	addi	a0,s0,16
   1104e:	6446                	c.ldsp	s0,80(sp)
   11050:	7aa2                	c.ldsp	s5,40(sp)
   11052:	64a6                	c.ldsp	s1,72(sp)
   11054:	6906                	c.ldsp	s2,64(sp)
   11056:	79e2                	c.ldsp	s3,56(sp)
   11058:	6125                	c.addi16sp	sp,96
   1105a:	8082                	c.jr	ra
   1105c:	0089b503          	ld	a0,8(s3)
   11060:	bbd5                	c.j	10e54 <_malloc_r+0x13a>
   11062:	6810                	c.ld	a2,16(s0)
   11064:	97a2                	c.add	a5,s0
   11066:	6798                	c.ld	a4,8(a5)
   11068:	ee14                	c.sd	a3,24(a2)
   1106a:	ea90                	c.sd	a2,16(a3)
   1106c:	00176713          	ori	a4,a4,1
   11070:	854a                	c.mv	a0,s2
   11072:	e798                	c.sd	a4,8(a5)
   11074:	2dc000ef          	jal	ra,11350 <__malloc_unlock>
   11078:	60e6                	c.ldsp	ra,88(sp)
   1107a:	01040513          	addi	a0,s0,16
   1107e:	6446                	c.ldsp	s0,80(sp)
   11080:	64a6                	c.ldsp	s1,72(sp)
   11082:	6906                	c.ldsp	s2,64(sp)
   11084:	79e2                	c.ldsp	s3,56(sp)
   11086:	6125                	c.addi16sp	sp,96
   11088:	8082                	c.jr	ra
   1108a:	6f80                	c.ld	s0,24(a5)
   1108c:	2589                	c.addiw	a1,2
   1108e:	d68782e3          	beq	a5,s0,10df2 <_malloc_r+0xd8>
   11092:	b1d9                	c.j	10d58 <_malloc_r+0x3e>
   11094:	0097d713          	srli	a4,a5,0x9
   11098:	4691                	c.li	a3,4
   1109a:	0ee6fc63          	bgeu	a3,a4,11192 <_malloc_r+0x478>
   1109e:	46d1                	c.li	a3,20
   110a0:	1ae6ed63          	bltu	a3,a4,1125a <_malloc_r+0x540>
   110a4:	05c7061b          	addiw	a2,a4,92
   110a8:	0016161b          	slliw	a2,a2,0x1
   110ac:	060e                	c.slli	a2,0x3
   110ae:	05b7069b          	addiw	a3,a4,91
   110b2:	964e                	c.add	a2,s3
   110b4:	6218                	c.ld	a4,0(a2)
   110b6:	1641                	c.addi	a2,-16
   110b8:	00e61663          	bne	a2,a4,110c4 <_malloc_r+0x3aa>
   110bc:	aa89                	c.j	1120e <_malloc_r+0x4f4>
   110be:	6b18                	c.ld	a4,16(a4)
   110c0:	00e60663          	beq	a2,a4,110cc <_malloc_r+0x3b2>
   110c4:	6714                	c.ld	a3,8(a4)
   110c6:	9af1                	c.andi	a3,-4
   110c8:	fed7ebe3          	bltu	a5,a3,110be <_malloc_r+0x3a4>
   110cc:	6f10                	c.ld	a2,24(a4)
   110ce:	ec10                	c.sd	a2,24(s0)
   110d0:	e818                	c.sd	a4,16(s0)
   110d2:	ea00                	c.sd	s0,16(a2)
   110d4:	ef00                	c.sd	s0,24(a4)
   110d6:	bbbd                	c.j	10e54 <_malloc_r+0x13a>
   110d8:	4751                	c.li	a4,20
   110da:	0cf77663          	bgeu	a4,a5,111a6 <_malloc_r+0x48c>
   110de:	05400713          	addi	a4,zero,84
   110e2:	18f76a63          	bltu	a4,a5,11276 <_malloc_r+0x55c>
   110e6:	00c4d793          	srli	a5,s1,0xc
   110ea:	06f7859b          	addiw	a1,a5,111 # fffffffffffff06f <__BSS_END__+0xfffffffffffe00f7>
   110ee:	0015961b          	slliw	a2,a1,0x1
   110f2:	06e7881b          	addiw	a6,a5,110
   110f6:	060e                	c.slli	a2,0x3
   110f8:	b1f1                	c.j	10dc4 <_malloc_r+0xaa>
   110fa:	2e05                	c.addiw	t3,1
   110fc:	003e7793          	andi	a5,t3,3
   11100:	0541                	c.addi	a0,16
   11102:	cfdd                	c.beqz	a5,111c0 <_malloc_r+0x4a6>
   11104:	6d1c                	c.ld	a5,24(a0)
   11106:	b379                	c.j	10e94 <_malloc_r+0x17a>
   11108:	6810                	c.ld	a2,16(s0)
   1110a:	0014e593          	ori	a1,s1,1
   1110e:	e40c                	c.sd	a1,8(s0)
   11110:	ee1c                	c.sd	a5,24(a2)
   11112:	eb90                	c.sd	a2,16(a5)
   11114:	94a2                	c.add	s1,s0
   11116:	0299b423          	sd	s1,40(s3)
   1111a:	0299b023          	sd	s1,32(s3)
   1111e:	0016e793          	ori	a5,a3,1
   11122:	9722                	c.add	a4,s0
   11124:	0104bc23          	sd	a6,24(s1)
   11128:	0104b823          	sd	a6,16(s1)
   1112c:	e49c                	c.sd	a5,8(s1)
   1112e:	854a                	c.mv	a0,s2
   11130:	e314                	c.sd	a3,0(a4)
   11132:	21e000ef          	jal	ra,11350 <__malloc_unlock>
   11136:	01040513          	addi	a0,s0,16
   1113a:	bb59                	c.j	10ed0 <_malloc_r+0x1b6>
   1113c:	97a2                	c.add	a5,s0
   1113e:	6798                	c.ld	a4,8(a5)
   11140:	854a                	c.mv	a0,s2
   11142:	00176713          	ori	a4,a4,1
   11146:	e798                	c.sd	a4,8(a5)
   11148:	208000ef          	jal	ra,11350 <__malloc_unlock>
   1114c:	01040513          	addi	a0,s0,16
   11150:	b341                	c.j	10ed0 <_malloc_r+0x1b6>
   11152:	0014e693          	ori	a3,s1,1
   11156:	e414                	c.sd	a3,8(s0)
   11158:	94a2                	c.add	s1,s0
   1115a:	0299b423          	sd	s1,40(s3)
   1115e:	0299b023          	sd	s1,32(s3)
   11162:	00176693          	ori	a3,a4,1
   11166:	97a2                	c.add	a5,s0
   11168:	0104bc23          	sd	a6,24(s1)
   1116c:	0104b823          	sd	a6,16(s1)
   11170:	e494                	c.sd	a3,8(s1)
   11172:	854a                	c.mv	a0,s2
   11174:	e398                	c.sd	a4,0(a5)
   11176:	1da000ef          	jal	ra,11350 <__malloc_unlock>
   1117a:	01040513          	addi	a0,s0,16
   1117e:	bb89                	c.j	10ed0 <_malloc_r+0x1b6>
   11180:	0034d593          	srli	a1,s1,0x3
   11184:	0015879b          	addiw	a5,a1,1
   11188:	0017979b          	slliw	a5,a5,0x1
   1118c:	078e                	c.slli	a5,0x3
   1118e:	2581                	c.addiw	a1,0
   11190:	be5d                	c.j	10d46 <_malloc_r+0x2c>
   11192:	0067d713          	srli	a4,a5,0x6
   11196:	0397061b          	addiw	a2,a4,57
   1119a:	0016161b          	slliw	a2,a2,0x1
   1119e:	060e                	c.slli	a2,0x3
   111a0:	0387069b          	addiw	a3,a4,56
   111a4:	b739                	c.j	110b2 <_malloc_r+0x398>
   111a6:	05c7859b          	addiw	a1,a5,92
   111aa:	0015961b          	slliw	a2,a1,0x1
   111ae:	05b7881b          	addiw	a6,a5,91
   111b2:	060e                	c.slli	a2,0x3
   111b4:	b901                	c.j	10dc4 <_malloc_r+0xaa>
   111b6:	01033783          	ld	a5,16(t1)
   111ba:	35fd                	c.addiw	a1,-1
   111bc:	18679663          	bne	a5,t1,11348 <_malloc_r+0x62e>
   111c0:	0035f793          	andi	a5,a1,3
   111c4:	1341                	c.addi	t1,-16
   111c6:	fbe5                	c.bnez	a5,111b6 <_malloc_r+0x49c>
   111c8:	0089b703          	ld	a4,8(s3)
   111cc:	fff64793          	xori	a5,a2,-1
   111d0:	8ff9                	c.and	a5,a4
   111d2:	00f9b423          	sd	a5,8(s3)
   111d6:	0606                	c.slli	a2,0x1
   111d8:	d0c7eae3          	bltu	a5,a2,10eec <_malloc_r+0x1d2>
   111dc:	d00608e3          	beq	a2,zero,10eec <_malloc_r+0x1d2>
   111e0:	00f67733          	and	a4,a2,a5
   111e4:	e711                	c.bnez	a4,111f0 <_malloc_r+0x4d6>
   111e6:	0606                	c.slli	a2,0x1
   111e8:	00f67733          	and	a4,a2,a5
   111ec:	2e11                	c.addiw	t3,4
   111ee:	df65                	c.beqz	a4,111e6 <_malloc_r+0x4cc>
   111f0:	85f2                	c.mv	a1,t3
   111f2:	b179                	c.j	10e80 <_malloc_r+0x166>
   111f4:	01040593          	addi	a1,s0,16
   111f8:	854a                	c.mv	a0,s2
   111fa:	8dfff0ef          	jal	ra,10ad8 <_free_r>
   111fe:	000c2703          	lw	a4,0(s8)
   11202:	0109bb03          	ld	s6,16(s3)
   11206:	b3d5                	c.j	10fea <_malloc_r+0x2d0>
   11208:	020a0a13          	addi	s4,s4,32
   1120c:	b30d                	c.j	10f2e <_malloc_r+0x214>
   1120e:	4026d69b          	sraiw	a3,a3,0x2
   11212:	4785                	c.li	a5,1
   11214:	00d797b3          	sll	a5,a5,a3
   11218:	8d5d                	c.or	a0,a5
   1121a:	00a9b423          	sd	a0,8(s3)
   1121e:	bd45                	c.j	110ce <_malloc_r+0x3b4>
   11220:	014b0bb3          	add	s7,s6,s4
   11224:	41700bb3          	sub	s7,zero,s7
   11228:	1bd2                	c.slli	s7,0x34
   1122a:	034bdb93          	srli	s7,s7,0x34
   1122e:	85de                	c.mv	a1,s7
   11230:	854a                	c.mv	a0,s2
   11232:	3f2000ef          	jal	ra,11624 <_sbrk_r>
   11236:	57fd                	c.li	a5,-1
   11238:	4681                	c.li	a3,0
   1123a:	d6f514e3          	bne	a0,a5,10fa2 <_malloc_r+0x288>
   1123e:	bb85                	c.j	10fae <_malloc_r+0x294>
   11240:	6c42                	c.ldsp	s8,16(sp)
   11242:	4785                	c.li	a5,1
   11244:	00fb3423          	sd	a5,8(s6)
   11248:	854a                	c.mv	a0,s2
   1124a:	106000ef          	jal	ra,11350 <__malloc_unlock>
   1124e:	7a42                	c.ldsp	s4,48(sp)
   11250:	7aa2                	c.ldsp	s5,40(sp)
   11252:	7b02                	c.ldsp	s6,32(sp)
   11254:	6be2                	c.ldsp	s7,24(sp)
   11256:	6ca2                	c.ldsp	s9,8(sp)
   11258:	b99d                	c.j	10ece <_malloc_r+0x1b4>
   1125a:	05400693          	addi	a3,zero,84
   1125e:	06e6e963          	bltu	a3,a4,112d0 <_malloc_r+0x5b6>
   11262:	00c7d713          	srli	a4,a5,0xc
   11266:	06f7061b          	addiw	a2,a4,111
   1126a:	0016161b          	slliw	a2,a2,0x1
   1126e:	060e                	c.slli	a2,0x3
   11270:	06e7069b          	addiw	a3,a4,110
   11274:	bd3d                	c.j	110b2 <_malloc_r+0x398>
   11276:	15400713          	addi	a4,zero,340
   1127a:	06f76963          	bltu	a4,a5,112ec <_malloc_r+0x5d2>
   1127e:	00f4d793          	srli	a5,s1,0xf
   11282:	0787859b          	addiw	a1,a5,120
   11286:	0015961b          	slliw	a2,a1,0x1
   1128a:	0777881b          	addiw	a6,a5,119
   1128e:	060e                	c.slli	a2,0x3
   11290:	be15                	c.j	10dc4 <_malloc_r+0xaa>
   11292:	0001fc37          	lui	s8,0x1f
   11296:	c38c0c13          	addi	s8,s8,-968 # 1ec38 <__malloc_current_mallinfo>
   1129a:	000c2683          	lw	a3,0(s8)
   1129e:	014686bb          	addw	a3,a3,s4
   112a2:	00dc2023          	sw	a3,0(s8)
   112a6:	b965                	c.j	10f5e <_malloc_r+0x244>
   112a8:	0109b403          	ld	s0,16(s3)
   112ac:	641c                	c.ld	a5,8(s0)
   112ae:	b3ad                	c.j	11018 <_malloc_r+0x2fe>
   112b0:	03451793          	slli	a5,a0,0x34
   112b4:	ca0795e3          	bne	a5,zero,10f5e <_malloc_r+0x244>
   112b8:	0109bb03          	ld	s6,16(s3)
   112bc:	014a87b3          	add	a5,s5,s4
   112c0:	0017e793          	ori	a5,a5,1
   112c4:	00fb3423          	sd	a5,8(s6)
   112c8:	b31d                	c.j	10fee <_malloc_r+0x2d4>
   112ca:	8161b823          	sd	s6,-2032(gp) # 129a8 <__malloc_sbrk_base>
   112ce:	b155                	c.j	10f72 <_malloc_r+0x258>
   112d0:	15400693          	addi	a3,zero,340
   112d4:	04e6e063          	bltu	a3,a4,11314 <_malloc_r+0x5fa>
   112d8:	00f7d713          	srli	a4,a5,0xf
   112dc:	0787061b          	addiw	a2,a4,120
   112e0:	0016161b          	slliw	a2,a2,0x1
   112e4:	060e                	c.slli	a2,0x3
   112e6:	0777069b          	addiw	a3,a4,119
   112ea:	b3e1                	c.j	110b2 <_malloc_r+0x398>
   112ec:	55400713          	addi	a4,zero,1364
   112f0:	04f76063          	bltu	a4,a5,11330 <_malloc_r+0x616>
   112f4:	0124d793          	srli	a5,s1,0x12
   112f8:	07d7859b          	addiw	a1,a5,125
   112fc:	0015961b          	slliw	a2,a1,0x1
   11300:	07c7881b          	addiw	a6,a5,124
   11304:	060e                	c.slli	a2,0x3
   11306:	bc7d                	c.j	10dc4 <_malloc_r+0xaa>
   11308:	1cc1                	c.addi	s9,-16
   1130a:	9a66                	c.add	s4,s9
   1130c:	416a0a33          	sub	s4,s4,s6
   11310:	4681                	c.li	a3,0
   11312:	b971                	c.j	10fae <_malloc_r+0x294>
   11314:	55400693          	addi	a3,zero,1364
   11318:	02e6e363          	bltu	a3,a4,1133e <_malloc_r+0x624>
   1131c:	0127d713          	srli	a4,a5,0x12
   11320:	07d7061b          	addiw	a2,a4,125
   11324:	0016161b          	slliw	a2,a2,0x1
   11328:	060e                	c.slli	a2,0x3
   1132a:	07c7069b          	addiw	a3,a4,124
   1132e:	b351                	c.j	110b2 <_malloc_r+0x398>
   11330:	7f000613          	addi	a2,zero,2032
   11334:	07f00593          	addi	a1,zero,127
   11338:	07e00813          	addi	a6,zero,126
   1133c:	b461                	c.j	10dc4 <_malloc_r+0xaa>
   1133e:	7f000613          	addi	a2,zero,2032
   11342:	07e00693          	addi	a3,zero,126
   11346:	b3b5                	c.j	110b2 <_malloc_r+0x398>
   11348:	0089b783          	ld	a5,8(s3)
   1134c:	b569                	c.j	111d6 <_malloc_r+0x4bc>

000000000001134e <__malloc_lock>:
   1134e:	8082                	c.jr	ra

0000000000011350 <__malloc_unlock>:
   11350:	8082                	c.jr	ra

0000000000011352 <_fclose_r>:
   11352:	1101                	c.addi	sp,-32
   11354:	ec06                	c.sdsp	ra,24(sp)
   11356:	e04a                	c.sdsp	s2,0(sp)
   11358:	cd89                	c.beqz	a1,11372 <_fclose_r+0x20>
   1135a:	e822                	c.sdsp	s0,16(sp)
   1135c:	e426                	c.sdsp	s1,8(sp)
   1135e:	842e                	c.mv	s0,a1
   11360:	84aa                	c.mv	s1,a0
   11362:	c119                	c.beqz	a0,11368 <_fclose_r+0x16>
   11364:	653c                	c.ld	a5,72(a0)
   11366:	c7d9                	c.beqz	a5,113f4 <_fclose_r+0xa2>
   11368:	01041783          	lh	a5,16(s0)
   1136c:	eb89                	c.bnez	a5,1137e <_fclose_r+0x2c>
   1136e:	6442                	c.ldsp	s0,16(sp)
   11370:	64a2                	c.ldsp	s1,8(sp)
   11372:	60e2                	c.ldsp	ra,24(sp)
   11374:	4901                	c.li	s2,0
   11376:	854a                	c.mv	a0,s2
   11378:	6902                	c.ldsp	s2,0(sp)
   1137a:	6105                	c.addi16sp	sp,32
   1137c:	8082                	c.jr	ra
   1137e:	85a2                	c.mv	a1,s0
   11380:	8526                	c.mv	a0,s1
   11382:	082000ef          	jal	ra,11404 <__sflush_r>
   11386:	683c                	c.ld	a5,80(s0)
   11388:	892a                	c.mv	s2,a0
   1138a:	c791                	c.beqz	a5,11396 <_fclose_r+0x44>
   1138c:	780c                	c.ld	a1,48(s0)
   1138e:	8526                	c.mv	a0,s1
   11390:	9782                	c.jalr	a5
   11392:	04054663          	blt	a0,zero,113de <_fclose_r+0x8c>
   11396:	01045783          	lhu	a5,16(s0)
   1139a:	0807f793          	andi	a5,a5,128
   1139e:	e7b1                	c.bnez	a5,113ea <_fclose_r+0x98>
   113a0:	6c2c                	c.ld	a1,88(s0)
   113a2:	c991                	c.beqz	a1,113b6 <_fclose_r+0x64>
   113a4:	07440793          	addi	a5,s0,116
   113a8:	00f58563          	beq	a1,a5,113b2 <_fclose_r+0x60>
   113ac:	8526                	c.mv	a0,s1
   113ae:	f2aff0ef          	jal	ra,10ad8 <_free_r>
   113b2:	04043c23          	sd	zero,88(s0)
   113b6:	7c2c                	c.ld	a1,120(s0)
   113b8:	c591                	c.beqz	a1,113c4 <_fclose_r+0x72>
   113ba:	8526                	c.mv	a0,s1
   113bc:	f1cff0ef          	jal	ra,10ad8 <_free_r>
   113c0:	06043c23          	sd	zero,120(s0)
   113c4:	968ff0ef          	jal	ra,1052c <__sfp_lock_acquire>
   113c8:	00041823          	sh	zero,16(s0)
   113cc:	962ff0ef          	jal	ra,1052e <__sfp_lock_release>
   113d0:	60e2                	c.ldsp	ra,24(sp)
   113d2:	6442                	c.ldsp	s0,16(sp)
   113d4:	64a2                	c.ldsp	s1,8(sp)
   113d6:	854a                	c.mv	a0,s2
   113d8:	6902                	c.ldsp	s2,0(sp)
   113da:	6105                	c.addi16sp	sp,32
   113dc:	8082                	c.jr	ra
   113de:	01045783          	lhu	a5,16(s0)
   113e2:	597d                	c.li	s2,-1
   113e4:	0807f793          	andi	a5,a5,128
   113e8:	dfc5                	c.beqz	a5,113a0 <_fclose_r+0x4e>
   113ea:	6c0c                	c.ld	a1,24(s0)
   113ec:	8526                	c.mv	a0,s1
   113ee:	eeaff0ef          	jal	ra,10ad8 <_free_r>
   113f2:	b77d                	c.j	113a0 <_fclose_r+0x4e>
   113f4:	922ff0ef          	jal	ra,10516 <__sinit>
   113f8:	bf85                	c.j	11368 <_fclose_r+0x16>

00000000000113fa <fclose>:
   113fa:	67cd                	c.lui	a5,0x13
   113fc:	85aa                	c.mv	a1,a0
   113fe:	9a07b503          	ld	a0,-1632(a5) # 129a0 <_impure_ptr>
   11402:	bf81                	c.j	11352 <_fclose_r>

0000000000011404 <__sflush_r>:
   11404:	01059703          	lh	a4,16(a1)
   11408:	7179                	c.addi16sp	sp,-48
   1140a:	f022                	c.sdsp	s0,32(sp)
   1140c:	e44e                	c.sdsp	s3,8(sp)
   1140e:	f406                	c.sdsp	ra,40(sp)
   11410:	00877793          	andi	a5,a4,8
   11414:	842e                	c.mv	s0,a1
   11416:	89aa                	c.mv	s3,a0
   11418:	e7e1                	c.bnez	a5,114e0 <__sflush_r+0xdc>
   1141a:	6785                	c.lui	a5,0x1
   1141c:	80078793          	addi	a5,a5,-2048 # 800 <exit-0xf920>
   11420:	4594                	c.lw	a3,8(a1)
   11422:	8fd9                	c.or	a5,a4
   11424:	00f59823          	sh	a5,16(a1)
   11428:	10d05963          	bge	zero,a3,1153a <__sflush_r+0x136>
   1142c:	04843803          	ld	a6,72(s0)
   11430:	0a080263          	beq	a6,zero,114d4 <__sflush_r+0xd0>
   11434:	ec26                	c.sdsp	s1,24(sp)
   11436:	03371693          	slli	a3,a4,0x33
   1143a:	0009a483          	lw	s1,0(s3)
   1143e:	0009a023          	sw	zero,0(s3)
   11442:	1006c363          	blt	a3,zero,11548 <__sflush_r+0x144>
   11446:	780c                	c.ld	a1,48(s0)
   11448:	4601                	c.li	a2,0
   1144a:	4685                	c.li	a3,1
   1144c:	854e                	c.mv	a0,s3
   1144e:	9802                	c.jalr	a6
   11450:	57fd                	c.li	a5,-1
   11452:	862a                	c.mv	a2,a0
   11454:	12f50163          	beq	a0,a5,11576 <__sflush_r+0x172>
   11458:	01041783          	lh	a5,16(s0)
   1145c:	04843803          	ld	a6,72(s0)
   11460:	8b91                	c.andi	a5,4
   11462:	c799                	c.beqz	a5,11470 <__sflush_r+0x6c>
   11464:	4418                	c.lw	a4,8(s0)
   11466:	6c3c                	c.ld	a5,88(s0)
   11468:	8e19                	c.sub	a2,a4
   1146a:	c399                	c.beqz	a5,11470 <__sflush_r+0x6c>
   1146c:	583c                	c.lw	a5,112(s0)
   1146e:	8e1d                	c.sub	a2,a5
   11470:	780c                	c.ld	a1,48(s0)
   11472:	4681                	c.li	a3,0
   11474:	854e                	c.mv	a0,s3
   11476:	9802                	c.jalr	a6
   11478:	577d                	c.li	a4,-1
   1147a:	01041783          	lh	a5,16(s0)
   1147e:	0ce51763          	bne	a0,a4,1154c <__sflush_r+0x148>
   11482:	0009a683          	lw	a3,0(s3)
   11486:	4775                	c.li	a4,29
   11488:	10d76363          	bltu	a4,a3,1158e <__sflush_r+0x18a>
   1148c:	20400737          	lui	a4,0x20400
   11490:	0705                	c.addi	a4,1 # 20400001 <__BSS_END__+0x203e1089>
   11492:	00d75733          	srl	a4,a4,a3
   11496:	8b05                	c.andi	a4,1
   11498:	cb7d                	c.beqz	a4,1158e <__sflush_r+0x18a>
   1149a:	6c10                	c.ld	a2,24(s0)
   1149c:	777d                	c.lui	a4,0xfffff
   1149e:	7ff70713          	addi	a4,a4,2047 # fffffffffffff7ff <__BSS_END__+0xfffffffffffe0887>
   114a2:	8f7d                	c.and	a4,a5
   114a4:	00e41823          	sh	a4,16(s0)
   114a8:	00042423          	sw	zero,8(s0)
   114ac:	e010                	c.sd	a2,0(s0)
   114ae:	03379713          	slli	a4,a5,0x33
   114b2:	00075363          	bge	a4,zero,114b8 <__sflush_r+0xb4>
   114b6:	cacd                	c.beqz	a3,11568 <__sflush_r+0x164>
   114b8:	6c2c                	c.ld	a1,88(s0)
   114ba:	0099a023          	sw	s1,0(s3)
   114be:	c9d5                	c.beqz	a1,11572 <__sflush_r+0x16e>
   114c0:	07440793          	addi	a5,s0,116
   114c4:	00f58563          	beq	a1,a5,114ce <__sflush_r+0xca>
   114c8:	854e                	c.mv	a0,s3
   114ca:	e0eff0ef          	jal	ra,10ad8 <_free_r>
   114ce:	64e2                	c.ldsp	s1,24(sp)
   114d0:	04043c23          	sd	zero,88(s0)
   114d4:	70a2                	c.ldsp	ra,40(sp)
   114d6:	7402                	c.ldsp	s0,32(sp)
   114d8:	69a2                	c.ldsp	s3,8(sp)
   114da:	4501                	c.li	a0,0
   114dc:	6145                	c.addi16sp	sp,48
   114de:	8082                	c.jr	ra
   114e0:	e84a                	c.sdsp	s2,16(sp)
   114e2:	0185b903          	ld	s2,24(a1)
   114e6:	04090f63          	beq	s2,zero,11544 <__sflush_r+0x140>
   114ea:	ec26                	c.sdsp	s1,24(sp)
   114ec:	6184                	c.ld	s1,0(a1)
   114ee:	8b0d                	c.andi	a4,3
   114f0:	0125b023          	sd	s2,0(a1)
   114f4:	412484bb          	subw	s1,s1,s2
   114f8:	4781                	c.li	a5,0
   114fa:	e311                	c.bnez	a4,114fe <__sflush_r+0xfa>
   114fc:	519c                	c.lw	a5,32(a1)
   114fe:	c45c                	c.sw	a5,12(s0)
   11500:	00904663          	blt	zero,s1,1150c <__sflush_r+0x108>
   11504:	a83d                	c.j	11542 <__sflush_r+0x13e>
   11506:	992a                	c.add	s2,a0
   11508:	02905d63          	bge	zero,s1,11542 <__sflush_r+0x13e>
   1150c:	603c                	c.ld	a5,64(s0)
   1150e:	780c                	c.ld	a1,48(s0)
   11510:	86a6                	c.mv	a3,s1
   11512:	864a                	c.mv	a2,s2
   11514:	854e                	c.mv	a0,s3
   11516:	9782                	c.jalr	a5
   11518:	9c89                	c.subw	s1,a0
   1151a:	fea046e3          	blt	zero,a0,11506 <__sflush_r+0x102>
   1151e:	01041783          	lh	a5,16(s0)
   11522:	6942                	c.ldsp	s2,16(sp)
   11524:	0407e793          	ori	a5,a5,64
   11528:	70a2                	c.ldsp	ra,40(sp)
   1152a:	00f41823          	sh	a5,16(s0)
   1152e:	7402                	c.ldsp	s0,32(sp)
   11530:	64e2                	c.ldsp	s1,24(sp)
   11532:	69a2                	c.ldsp	s3,8(sp)
   11534:	557d                	c.li	a0,-1
   11536:	6145                	c.addi16sp	sp,48
   11538:	8082                	c.jr	ra
   1153a:	59b4                	c.lw	a3,112(a1)
   1153c:	eed048e3          	blt	zero,a3,1142c <__sflush_r+0x28>
   11540:	bf51                	c.j	114d4 <__sflush_r+0xd0>
   11542:	64e2                	c.ldsp	s1,24(sp)
   11544:	6942                	c.ldsp	s2,16(sp)
   11546:	b779                	c.j	114d4 <__sflush_r+0xd0>
   11548:	6850                	c.ld	a2,144(s0)
   1154a:	bf19                	c.j	11460 <__sflush_r+0x5c>
   1154c:	6c14                	c.ld	a3,24(s0)
   1154e:	777d                	c.lui	a4,0xfffff
   11550:	7ff70713          	addi	a4,a4,2047 # fffffffffffff7ff <__BSS_END__+0xfffffffffffe0887>
   11554:	8f7d                	c.and	a4,a5
   11556:	00e41823          	sh	a4,16(s0)
   1155a:	00042423          	sw	zero,8(s0)
   1155e:	e014                	c.sd	a3,0(s0)
   11560:	03379713          	slli	a4,a5,0x33
   11564:	f4075ae3          	bge	a4,zero,114b8 <__sflush_r+0xb4>
   11568:	6c2c                	c.ld	a1,88(s0)
   1156a:	e848                	c.sd	a0,144(s0)
   1156c:	0099a023          	sw	s1,0(s3)
   11570:	f9a1                	c.bnez	a1,114c0 <__sflush_r+0xbc>
   11572:	64e2                	c.ldsp	s1,24(sp)
   11574:	b785                	c.j	114d4 <__sflush_r+0xd0>
   11576:	0009a783          	lw	a5,0(s3)
   1157a:	ec078fe3          	beq	a5,zero,11458 <__sflush_r+0x54>
   1157e:	4775                	c.li	a4,29
   11580:	00e78a63          	beq	a5,a4,11594 <__sflush_r+0x190>
   11584:	4759                	c.li	a4,22
   11586:	00e78763          	beq	a5,a4,11594 <__sflush_r+0x190>
   1158a:	01041783          	lh	a5,16(s0)
   1158e:	0407e793          	ori	a5,a5,64
   11592:	bf59                	c.j	11528 <__sflush_r+0x124>
   11594:	0099a023          	sw	s1,0(s3)
   11598:	64e2                	c.ldsp	s1,24(sp)
   1159a:	bf2d                	c.j	114d4 <__sflush_r+0xd0>

000000000001159c <_fflush_r>:
   1159c:	1101                	c.addi	sp,-32
   1159e:	e822                	c.sdsp	s0,16(sp)
   115a0:	ec06                	c.sdsp	ra,24(sp)
   115a2:	842a                	c.mv	s0,a0
   115a4:	c119                	c.beqz	a0,115aa <_fflush_r+0xe>
   115a6:	653c                	c.ld	a5,72(a0)
   115a8:	cf91                	c.beqz	a5,115c4 <_fflush_r+0x28>
   115aa:	01059783          	lh	a5,16(a1)
   115ae:	e791                	c.bnez	a5,115ba <_fflush_r+0x1e>
   115b0:	60e2                	c.ldsp	ra,24(sp)
   115b2:	6442                	c.ldsp	s0,16(sp)
   115b4:	4501                	c.li	a0,0
   115b6:	6105                	c.addi16sp	sp,32
   115b8:	8082                	c.jr	ra
   115ba:	8522                	c.mv	a0,s0
   115bc:	6442                	c.ldsp	s0,16(sp)
   115be:	60e2                	c.ldsp	ra,24(sp)
   115c0:	6105                	c.addi16sp	sp,32
   115c2:	b589                	c.j	11404 <__sflush_r>
   115c4:	e42e                	c.sdsp	a1,8(sp)
   115c6:	f51fe0ef          	jal	ra,10516 <__sinit>
   115ca:	65a2                	c.ldsp	a1,8(sp)
   115cc:	bff9                	c.j	115aa <_fflush_r+0xe>

00000000000115ce <fflush>:
   115ce:	cd0d                	c.beqz	a0,11608 <fflush+0x3a>
   115d0:	67cd                	c.lui	a5,0x13
   115d2:	85aa                	c.mv	a1,a0
   115d4:	9a07b503          	ld	a0,-1632(a5) # 129a0 <_impure_ptr>
   115d8:	c119                	c.beqz	a0,115de <fflush+0x10>
   115da:	653c                	c.ld	a5,72(a0)
   115dc:	c799                	c.beqz	a5,115ea <fflush+0x1c>
   115de:	01059783          	lh	a5,16(a1)
   115e2:	e399                	c.bnez	a5,115e8 <fflush+0x1a>
   115e4:	4501                	c.li	a0,0
   115e6:	8082                	c.jr	ra
   115e8:	bd31                	c.j	11404 <__sflush_r>
   115ea:	1101                	c.addi	sp,-32
   115ec:	e42e                	c.sdsp	a1,8(sp)
   115ee:	e02a                	c.sdsp	a0,0(sp)
   115f0:	ec06                	c.sdsp	ra,24(sp)
   115f2:	f25fe0ef          	jal	ra,10516 <__sinit>
   115f6:	65a2                	c.ldsp	a1,8(sp)
   115f8:	6502                	c.ldsp	a0,0(sp)
   115fa:	01059783          	lh	a5,16(a1)
   115fe:	e385                	c.bnez	a5,1161e <fflush+0x50>
   11600:	60e2                	c.ldsp	ra,24(sp)
   11602:	4501                	c.li	a0,0
   11604:	6105                	c.addi16sp	sp,32
   11606:	8082                	c.jr	ra
   11608:	6649                	c.lui	a2,0x12
   1160a:	65c5                	c.lui	a1,0x11
   1160c:	6549                	c.lui	a0,0x12
   1160e:	01860613          	addi	a2,a2,24 # 12018 <__sglue>
   11612:	59c58593          	addi	a1,a1,1436 # 1159c <_fflush_r>
   11616:	03050513          	addi	a0,a0,48 # 12030 <_impure_data>
   1161a:	f37fe06f          	jal	zero,10550 <_fwalk_sglue>
   1161e:	60e2                	c.ldsp	ra,24(sp)
   11620:	6105                	c.addi16sp	sp,32
   11622:	b3cd                	c.j	11404 <__sflush_r>

0000000000011624 <_sbrk_r>:
   11624:	1101                	c.addi	sp,-32
   11626:	e822                	c.sdsp	s0,16(sp)
   11628:	e426                	c.sdsp	s1,8(sp)
   1162a:	842a                	c.mv	s0,a0
   1162c:	852e                	c.mv	a0,a1
   1162e:	ec06                	c.sdsp	ra,24(sp)
   11630:	8201a423          	sw	zero,-2008(gp) # 129c0 <errno>
   11634:	176000ef          	jal	ra,117aa <_sbrk>
   11638:	57fd                	c.li	a5,-1
   1163a:	00f50763          	beq	a0,a5,11648 <_sbrk_r+0x24>
   1163e:	60e2                	c.ldsp	ra,24(sp)
   11640:	6442                	c.ldsp	s0,16(sp)
   11642:	64a2                	c.ldsp	s1,8(sp)
   11644:	6105                	c.addi16sp	sp,32
   11646:	8082                	c.jr	ra
   11648:	8281a783          	lw	a5,-2008(gp) # 129c0 <errno>
   1164c:	dbed                	c.beqz	a5,1163e <_sbrk_r+0x1a>
   1164e:	60e2                	c.ldsp	ra,24(sp)
   11650:	c01c                	c.sw	a5,0(s0)
   11652:	6442                	c.ldsp	s0,16(sp)
   11654:	64a2                	c.ldsp	s1,8(sp)
   11656:	6105                	c.addi16sp	sp,32
   11658:	8082                	c.jr	ra

000000000001165a <__libc_fini_array>:
   1165a:	1101                	c.addi	sp,-32
   1165c:	e822                	c.sdsp	s0,16(sp)
   1165e:	67c9                	c.lui	a5,0x12
   11660:	6449                	c.lui	s0,0x12
   11662:	01840413          	addi	s0,s0,24 # 12018 <__sglue>
   11666:	01078793          	addi	a5,a5,16 # 12010 <__do_global_dtors_aux_fini_array_entry>
   1166a:	8c1d                	c.sub	s0,a5
   1166c:	e426                	c.sdsp	s1,8(sp)
   1166e:	ec06                	c.sdsp	ra,24(sp)
   11670:	40345493          	srai	s1,s0,0x3
   11674:	c881                	c.beqz	s1,11684 <__libc_fini_array+0x2a>
   11676:	1461                	c.addi	s0,-8
   11678:	943e                	c.add	s0,a5
   1167a:	601c                	c.ld	a5,0(s0)
   1167c:	14fd                	c.addi	s1,-1
   1167e:	1461                	c.addi	s0,-8
   11680:	9782                	c.jalr	a5
   11682:	fce5                	c.bnez	s1,1167a <__libc_fini_array+0x20>
   11684:	60e2                	c.ldsp	ra,24(sp)
   11686:	6442                	c.ldsp	s0,16(sp)
   11688:	64a2                	c.ldsp	s1,8(sp)
   1168a:	6105                	c.addi16sp	sp,32
   1168c:	8082                	c.jr	ra

000000000001168e <__register_exitproc>:
   1168e:	8301b783          	ld	a5,-2000(gp) # 129c8 <__atexit>
   11692:	c3a9                	c.beqz	a5,116d4 <__register_exitproc+0x46>
   11694:	4798                	c.lw	a4,8(a5)
   11696:	487d                	c.li	a6,31
   11698:	06e84463          	blt	a6,a4,11700 <__register_exitproc+0x72>
   1169c:	c505                	c.beqz	a0,116c4 <__register_exitproc+0x36>
   1169e:	00371813          	slli	a6,a4,0x3
   116a2:	983e                	c.add	a6,a5
   116a4:	10c83823          	sd	a2,272(a6)
   116a8:	3107a883          	lw	a7,784(a5)
   116ac:	4605                	c.li	a2,1
   116ae:	00e6163b          	sllw	a2,a2,a4
   116b2:	00c8e8b3          	or	a7,a7,a2
   116b6:	3117a823          	sw	a7,784(a5)
   116ba:	20d83823          	sd	a3,528(a6)
   116be:	4689                	c.li	a3,2
   116c0:	02d50363          	beq	a0,a3,116e6 <__register_exitproc+0x58>
   116c4:	00371693          	slli	a3,a4,0x3
   116c8:	2705                	c.addiw	a4,1
   116ca:	96be                	c.add	a3,a5
   116cc:	c798                	c.sw	a4,8(a5)
   116ce:	ea8c                	c.sd	a1,16(a3)
   116d0:	4501                	c.li	a0,0
   116d2:	8082                	c.jr	ra
   116d4:	0001f7b7          	lui	a5,0x1f
   116d8:	c6078813          	addi	a6,a5,-928 # 1ec60 <__atexit0>
   116dc:	8301b823          	sd	a6,-2000(gp) # 129c8 <__atexit>
   116e0:	c6078793          	addi	a5,a5,-928
   116e4:	bf45                	c.j	11694 <__register_exitproc+0x6>
   116e6:	3147a683          	lw	a3,788(a5)
   116ea:	4501                	c.li	a0,0
   116ec:	8e55                	c.or	a2,a3
   116ee:	00371693          	slli	a3,a4,0x3
   116f2:	2705                	c.addiw	a4,1
   116f4:	30c7aa23          	sw	a2,788(a5)
   116f8:	96be                	c.add	a3,a5
   116fa:	c798                	c.sw	a4,8(a5)
   116fc:	ea8c                	c.sd	a1,16(a3)
   116fe:	8082                	c.jr	ra
   11700:	557d                	c.li	a0,-1
   11702:	8082                	c.jr	ra

0000000000011704 <_close>:
   11704:	1141                	c.addi	sp,-16
   11706:	e406                	c.sdsp	ra,8(sp)
   11708:	e022                	c.sdsp	s0,0(sp)
   1170a:	03900893          	addi	a7,zero,57
   1170e:	00000073          	ecall
   11712:	842a                	c.mv	s0,a0
   11714:	00054763          	blt	a0,zero,11722 <_close+0x1e>
   11718:	2501                	c.addiw	a0,0
   1171a:	60a2                	c.ldsp	ra,8(sp)
   1171c:	6402                	c.ldsp	s0,0(sp)
   1171e:	0141                	c.addi	sp,16
   11720:	8082                	c.jr	ra
   11722:	108000ef          	jal	ra,1182a <__errno>
   11726:	4080043b          	subw	s0,zero,s0
   1172a:	c100                	c.sw	s0,0(a0)
   1172c:	557d                	c.li	a0,-1
   1172e:	b7f5                	c.j	1171a <_close+0x16>

0000000000011730 <_exit>:
   11730:	05d00893          	addi	a7,zero,93
   11734:	00000073          	ecall
   11738:	00054363          	blt	a0,zero,1173e <_exit+0xe>
   1173c:	a001                	c.j	1173c <_exit+0xc>
   1173e:	1141                	c.addi	sp,-16
   11740:	e022                	c.sdsp	s0,0(sp)
   11742:	842a                	c.mv	s0,a0
   11744:	e406                	c.sdsp	ra,8(sp)
   11746:	4080043b          	subw	s0,zero,s0
   1174a:	0e0000ef          	jal	ra,1182a <__errno>
   1174e:	c100                	c.sw	s0,0(a0)
   11750:	a001                	c.j	11750 <_exit+0x20>

0000000000011752 <_lseek>:
   11752:	1141                	c.addi	sp,-16
   11754:	e406                	c.sdsp	ra,8(sp)
   11756:	e022                	c.sdsp	s0,0(sp)
   11758:	03e00893          	addi	a7,zero,62
   1175c:	00000073          	ecall
   11760:	842a                	c.mv	s0,a0
   11762:	00054763          	blt	a0,zero,11770 <_lseek+0x1e>
   11766:	60a2                	c.ldsp	ra,8(sp)
   11768:	8522                	c.mv	a0,s0
   1176a:	6402                	c.ldsp	s0,0(sp)
   1176c:	0141                	c.addi	sp,16
   1176e:	8082                	c.jr	ra
   11770:	4080043b          	subw	s0,zero,s0
   11774:	0b6000ef          	jal	ra,1182a <__errno>
   11778:	c100                	c.sw	s0,0(a0)
   1177a:	547d                	c.li	s0,-1
   1177c:	b7ed                	c.j	11766 <_lseek+0x14>

000000000001177e <_read>:
   1177e:	1141                	c.addi	sp,-16
   11780:	e406                	c.sdsp	ra,8(sp)
   11782:	e022                	c.sdsp	s0,0(sp)
   11784:	03f00893          	addi	a7,zero,63
   11788:	00000073          	ecall
   1178c:	842a                	c.mv	s0,a0
   1178e:	00054763          	blt	a0,zero,1179c <_read+0x1e>
   11792:	60a2                	c.ldsp	ra,8(sp)
   11794:	8522                	c.mv	a0,s0
   11796:	6402                	c.ldsp	s0,0(sp)
   11798:	0141                	c.addi	sp,16
   1179a:	8082                	c.jr	ra
   1179c:	4080043b          	subw	s0,zero,s0
   117a0:	08a000ef          	jal	ra,1182a <__errno>
   117a4:	c100                	c.sw	s0,0(a0)
   117a6:	547d                	c.li	s0,-1
   117a8:	b7ed                	c.j	11792 <_read+0x14>

00000000000117aa <_sbrk>:
   117aa:	8501b703          	ld	a4,-1968(gp) # 129e8 <heap_end.0>
   117ae:	1141                	c.addi	sp,-16
   117b0:	e406                	c.sdsp	ra,8(sp)
   117b2:	87aa                	c.mv	a5,a0
   117b4:	ef01                	c.bnez	a4,117cc <_sbrk+0x22>
   117b6:	0d600893          	addi	a7,zero,214
   117ba:	4501                	c.li	a0,0
   117bc:	00000073          	ecall
   117c0:	567d                	c.li	a2,-1
   117c2:	872a                	c.mv	a4,a0
   117c4:	02c50563          	beq	a0,a2,117ee <_sbrk+0x44>
   117c8:	84a1b823          	sd	a0,-1968(gp) # 129e8 <heap_end.0>
   117cc:	00e78533          	add	a0,a5,a4
   117d0:	0d600893          	addi	a7,zero,214
   117d4:	00000073          	ecall
   117d8:	8501b703          	ld	a4,-1968(gp) # 129e8 <heap_end.0>
   117dc:	97ba                	c.add	a5,a4
   117de:	00f51863          	bne	a0,a5,117ee <_sbrk+0x44>
   117e2:	60a2                	c.ldsp	ra,8(sp)
   117e4:	84a1b823          	sd	a0,-1968(gp) # 129e8 <heap_end.0>
   117e8:	853a                	c.mv	a0,a4
   117ea:	0141                	c.addi	sp,16
   117ec:	8082                	c.jr	ra
   117ee:	03c000ef          	jal	ra,1182a <__errno>
   117f2:	60a2                	c.ldsp	ra,8(sp)
   117f4:	47b1                	c.li	a5,12
   117f6:	c11c                	c.sw	a5,0(a0)
   117f8:	557d                	c.li	a0,-1
   117fa:	0141                	c.addi	sp,16
   117fc:	8082                	c.jr	ra

00000000000117fe <_write>:
   117fe:	1141                	c.addi	sp,-16
   11800:	e406                	c.sdsp	ra,8(sp)
   11802:	e022                	c.sdsp	s0,0(sp)
   11804:	04000893          	addi	a7,zero,64
   11808:	00000073          	ecall
   1180c:	842a                	c.mv	s0,a0
   1180e:	00054763          	blt	a0,zero,1181c <_write+0x1e>
   11812:	60a2                	c.ldsp	ra,8(sp)
   11814:	8522                	c.mv	a0,s0
   11816:	6402                	c.ldsp	s0,0(sp)
   11818:	0141                	c.addi	sp,16
   1181a:	8082                	c.jr	ra
   1181c:	4080043b          	subw	s0,zero,s0
   11820:	00a000ef          	jal	ra,1182a <__errno>
   11824:	c100                	c.sw	s0,0(a0)
   11826:	547d                	c.li	s0,-1
   11828:	b7ed                	c.j	11812 <_write+0x14>

000000000001182a <__errno>:
   1182a:	67cd                	c.lui	a5,0x13
   1182c:	9a07b503          	ld	a0,-1632(a5) # 129a0 <_impure_ptr>
   11830:	8082                	c.jr	ra
