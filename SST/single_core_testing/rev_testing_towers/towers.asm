
towers.exe:     file format elf64-littleriscv


Disassembly of section .text:

0000000000010120 <main>:
   10120:	fb010113          	addi	sp,sp,-80
   10124:	00001797          	auipc	a5,0x1
   10128:	7e478793          	addi	a5,a5,2020 # 11908 <__DATA_BEGIN__>
   1012c:	04113423          	sd	ra,72(sp)
   10130:	81018613          	addi	a2,gp,-2032 # 11918 <g_nodePool>
   10134:	06300713          	addi	a4,zero,99
   10138:	00700693          	addi	a3,zero,7
   1013c:	00c7b423          	sd	a2,8(a5)
   10140:	06e7a823          	sw	a4,112(a5)
   10144:	00d7a023          	sw	a3,0(a5)
   10148:	8601bc23          	sd	zero,-1928(gp) # 11980 <g_nodePool+0x68>
   1014c:	82018793          	addi	a5,gp,-2016 # 11928 <g_nodePool+0x10>
   10150:	00000713          	addi	a4,zero,0
   10154:	00600613          	addi	a2,zero,6
   10158:	fee7a823          	sw	a4,-16(a5)
   1015c:	fef7bc23          	sd	a5,-8(a5)
   10160:	0017071b          	addiw	a4,a4,1
   10164:	01078793          	addi	a5,a5,16
   10168:	fec718e3          	bne	a4,a2,10158 <main+0x38>
   1016c:	00700593          	addi	a1,zero,7
   10170:	00810513          	addi	a0,sp,8
   10174:	0f4000ef          	jal	ra,10268 <towers_init>
   10178:	00810513          	addi	a0,sp,8
   1017c:	6f4000ef          	jal	ra,10870 <towers_solve>
   10180:	00810513          	addi	a0,sp,8
   10184:	158000ef          	jal	ra,102dc <towers_clear>
   10188:	00810513          	addi	a0,sp,8
   1018c:	6e4000ef          	jal	ra,10870 <towers_solve>
   10190:	00810513          	addi	a0,sp,8
   10194:	6f0000ef          	jal	ra,10884 <towers_verify>
   10198:	00050663          	beq	a0,zero,101a4 <main+0x84>
	...
   101a4:	04813083          	ld	ra,72(sp)
   101a8:	05010113          	addi	sp,sp,80
   101ac:	00008067          	jalr	zero,0(ra)

00000000000101b0 <list_getSize>:
   101b0:	00052503          	lw	a0,0(a0)
   101b4:	00008067          	jalr	zero,0(ra)

00000000000101b8 <list_init>:
   101b8:	00052023          	sw	zero,0(a0)
   101bc:	00053423          	sd	zero,8(a0)
   101c0:	00008067          	jalr	zero,0(ra)

00000000000101c4 <list_push>:
   101c4:	00001697          	auipc	a3,0x1
   101c8:	74468693          	addi	a3,a3,1860 # 11908 <__DATA_BEGIN__>
   101cc:	0086b783          	ld	a5,8(a3)
   101d0:	00052703          	lw	a4,0(a0)
   101d4:	0087b603          	ld	a2,8(a5)
   101d8:	0017071b          	addiw	a4,a4,1
   101dc:	00c6b423          	sd	a2,8(a3)
   101e0:	00853683          	ld	a3,8(a0)
   101e4:	00d7b423          	sd	a3,8(a5)
   101e8:	00f53423          	sd	a5,8(a0)
   101ec:	00b7a023          	sw	a1,0(a5)
   101f0:	00e52023          	sw	a4,0(a0)
   101f4:	00008067          	jalr	zero,0(ra)

00000000000101f8 <list_pop>:
   101f8:	00853703          	ld	a4,8(a0)
   101fc:	00050793          	addi	a5,a0,0
   10200:	00052683          	lw	a3,0(a0)
   10204:	00873583          	ld	a1,8(a4)
   10208:	00072503          	lw	a0,0(a4)
   1020c:	00001617          	auipc	a2,0x1
   10210:	6fc60613          	addi	a2,a2,1788 # 11908 <__DATA_BEGIN__>
   10214:	00b7b423          	sd	a1,8(a5)
   10218:	00863583          	ld	a1,8(a2)
   1021c:	fff6869b          	addiw	a3,a3,-1
   10220:	00b73423          	sd	a1,8(a4)
   10224:	00e63423          	sd	a4,8(a2)
   10228:	00d7a023          	sw	a3,0(a5)
   1022c:	00008067          	jalr	zero,0(ra)

0000000000010230 <list_clear>:
   10230:	00052703          	lw	a4,0(a0)
   10234:	02e05863          	bge	zero,a4,10264 <list_clear+0x34>
   10238:	00001697          	auipc	a3,0x1
   1023c:	6d068693          	addi	a3,a3,1744 # 11908 <__DATA_BEGIN__>
   10240:	00853783          	ld	a5,8(a0)
   10244:	fff7071b          	addiw	a4,a4,-1
   10248:	0087b603          	ld	a2,8(a5)
   1024c:	00c53423          	sd	a2,8(a0)
   10250:	0086b603          	ld	a2,8(a3)
   10254:	00c7b423          	sd	a2,8(a5)
   10258:	00f6b423          	sd	a5,8(a3)
   1025c:	fe0712e3          	bne	a4,zero,10240 <list_clear+0x10>
   10260:	00052023          	sw	zero,0(a0)
   10264:	00008067          	jalr	zero,0(ra)

0000000000010268 <towers_init>:
   10268:	00052223          	sw	zero,4(a0)
   1026c:	00052423          	sw	zero,8(a0)
   10270:	00053823          	sd	zero,16(a0)
   10274:	00052c23          	sw	zero,24(a0)
   10278:	02053023          	sd	zero,32(a0)
   1027c:	02052423          	sw	zero,40(a0)
   10280:	02053823          	sd	zero,48(a0)
   10284:	00b52023          	sw	a1,0(a0)
   10288:	04b05863          	bge	zero,a1,102d8 <towers_init+0x70>
   1028c:	00001817          	auipc	a6,0x1
   10290:	67c80813          	addi	a6,a6,1660 # 11908 <__DATA_BEGIN__>
   10294:	00883783          	ld	a5,8(a6)
   10298:	00058713          	addi	a4,a1,0
   1029c:	00000693          	addi	a3,zero,0
   102a0:	00c0006f          	jal	zero,102ac <towers_init+0x44>
   102a4:	00078693          	addi	a3,a5,0
   102a8:	00060793          	addi	a5,a2,0
   102ac:	0087b603          	ld	a2,8(a5)
   102b0:	00e7a023          	sw	a4,0(a5)
   102b4:	00d7b423          	sd	a3,8(a5)
   102b8:	fff7071b          	addiw	a4,a4,-1
   102bc:	fe0714e3          	bne	a4,zero,102a4 <towers_init+0x3c>
   102c0:	00c83423          	sd	a2,8(a6)
   102c4:	00d7b423          	sd	a3,8(a5)
   102c8:	00f53823          	sd	a5,16(a0)
   102cc:	00100713          	addi	a4,zero,1
   102d0:	00e7a023          	sw	a4,0(a5)
   102d4:	00b52423          	sw	a1,8(a0)
   102d8:	00008067          	jalr	zero,0(ra)

00000000000102dc <towers_clear>:
   102dc:	00852703          	lw	a4,8(a0)
   102e0:	04e05263          	bge	zero,a4,10324 <towers_clear+0x48>
   102e4:	00001817          	auipc	a6,0x1
   102e8:	62480813          	addi	a6,a6,1572 # 11908 <__DATA_BEGIN__>
   102ec:	00883683          	ld	a3,8(a6)
   102f0:	01053783          	ld	a5,16(a0)
   102f4:	00c0006f          	jal	zero,10300 <towers_clear+0x24>
   102f8:	00060793          	addi	a5,a2,0
   102fc:	00058693          	addi	a3,a1,0
   10300:	0087b603          	ld	a2,8(a5)
   10304:	fff7071b          	addiw	a4,a4,-1
   10308:	00d7b423          	sd	a3,8(a5)
   1030c:	00078593          	addi	a1,a5,0
   10310:	fe0714e3          	bne	a4,zero,102f8 <towers_clear+0x1c>
   10314:	00c53823          	sd	a2,16(a0)
   10318:	00d7b423          	sd	a3,8(a5)
   1031c:	00f83423          	sd	a5,8(a6)
   10320:	00052423          	sw	zero,8(a0)
   10324:	01852703          	lw	a4,24(a0)
   10328:	04e05263          	bge	zero,a4,1036c <towers_clear+0x90>
   1032c:	00001817          	auipc	a6,0x1
   10330:	5dc80813          	addi	a6,a6,1500 # 11908 <__DATA_BEGIN__>
   10334:	00883683          	ld	a3,8(a6)
   10338:	02053783          	ld	a5,32(a0)
   1033c:	00c0006f          	jal	zero,10348 <towers_clear+0x6c>
   10340:	00060793          	addi	a5,a2,0
   10344:	00058693          	addi	a3,a1,0
   10348:	0087b603          	ld	a2,8(a5)
   1034c:	fff7071b          	addiw	a4,a4,-1
   10350:	00d7b423          	sd	a3,8(a5)
   10354:	00078593          	addi	a1,a5,0
   10358:	fe0714e3          	bne	a4,zero,10340 <towers_clear+0x64>
   1035c:	02c53023          	sd	a2,32(a0)
   10360:	00d7b423          	sd	a3,8(a5)
   10364:	00f83423          	sd	a5,8(a6)
   10368:	00052c23          	sw	zero,24(a0)
   1036c:	02852703          	lw	a4,40(a0)
   10370:	02e05a63          	bge	zero,a4,103a4 <towers_clear+0xc8>
   10374:	00001817          	auipc	a6,0x1
   10378:	59480813          	addi	a6,a6,1428 # 11908 <__DATA_BEGIN__>
   1037c:	00883683          	ld	a3,8(a6)
   10380:	03053783          	ld	a5,48(a0)
   10384:	0080006f          	jal	zero,1038c <towers_clear+0xb0>
   10388:	00060793          	addi	a5,a2,0
   1038c:	0087b603          	ld	a2,8(a5)
   10390:	fff7071b          	addiw	a4,a4,-1
   10394:	00d7b423          	sd	a3,8(a5)
   10398:	00078693          	addi	a3,a5,0
   1039c:	fe0716e3          	bne	a4,zero,10388 <towers_clear+0xac>
   103a0:	00f83423          	sd	a5,8(a6)
   103a4:	00052583          	lw	a1,0(a0)
   103a8:	00052223          	sw	zero,4(a0)
   103ac:	00052423          	sw	zero,8(a0)
   103b0:	00053823          	sd	zero,16(a0)
   103b4:	00052c23          	sw	zero,24(a0)
   103b8:	02053023          	sd	zero,32(a0)
   103bc:	02052423          	sw	zero,40(a0)
   103c0:	02053823          	sd	zero,48(a0)
   103c4:	04b05863          	bge	zero,a1,10414 <towers_clear+0x138>
   103c8:	00001817          	auipc	a6,0x1
   103cc:	54080813          	addi	a6,a6,1344 # 11908 <__DATA_BEGIN__>
   103d0:	00883783          	ld	a5,8(a6)
   103d4:	00058713          	addi	a4,a1,0
   103d8:	00000693          	addi	a3,zero,0
   103dc:	00c0006f          	jal	zero,103e8 <towers_clear+0x10c>
   103e0:	00078693          	addi	a3,a5,0
   103e4:	00060793          	addi	a5,a2,0
   103e8:	0087b603          	ld	a2,8(a5)
   103ec:	00e7a023          	sw	a4,0(a5)
   103f0:	00d7b423          	sd	a3,8(a5)
   103f4:	fff7071b          	addiw	a4,a4,-1
   103f8:	fe0714e3          	bne	a4,zero,103e0 <towers_clear+0x104>
   103fc:	00c83423          	sd	a2,8(a6)
   10400:	00d7b423          	sd	a3,8(a5)
   10404:	00f53823          	sd	a5,16(a0)
   10408:	00100713          	addi	a4,zero,1
   1040c:	00e7a023          	sw	a4,0(a5)
   10410:	00b52423          	sw	a1,8(a0)
   10414:	00008067          	jalr	zero,0(ra)

0000000000010418 <towers_solve_h>:
   10418:	f5010113          	addi	sp,sp,-176
   1041c:	08913c23          	sd	s1,152(sp)
   10420:	09313423          	sd	s3,136(sp)
   10424:	09413023          	sd	s4,128(sp)
   10428:	0a113423          	sd	ra,168(sp)
   1042c:	02b13423          	sd	a1,40(sp)
   10430:	00100993          	addi	s3,zero,1
   10434:	02c13823          	sd	a2,48(sp)
   10438:	02d13023          	sd	a3,32(sp)
   1043c:	02e13c23          	sd	a4,56(sp)
   10440:	00050493          	addi	s1,a0,0
   10444:	00001a17          	auipc	s4,0x1
   10448:	4c4a0a13          	addi	s4,s4,1220 # 11908 <__DATA_BEGIN__>
   1044c:	41358c63          	beq	a1,s3,10864 <towers_solve_h+0x44c>
   10450:	0a813023          	sd	s0,160(sp)
   10454:	09213823          	sd	s2,144(sp)
   10458:	07513c23          	sd	s5,120(sp)
   1045c:	07613823          	sd	s6,112(sp)
   10460:	07713423          	sd	s7,104(sp)
   10464:	07813023          	sd	s8,96(sp)
   10468:	05913c23          	sd	s9,88(sp)
   1046c:	05a13823          	sd	s10,80(sp)
   10470:	05b13423          	sd	s11,72(sp)
   10474:	02813783          	ld	a5,40(sp)
   10478:	fff7879b          	addiw	a5,a5,-1
   1047c:	02f13423          	sd	a5,40(sp)
   10480:	2b378463          	beq	a5,s3,10728 <towers_solve_h+0x310>
   10484:	03013783          	ld	a5,48(sp)
   10488:	03813b83          	ld	s7,56(sp)
   1048c:	00f13c23          	sd	a5,24(sp)
   10490:	02813783          	ld	a5,40(sp)
   10494:	00f13823          	sd	a5,16(sp)
   10498:	01013783          	ld	a5,16(sp)
   1049c:	fff7879b          	addiw	a5,a5,-1
   104a0:	00f13823          	sd	a5,16(sp)
   104a4:	1d378c63          	beq	a5,s3,1067c <towers_solve_h+0x264>
   104a8:	01013783          	ld	a5,16(sp)
   104ac:	02013d83          	ld	s11,32(sp)
   104b0:	01813b03          	ld	s6,24(sp)
   104b4:	00f13423          	sd	a5,8(sp)
   104b8:	00813783          	ld	a5,8(sp)
   104bc:	fff7879b          	addiw	a5,a5,-1
   104c0:	00f13423          	sd	a5,8(sp)
   104c4:	11378863          	beq	a5,s3,105d4 <towers_solve_h+0x1bc>
   104c8:	00813a83          	ld	s5,8(sp)
   104cc:	000b8413          	addi	s0,s7,0
   104d0:	000b0913          	addi	s2,s6,0
   104d4:	fffa8a9b          	addiw	s5,s5,-1
   104d8:	053a8c63          	beq	s5,s3,10530 <towers_solve_h+0x118>
   104dc:	000d8c13          	addi	s8,s11,0
   104e0:	00090d13          	addi	s10,s2,0
   104e4:	000a8c93          	addi	s9,s5,0
   104e8:	fffc8c9b          	addiw	s9,s9,-1
   104ec:	000c8593          	addi	a1,s9,0
   104f0:	000c0713          	addi	a4,s8,0
   104f4:	00040693          	addi	a3,s0,0
   104f8:	000d0613          	addi	a2,s10,0
   104fc:	00048513          	addi	a0,s1,0
   10500:	f19ff0ef          	jal	ra,10418 <towers_solve_h>
   10504:	00040713          	addi	a4,s0,0
   10508:	000c0693          	addi	a3,s8,0
   1050c:	000d0613          	addi	a2,s10,0
   10510:	00048513          	addi	a0,s1,0
   10514:	00100593          	addi	a1,zero,1
   10518:	f01ff0ef          	jal	ra,10418 <towers_solve_h>
   1051c:	000d0713          	addi	a4,s10,0
   10520:	013c8a63          	beq	s9,s3,10534 <towers_solve_h+0x11c>
   10524:	000c0d13          	addi	s10,s8,0
   10528:	00070c13          	addi	s8,a4,0
   1052c:	fbdff06f          	jal	zero,104e8 <towers_solve_h+0xd0>
   10530:	00090c13          	addi	s8,s2,0
   10534:	008c3703          	ld	a4,8(s8)
   10538:	000c2603          	lw	a2,0(s8)
   1053c:	0044a683          	lw	a3,4(s1)
   10540:	00873503          	ld	a0,8(a4)
   10544:	00072583          	lw	a1,0(a4)
   10548:	fff6061b          	addiw	a2,a2,-1
   1054c:	00ac3423          	sd	a0,8(s8)
   10550:	008a3503          	ld	a0,8(s4)
   10554:	00cc2023          	sw	a2,0(s8)
   10558:	00042603          	lw	a2,0(s0)
   1055c:	00aa3423          	sd	a0,8(s4)
   10560:	00843783          	ld	a5,8(s0)
   10564:	0016061b          	addiw	a2,a2,1
   10568:	0026869b          	addiw	a3,a3,2
   1056c:	00f73423          	sd	a5,8(a4)
   10570:	00e43423          	sd	a4,8(s0)
   10574:	00893783          	ld	a5,8(s2)
   10578:	00b72023          	sw	a1,0(a4)
   1057c:	00c42023          	sw	a2,0(s0)
   10580:	0087b583          	ld	a1,8(a5)
   10584:	00092703          	lw	a4,0(s2)
   10588:	0007a603          	lw	a2,0(a5)
   1058c:	00b93423          	sd	a1,8(s2)
   10590:	008a3583          	ld	a1,8(s4)
   10594:	fff7071b          	addiw	a4,a4,-1
   10598:	00e92023          	sw	a4,0(s2)
   1059c:	00ba3423          	sd	a1,8(s4)
   105a0:	008db583          	ld	a1,8(s11)
   105a4:	000da703          	lw	a4,0(s11)
   105a8:	00b7b423          	sd	a1,8(a5)
   105ac:	00fdb423          	sd	a5,8(s11)
   105b0:	00c7a023          	sw	a2,0(a5)
   105b4:	0017079b          	addiw	a5,a4,1
   105b8:	00fda023          	sw	a5,0(s11)
   105bc:	00d4a223          	sw	a3,4(s1)
   105c0:	013a8e63          	beq	s5,s3,105dc <towers_solve_h+0x1c4>
   105c4:	00090793          	addi	a5,s2,0
   105c8:	00040913          	addi	s2,s0,0
   105cc:	00078413          	addi	s0,a5,0
   105d0:	f05ff06f          	jal	zero,104d4 <towers_solve_h+0xbc>
   105d4:	0044a683          	lw	a3,4(s1)
   105d8:	000b0413          	addi	s0,s6,0
   105dc:	00843703          	ld	a4,8(s0)
   105e0:	00042783          	lw	a5,0(s0)
   105e4:	0026869b          	addiw	a3,a3,2
   105e8:	00873603          	ld	a2,8(a4)
   105ec:	00072583          	lw	a1,0(a4)
   105f0:	fff7879b          	addiw	a5,a5,-1
   105f4:	00c43423          	sd	a2,8(s0)
   105f8:	008a3503          	ld	a0,8(s4)
   105fc:	00f42023          	sw	a5,0(s0)
   10600:	000da603          	lw	a2,0(s11)
   10604:	00aa3423          	sd	a0,8(s4)
   10608:	008db783          	ld	a5,8(s11)
   1060c:	0016061b          	addiw	a2,a2,1
   10610:	00f73423          	sd	a5,8(a4)
   10614:	00edb423          	sd	a4,8(s11)
   10618:	008b3783          	ld	a5,8(s6)
   1061c:	00b72023          	sw	a1,0(a4)
   10620:	00cda023          	sw	a2,0(s11)
   10624:	0087b583          	ld	a1,8(a5)
   10628:	000b2703          	lw	a4,0(s6)
   1062c:	0007a603          	lw	a2,0(a5)
   10630:	00bb3423          	sd	a1,8(s6)
   10634:	008a3583          	ld	a1,8(s4)
   10638:	fff7071b          	addiw	a4,a4,-1
   1063c:	00eb2023          	sw	a4,0(s6)
   10640:	00ba3423          	sd	a1,8(s4)
   10644:	008bb583          	ld	a1,8(s7)
   10648:	000ba703          	lw	a4,0(s7)
   1064c:	00b7b423          	sd	a1,8(a5)
   10650:	00fbb423          	sd	a5,8(s7)
   10654:	00c7a023          	sw	a2,0(a5)
   10658:	0017079b          	addiw	a5,a4,1
   1065c:	00fba023          	sw	a5,0(s7)
   10660:	00813783          	ld	a5,8(sp)
   10664:	00d4a223          	sw	a3,4(s1)
   10668:	01378e63          	beq	a5,s3,10684 <towers_solve_h+0x26c>
   1066c:	000b0793          	addi	a5,s6,0
   10670:	000d8b13          	addi	s6,s11,0
   10674:	00078d93          	addi	s11,a5,0
   10678:	e41ff06f          	jal	zero,104b8 <towers_solve_h+0xa0>
   1067c:	0044a683          	lw	a3,4(s1)
   10680:	01813d83          	ld	s11,24(sp)
   10684:	008db703          	ld	a4,8(s11)
   10688:	000da783          	lw	a5,0(s11)
   1068c:	02013803          	ld	a6,32(sp)
   10690:	00873603          	ld	a2,8(a4)
   10694:	00072583          	lw	a1,0(a4)
   10698:	fff7879b          	addiw	a5,a5,-1
   1069c:	00cdb423          	sd	a2,8(s11)
   106a0:	008a3503          	ld	a0,8(s4)
   106a4:	00fda023          	sw	a5,0(s11)
   106a8:	000ba603          	lw	a2,0(s7)
   106ac:	00aa3423          	sd	a0,8(s4)
   106b0:	008bb783          	ld	a5,8(s7)
   106b4:	01813503          	ld	a0,24(sp)
   106b8:	0016061b          	addiw	a2,a2,1
   106bc:	00f73423          	sd	a5,8(a4)
   106c0:	00ebb423          	sd	a4,8(s7)
   106c4:	00853783          	ld	a5,8(a0)
   106c8:	00b72023          	sw	a1,0(a4)
   106cc:	00cba023          	sw	a2,0(s7)
   106d0:	0087b583          	ld	a1,8(a5)
   106d4:	00052703          	lw	a4,0(a0)
   106d8:	0007a603          	lw	a2,0(a5)
   106dc:	00b53423          	sd	a1,8(a0)
   106e0:	008a3583          	ld	a1,8(s4)
   106e4:	fff7071b          	addiw	a4,a4,-1
   106e8:	00e52023          	sw	a4,0(a0)
   106ec:	00ba3423          	sd	a1,8(s4)
   106f0:	00883583          	ld	a1,8(a6)
   106f4:	00082703          	lw	a4,0(a6)
   106f8:	0026869b          	addiw	a3,a3,2
   106fc:	00b7b423          	sd	a1,8(a5)
   10700:	00f83423          	sd	a5,8(a6)
   10704:	00c7a023          	sw	a2,0(a5)
   10708:	0017079b          	addiw	a5,a4,1
   1070c:	00f82023          	sw	a5,0(a6)
   10710:	01013783          	ld	a5,16(sp)
   10714:	00d4a223          	sw	a3,4(s1)
   10718:	01378c63          	beq	a5,s3,10730 <towers_solve_h+0x318>
   1071c:	01713c23          	sd	s7,24(sp)
   10720:	00050b93          	addi	s7,a0,0
   10724:	d75ff06f          	jal	zero,10498 <towers_solve_h+0x80>
   10728:	0044a683          	lw	a3,4(s1)
   1072c:	03013b83          	ld	s7,48(sp)
   10730:	008bb703          	ld	a4,8(s7)
   10734:	000ba783          	lw	a5,0(s7)
   10738:	02013803          	ld	a6,32(sp)
   1073c:	00873603          	ld	a2,8(a4)
   10740:	00072583          	lw	a1,0(a4)
   10744:	fff7879b          	addiw	a5,a5,-1
   10748:	00cbb423          	sd	a2,8(s7)
   1074c:	008a3503          	ld	a0,8(s4)
   10750:	00fba023          	sw	a5,0(s7)
   10754:	00082603          	lw	a2,0(a6)
   10758:	00aa3423          	sd	a0,8(s4)
   1075c:	00883783          	ld	a5,8(a6)
   10760:	03013503          	ld	a0,48(sp)
   10764:	0016061b          	addiw	a2,a2,1
   10768:	00f73423          	sd	a5,8(a4)
   1076c:	00e83423          	sd	a4,8(a6)
   10770:	00853783          	ld	a5,8(a0)
   10774:	00b72023          	sw	a1,0(a4)
   10778:	00c82023          	sw	a2,0(a6)
   1077c:	0087b583          	ld	a1,8(a5)
   10780:	00052703          	lw	a4,0(a0)
   10784:	0007a603          	lw	a2,0(a5)
   10788:	00b53423          	sd	a1,8(a0)
   1078c:	008a3583          	ld	a1,8(s4)
   10790:	03813883          	ld	a7,56(sp)
   10794:	fff7071b          	addiw	a4,a4,-1
   10798:	00e52023          	sw	a4,0(a0)
   1079c:	00ba3423          	sd	a1,8(s4)
   107a0:	0088b583          	ld	a1,8(a7)
   107a4:	0008a703          	lw	a4,0(a7)
   107a8:	0026869b          	addiw	a3,a3,2
   107ac:	00b7b423          	sd	a1,8(a5)
   107b0:	00f8b423          	sd	a5,8(a7)
   107b4:	00c7a023          	sw	a2,0(a5)
   107b8:	0017079b          	addiw	a5,a4,1
   107bc:	00f8a023          	sw	a5,0(a7)
   107c0:	00d4a223          	sw	a3,4(s1)
   107c4:	02813783          	ld	a5,40(sp)
   107c8:	01378863          	beq	a5,s3,107d8 <towers_solve_h+0x3c0>
   107cc:	03013823          	sd	a6,48(sp)
   107d0:	02a13023          	sd	a0,32(sp)
   107d4:	ca1ff06f          	jal	zero,10474 <towers_solve_h+0x5c>
   107d8:	0a013403          	ld	s0,160(sp)
   107dc:	09013903          	ld	s2,144(sp)
   107e0:	07813a83          	ld	s5,120(sp)
   107e4:	07013b03          	ld	s6,112(sp)
   107e8:	06813b83          	ld	s7,104(sp)
   107ec:	06013c03          	ld	s8,96(sp)
   107f0:	05813c83          	ld	s9,88(sp)
   107f4:	05013d03          	ld	s10,80(sp)
   107f8:	04813d83          	ld	s11,72(sp)
   107fc:	02013503          	ld	a0,32(sp)
   10800:	0a813083          	ld	ra,168(sp)
   10804:	0016869b          	addiw	a3,a3,1
   10808:	00853783          	ld	a5,8(a0)
   1080c:	00052703          	lw	a4,0(a0)
   10810:	08813983          	ld	s3,136(sp)
   10814:	0087b583          	ld	a1,8(a5)
   10818:	0007a603          	lw	a2,0(a5)
   1081c:	fff7071b          	addiw	a4,a4,-1
   10820:	00b53423          	sd	a1,8(a0)
   10824:	008a3583          	ld	a1,8(s4)
   10828:	00e52023          	sw	a4,0(a0)
   1082c:	03813503          	ld	a0,56(sp)
   10830:	00052703          	lw	a4,0(a0)
   10834:	00ba3423          	sd	a1,8(s4)
   10838:	00853583          	ld	a1,8(a0)
   1083c:	0017071b          	addiw	a4,a4,1
   10840:	08013a03          	ld	s4,128(sp)
   10844:	00b7b423          	sd	a1,8(a5)
   10848:	00f53423          	sd	a5,8(a0)
   1084c:	00c7a023          	sw	a2,0(a5)
   10850:	00e52023          	sw	a4,0(a0)
   10854:	00d4a223          	sw	a3,4(s1)
   10858:	09813483          	ld	s1,152(sp)
   1085c:	0b010113          	addi	sp,sp,176
   10860:	00008067          	jalr	zero,0(ra)
   10864:	00452683          	lw	a3,4(a0)
   10868:	02c13023          	sd	a2,32(sp)
   1086c:	f91ff06f          	jal	zero,107fc <towers_solve_h+0x3e4>

0000000000010870 <towers_solve>:
   10870:	00052583          	lw	a1,0(a0)
   10874:	02850713          	addi	a4,a0,40
   10878:	01850693          	addi	a3,a0,24
   1087c:	00850613          	addi	a2,a0,8
   10880:	b99ff06f          	jal	zero,10418 <towers_solve_h>

0000000000010884 <towers_verify>:
   10884:	00852783          	lw	a5,8(a0)
   10888:	00050613          	addi	a2,a0,0
   1088c:	04079663          	bne	a5,zero,108d8 <towers_verify+0x54>
   10890:	01852503          	lw	a0,24(a0)
   10894:	06051663          	bne	a0,zero,10900 <towers_verify+0x7c>
   10898:	00062583          	lw	a1,0(a2)
   1089c:	02862783          	lw	a5,40(a2)
   108a0:	02b79863          	bne	a5,a1,108d0 <towers_verify+0x4c>
   108a4:	03063783          	ld	a5,48(a2)
   108a8:	02078c63          	beq	a5,zero,108e0 <towers_verify+0x5c>
   108ac:	00000713          	addi	a4,zero,0
   108b0:	00c0006f          	jal	zero,108bc <towers_verify+0x38>
   108b4:	0087b783          	ld	a5,8(a5)
   108b8:	02078463          	beq	a5,zero,108e0 <towers_verify+0x5c>
   108bc:	0007a683          	lw	a3,0(a5)
   108c0:	0017071b          	addiw	a4,a4,1
   108c4:	fee688e3          	beq	a3,a4,108b4 <towers_verify+0x30>
   108c8:	00500513          	addi	a0,zero,5
   108cc:	00008067          	jalr	zero,0(ra)
   108d0:	00400513          	addi	a0,zero,4
   108d4:	00008067          	jalr	zero,0(ra)
   108d8:	00200513          	addi	a0,zero,2
   108dc:	00008067          	jalr	zero,0(ra)
   108e0:	00100793          	addi	a5,zero,1
   108e4:	00462703          	lw	a4,4(a2)
   108e8:	00b797bb          	sllw	a5,a5,a1
   108ec:	fff7879b          	addiw	a5,a5,-1
   108f0:	00f71463          	bne	a4,a5,108f8 <towers_verify+0x74>
   108f4:	00008067          	jalr	zero,0(ra)
   108f8:	00600513          	addi	a0,zero,6
   108fc:	00008067          	jalr	zero,0(ra)
   10900:	00300513          	addi	a0,zero,3
   10904:	00008067          	jalr	zero,0(ra)
