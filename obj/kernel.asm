
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
    80200000:	00004117          	auipc	sp,0x4
    80200004:	00010113          	mv	sp,sp
    80200008:	a009                	j	8020000a <kern_init>

000000008020000a <kern_init>:
    8020000a:	00004517          	auipc	a0,0x4
    8020000e:	ffe50513          	addi	a0,a0,-2 # 80204008 <ticks>
    80200012:	00004617          	auipc	a2,0x4
    80200016:	00660613          	addi	a2,a2,6 # 80204018 <end>
    8020001a:	1141                	addi	sp,sp,-16
    8020001c:	8e09                	sub	a2,a2,a0
    8020001e:	4581                	li	a1,0
    80200020:	e406                	sd	ra,8(sp)
    80200022:	558000ef          	jal	ra,8020057a <memset>
    80200026:	14c000ef          	jal	ra,80200172 <cons_init>
    8020002a:	00001597          	auipc	a1,0x1
    8020002e:	98658593          	addi	a1,a1,-1658 # 802009b0 <etext+0x2>
    80200032:	00001517          	auipc	a0,0x1
    80200036:	99e50513          	addi	a0,a0,-1634 # 802009d0 <etext+0x22>
    8020003a:	032000ef          	jal	ra,8020006c <cprintf>
    8020003e:	064000ef          	jal	ra,802000a2 <print_kerninfo>
    80200042:	140000ef          	jal	ra,80200182 <idt_init>
    80200046:	0ea000ef          	jal	ra,80200130 <clock_init>
    8020004a:	132000ef          	jal	ra,8020017c <intr_enable>
    8020004e:	9002                	ebreak
    80200050:	a001                	j	80200050 <kern_init+0x46>

0000000080200052 <cputch>:
    80200052:	1141                	addi	sp,sp,-16
    80200054:	e022                	sd	s0,0(sp)
    80200056:	e406                	sd	ra,8(sp)
    80200058:	842e                	mv	s0,a1
    8020005a:	11a000ef          	jal	ra,80200174 <cons_putc>
    8020005e:	401c                	lw	a5,0(s0)
    80200060:	60a2                	ld	ra,8(sp)
    80200062:	2785                	addiw	a5,a5,1
    80200064:	c01c                	sw	a5,0(s0)
    80200066:	6402                	ld	s0,0(sp)
    80200068:	0141                	addi	sp,sp,16
    8020006a:	8082                	ret

000000008020006c <cprintf>:
    8020006c:	711d                	addi	sp,sp,-96
    8020006e:	02810313          	addi	t1,sp,40 # 80204028 <end+0x10>
    80200072:	8e2a                	mv	t3,a0
    80200074:	f42e                	sd	a1,40(sp)
    80200076:	f832                	sd	a2,48(sp)
    80200078:	fc36                	sd	a3,56(sp)
    8020007a:	00000517          	auipc	a0,0x0
    8020007e:	fd850513          	addi	a0,a0,-40 # 80200052 <cputch>
    80200082:	004c                	addi	a1,sp,4
    80200084:	869a                	mv	a3,t1
    80200086:	8672                	mv	a2,t3
    80200088:	ec06                	sd	ra,24(sp)
    8020008a:	e0ba                	sd	a4,64(sp)
    8020008c:	e4be                	sd	a5,72(sp)
    8020008e:	e8c2                	sd	a6,80(sp)
    80200090:	ecc6                	sd	a7,88(sp)
    80200092:	e41a                	sd	t1,8(sp)
    80200094:	c202                	sw	zero,4(sp)
    80200096:	562000ef          	jal	ra,802005f8 <vprintfmt>
    8020009a:	60e2                	ld	ra,24(sp)
    8020009c:	4512                	lw	a0,4(sp)
    8020009e:	6125                	addi	sp,sp,96
    802000a0:	8082                	ret

00000000802000a2 <print_kerninfo>:
    802000a2:	1141                	addi	sp,sp,-16
    802000a4:	00001517          	auipc	a0,0x1
    802000a8:	93450513          	addi	a0,a0,-1740 # 802009d8 <etext+0x2a>
    802000ac:	e406                	sd	ra,8(sp)
    802000ae:	fbfff0ef          	jal	ra,8020006c <cprintf>
    802000b2:	00000597          	auipc	a1,0x0
    802000b6:	f5858593          	addi	a1,a1,-168 # 8020000a <kern_init>
    802000ba:	00001517          	auipc	a0,0x1
    802000be:	93e50513          	addi	a0,a0,-1730 # 802009f8 <etext+0x4a>
    802000c2:	fabff0ef          	jal	ra,8020006c <cprintf>
    802000c6:	00001597          	auipc	a1,0x1
    802000ca:	8e858593          	addi	a1,a1,-1816 # 802009ae <etext>
    802000ce:	00001517          	auipc	a0,0x1
    802000d2:	94a50513          	addi	a0,a0,-1718 # 80200a18 <etext+0x6a>
    802000d6:	f97ff0ef          	jal	ra,8020006c <cprintf>
    802000da:	00004597          	auipc	a1,0x4
    802000de:	f2e58593          	addi	a1,a1,-210 # 80204008 <ticks>
    802000e2:	00001517          	auipc	a0,0x1
    802000e6:	95650513          	addi	a0,a0,-1706 # 80200a38 <etext+0x8a>
    802000ea:	f83ff0ef          	jal	ra,8020006c <cprintf>
    802000ee:	00004597          	auipc	a1,0x4
    802000f2:	f2a58593          	addi	a1,a1,-214 # 80204018 <end>
    802000f6:	00001517          	auipc	a0,0x1
    802000fa:	96250513          	addi	a0,a0,-1694 # 80200a58 <etext+0xaa>
    802000fe:	f6fff0ef          	jal	ra,8020006c <cprintf>
    80200102:	00004597          	auipc	a1,0x4
    80200106:	31558593          	addi	a1,a1,789 # 80204417 <end+0x3ff>
    8020010a:	00000797          	auipc	a5,0x0
    8020010e:	f0078793          	addi	a5,a5,-256 # 8020000a <kern_init>
    80200112:	40f587b3          	sub	a5,a1,a5
    80200116:	43f7d593          	srai	a1,a5,0x3f
    8020011a:	60a2                	ld	ra,8(sp)
    8020011c:	3ff5f593          	andi	a1,a1,1023
    80200120:	95be                	add	a1,a1,a5
    80200122:	85a9                	srai	a1,a1,0xa
    80200124:	00001517          	auipc	a0,0x1
    80200128:	95450513          	addi	a0,a0,-1708 # 80200a78 <etext+0xca>
    8020012c:	0141                	addi	sp,sp,16
    8020012e:	bf3d                	j	8020006c <cprintf>

0000000080200130 <clock_init>:
    80200130:	1141                	addi	sp,sp,-16
    80200132:	e406                	sd	ra,8(sp)
    80200134:	02000793          	li	a5,32
    80200138:	1047a7f3          	csrrs	a5,sie,a5
    8020013c:	c0102573          	rdtime	a0
    80200140:	67e1                	lui	a5,0x18
    80200142:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0x801e7960>
    80200146:	953e                	add	a0,a0,a5
    80200148:	04d000ef          	jal	ra,80200994 <sbi_set_timer>
    8020014c:	60a2                	ld	ra,8(sp)
    8020014e:	00004797          	auipc	a5,0x4
    80200152:	ea07bd23          	sd	zero,-326(a5) # 80204008 <ticks>
    80200156:	00001517          	auipc	a0,0x1
    8020015a:	95250513          	addi	a0,a0,-1710 # 80200aa8 <etext+0xfa>
    8020015e:	0141                	addi	sp,sp,16
    80200160:	b731                	j	8020006c <cprintf>

0000000080200162 <clock_set_next_event>:
    80200162:	c0102573          	rdtime	a0
    80200166:	67e1                	lui	a5,0x18
    80200168:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0x801e7960>
    8020016c:	953e                	add	a0,a0,a5
    8020016e:	0270006f          	j	80200994 <sbi_set_timer>

0000000080200172 <cons_init>:
    80200172:	8082                	ret

0000000080200174 <cons_putc>:
    80200174:	0ff57513          	andi	a0,a0,255
    80200178:	0030006f          	j	8020097a <sbi_console_putchar>

000000008020017c <intr_enable>:
    8020017c:	100167f3          	csrrsi	a5,sstatus,2
    80200180:	8082                	ret

0000000080200182 <idt_init>:
    80200182:	14005073          	csrwi	sscratch,0
    80200186:	00000797          	auipc	a5,0x0
    8020018a:	32278793          	addi	a5,a5,802 # 802004a8 <__alltraps>
    8020018e:	10579073          	csrw	stvec,a5
    80200192:	8082                	ret

0000000080200194 <print_regs>:
    80200194:	610c                	ld	a1,0(a0)
    80200196:	1141                	addi	sp,sp,-16
    80200198:	e022                	sd	s0,0(sp)
    8020019a:	842a                	mv	s0,a0
    8020019c:	00001517          	auipc	a0,0x1
    802001a0:	92c50513          	addi	a0,a0,-1748 # 80200ac8 <etext+0x11a>
    802001a4:	e406                	sd	ra,8(sp)
    802001a6:	ec7ff0ef          	jal	ra,8020006c <cprintf>
    802001aa:	640c                	ld	a1,8(s0)
    802001ac:	00001517          	auipc	a0,0x1
    802001b0:	93450513          	addi	a0,a0,-1740 # 80200ae0 <etext+0x132>
    802001b4:	eb9ff0ef          	jal	ra,8020006c <cprintf>
    802001b8:	680c                	ld	a1,16(s0)
    802001ba:	00001517          	auipc	a0,0x1
    802001be:	93e50513          	addi	a0,a0,-1730 # 80200af8 <etext+0x14a>
    802001c2:	eabff0ef          	jal	ra,8020006c <cprintf>
    802001c6:	6c0c                	ld	a1,24(s0)
    802001c8:	00001517          	auipc	a0,0x1
    802001cc:	94850513          	addi	a0,a0,-1720 # 80200b10 <etext+0x162>
    802001d0:	e9dff0ef          	jal	ra,8020006c <cprintf>
    802001d4:	700c                	ld	a1,32(s0)
    802001d6:	00001517          	auipc	a0,0x1
    802001da:	95250513          	addi	a0,a0,-1710 # 80200b28 <etext+0x17a>
    802001de:	e8fff0ef          	jal	ra,8020006c <cprintf>
    802001e2:	740c                	ld	a1,40(s0)
    802001e4:	00001517          	auipc	a0,0x1
    802001e8:	95c50513          	addi	a0,a0,-1700 # 80200b40 <etext+0x192>
    802001ec:	e81ff0ef          	jal	ra,8020006c <cprintf>
    802001f0:	780c                	ld	a1,48(s0)
    802001f2:	00001517          	auipc	a0,0x1
    802001f6:	96650513          	addi	a0,a0,-1690 # 80200b58 <etext+0x1aa>
    802001fa:	e73ff0ef          	jal	ra,8020006c <cprintf>
    802001fe:	7c0c                	ld	a1,56(s0)
    80200200:	00001517          	auipc	a0,0x1
    80200204:	97050513          	addi	a0,a0,-1680 # 80200b70 <etext+0x1c2>
    80200208:	e65ff0ef          	jal	ra,8020006c <cprintf>
    8020020c:	602c                	ld	a1,64(s0)
    8020020e:	00001517          	auipc	a0,0x1
    80200212:	97a50513          	addi	a0,a0,-1670 # 80200b88 <etext+0x1da>
    80200216:	e57ff0ef          	jal	ra,8020006c <cprintf>
    8020021a:	642c                	ld	a1,72(s0)
    8020021c:	00001517          	auipc	a0,0x1
    80200220:	98450513          	addi	a0,a0,-1660 # 80200ba0 <etext+0x1f2>
    80200224:	e49ff0ef          	jal	ra,8020006c <cprintf>
    80200228:	682c                	ld	a1,80(s0)
    8020022a:	00001517          	auipc	a0,0x1
    8020022e:	98e50513          	addi	a0,a0,-1650 # 80200bb8 <etext+0x20a>
    80200232:	e3bff0ef          	jal	ra,8020006c <cprintf>
    80200236:	6c2c                	ld	a1,88(s0)
    80200238:	00001517          	auipc	a0,0x1
    8020023c:	99850513          	addi	a0,a0,-1640 # 80200bd0 <etext+0x222>
    80200240:	e2dff0ef          	jal	ra,8020006c <cprintf>
    80200244:	702c                	ld	a1,96(s0)
    80200246:	00001517          	auipc	a0,0x1
    8020024a:	9a250513          	addi	a0,a0,-1630 # 80200be8 <etext+0x23a>
    8020024e:	e1fff0ef          	jal	ra,8020006c <cprintf>
    80200252:	742c                	ld	a1,104(s0)
    80200254:	00001517          	auipc	a0,0x1
    80200258:	9ac50513          	addi	a0,a0,-1620 # 80200c00 <etext+0x252>
    8020025c:	e11ff0ef          	jal	ra,8020006c <cprintf>
    80200260:	782c                	ld	a1,112(s0)
    80200262:	00001517          	auipc	a0,0x1
    80200266:	9b650513          	addi	a0,a0,-1610 # 80200c18 <etext+0x26a>
    8020026a:	e03ff0ef          	jal	ra,8020006c <cprintf>
    8020026e:	7c2c                	ld	a1,120(s0)
    80200270:	00001517          	auipc	a0,0x1
    80200274:	9c050513          	addi	a0,a0,-1600 # 80200c30 <etext+0x282>
    80200278:	df5ff0ef          	jal	ra,8020006c <cprintf>
    8020027c:	604c                	ld	a1,128(s0)
    8020027e:	00001517          	auipc	a0,0x1
    80200282:	9ca50513          	addi	a0,a0,-1590 # 80200c48 <etext+0x29a>
    80200286:	de7ff0ef          	jal	ra,8020006c <cprintf>
    8020028a:	644c                	ld	a1,136(s0)
    8020028c:	00001517          	auipc	a0,0x1
    80200290:	9d450513          	addi	a0,a0,-1580 # 80200c60 <etext+0x2b2>
    80200294:	dd9ff0ef          	jal	ra,8020006c <cprintf>
    80200298:	684c                	ld	a1,144(s0)
    8020029a:	00001517          	auipc	a0,0x1
    8020029e:	9de50513          	addi	a0,a0,-1570 # 80200c78 <etext+0x2ca>
    802002a2:	dcbff0ef          	jal	ra,8020006c <cprintf>
    802002a6:	6c4c                	ld	a1,152(s0)
    802002a8:	00001517          	auipc	a0,0x1
    802002ac:	9e850513          	addi	a0,a0,-1560 # 80200c90 <etext+0x2e2>
    802002b0:	dbdff0ef          	jal	ra,8020006c <cprintf>
    802002b4:	704c                	ld	a1,160(s0)
    802002b6:	00001517          	auipc	a0,0x1
    802002ba:	9f250513          	addi	a0,a0,-1550 # 80200ca8 <etext+0x2fa>
    802002be:	dafff0ef          	jal	ra,8020006c <cprintf>
    802002c2:	744c                	ld	a1,168(s0)
    802002c4:	00001517          	auipc	a0,0x1
    802002c8:	9fc50513          	addi	a0,a0,-1540 # 80200cc0 <etext+0x312>
    802002cc:	da1ff0ef          	jal	ra,8020006c <cprintf>
    802002d0:	784c                	ld	a1,176(s0)
    802002d2:	00001517          	auipc	a0,0x1
    802002d6:	a0650513          	addi	a0,a0,-1530 # 80200cd8 <etext+0x32a>
    802002da:	d93ff0ef          	jal	ra,8020006c <cprintf>
    802002de:	7c4c                	ld	a1,184(s0)
    802002e0:	00001517          	auipc	a0,0x1
    802002e4:	a1050513          	addi	a0,a0,-1520 # 80200cf0 <etext+0x342>
    802002e8:	d85ff0ef          	jal	ra,8020006c <cprintf>
    802002ec:	606c                	ld	a1,192(s0)
    802002ee:	00001517          	auipc	a0,0x1
    802002f2:	a1a50513          	addi	a0,a0,-1510 # 80200d08 <etext+0x35a>
    802002f6:	d77ff0ef          	jal	ra,8020006c <cprintf>
    802002fa:	646c                	ld	a1,200(s0)
    802002fc:	00001517          	auipc	a0,0x1
    80200300:	a2450513          	addi	a0,a0,-1500 # 80200d20 <etext+0x372>
    80200304:	d69ff0ef          	jal	ra,8020006c <cprintf>
    80200308:	686c                	ld	a1,208(s0)
    8020030a:	00001517          	auipc	a0,0x1
    8020030e:	a2e50513          	addi	a0,a0,-1490 # 80200d38 <etext+0x38a>
    80200312:	d5bff0ef          	jal	ra,8020006c <cprintf>
    80200316:	6c6c                	ld	a1,216(s0)
    80200318:	00001517          	auipc	a0,0x1
    8020031c:	a3850513          	addi	a0,a0,-1480 # 80200d50 <etext+0x3a2>
    80200320:	d4dff0ef          	jal	ra,8020006c <cprintf>
    80200324:	706c                	ld	a1,224(s0)
    80200326:	00001517          	auipc	a0,0x1
    8020032a:	a4250513          	addi	a0,a0,-1470 # 80200d68 <etext+0x3ba>
    8020032e:	d3fff0ef          	jal	ra,8020006c <cprintf>
    80200332:	746c                	ld	a1,232(s0)
    80200334:	00001517          	auipc	a0,0x1
    80200338:	a4c50513          	addi	a0,a0,-1460 # 80200d80 <etext+0x3d2>
    8020033c:	d31ff0ef          	jal	ra,8020006c <cprintf>
    80200340:	786c                	ld	a1,240(s0)
    80200342:	00001517          	auipc	a0,0x1
    80200346:	a5650513          	addi	a0,a0,-1450 # 80200d98 <etext+0x3ea>
    8020034a:	d23ff0ef          	jal	ra,8020006c <cprintf>
    8020034e:	7c6c                	ld	a1,248(s0)
    80200350:	6402                	ld	s0,0(sp)
    80200352:	60a2                	ld	ra,8(sp)
    80200354:	00001517          	auipc	a0,0x1
    80200358:	a5c50513          	addi	a0,a0,-1444 # 80200db0 <etext+0x402>
    8020035c:	0141                	addi	sp,sp,16
    8020035e:	b339                	j	8020006c <cprintf>

0000000080200360 <print_trapframe>:
    80200360:	1141                	addi	sp,sp,-16
    80200362:	e022                	sd	s0,0(sp)
    80200364:	85aa                	mv	a1,a0
    80200366:	842a                	mv	s0,a0
    80200368:	00001517          	auipc	a0,0x1
    8020036c:	a6050513          	addi	a0,a0,-1440 # 80200dc8 <etext+0x41a>
    80200370:	e406                	sd	ra,8(sp)
    80200372:	cfbff0ef          	jal	ra,8020006c <cprintf>
    80200376:	8522                	mv	a0,s0
    80200378:	e1dff0ef          	jal	ra,80200194 <print_regs>
    8020037c:	10043583          	ld	a1,256(s0)
    80200380:	00001517          	auipc	a0,0x1
    80200384:	a6050513          	addi	a0,a0,-1440 # 80200de0 <etext+0x432>
    80200388:	ce5ff0ef          	jal	ra,8020006c <cprintf>
    8020038c:	10843583          	ld	a1,264(s0)
    80200390:	00001517          	auipc	a0,0x1
    80200394:	a6850513          	addi	a0,a0,-1432 # 80200df8 <etext+0x44a>
    80200398:	cd5ff0ef          	jal	ra,8020006c <cprintf>
    8020039c:	11043583          	ld	a1,272(s0)
    802003a0:	00001517          	auipc	a0,0x1
    802003a4:	a7050513          	addi	a0,a0,-1424 # 80200e10 <etext+0x462>
    802003a8:	cc5ff0ef          	jal	ra,8020006c <cprintf>
    802003ac:	11843583          	ld	a1,280(s0)
    802003b0:	6402                	ld	s0,0(sp)
    802003b2:	60a2                	ld	ra,8(sp)
    802003b4:	00001517          	auipc	a0,0x1
    802003b8:	a7450513          	addi	a0,a0,-1420 # 80200e28 <etext+0x47a>
    802003bc:	0141                	addi	sp,sp,16
    802003be:	b17d                	j	8020006c <cprintf>

00000000802003c0 <interrupt_handler>:
    802003c0:	11853783          	ld	a5,280(a0)
    802003c4:	472d                	li	a4,11
    802003c6:	0786                	slli	a5,a5,0x1
    802003c8:	8385                	srli	a5,a5,0x1
    802003ca:	06f76763          	bltu	a4,a5,80200438 <interrupt_handler+0x78>
    802003ce:	00001717          	auipc	a4,0x1
    802003d2:	b2270713          	addi	a4,a4,-1246 # 80200ef0 <etext+0x542>
    802003d6:	078a                	slli	a5,a5,0x2
    802003d8:	97ba                	add	a5,a5,a4
    802003da:	439c                	lw	a5,0(a5)
    802003dc:	97ba                	add	a5,a5,a4
    802003de:	8782                	jr	a5
    802003e0:	00001517          	auipc	a0,0x1
    802003e4:	ac050513          	addi	a0,a0,-1344 # 80200ea0 <etext+0x4f2>
    802003e8:	b151                	j	8020006c <cprintf>
    802003ea:	00001517          	auipc	a0,0x1
    802003ee:	a9650513          	addi	a0,a0,-1386 # 80200e80 <etext+0x4d2>
    802003f2:	b9ad                	j	8020006c <cprintf>
    802003f4:	00001517          	auipc	a0,0x1
    802003f8:	a4c50513          	addi	a0,a0,-1460 # 80200e40 <etext+0x492>
    802003fc:	b985                	j	8020006c <cprintf>
    802003fe:	00001517          	auipc	a0,0x1
    80200402:	a6250513          	addi	a0,a0,-1438 # 80200e60 <etext+0x4b2>
    80200406:	b19d                	j	8020006c <cprintf>
    80200408:	1141                	addi	sp,sp,-16
    8020040a:	e406                	sd	ra,8(sp)
    8020040c:	d57ff0ef          	jal	ra,80200162 <clock_set_next_event>
    80200410:	00004697          	auipc	a3,0x4
    80200414:	bf868693          	addi	a3,a3,-1032 # 80204008 <ticks>
    80200418:	629c                	ld	a5,0(a3)
    8020041a:	06400713          	li	a4,100
    8020041e:	0785                	addi	a5,a5,1
    80200420:	02e7f733          	remu	a4,a5,a4
    80200424:	e29c                	sd	a5,0(a3)
    80200426:	cb11                	beqz	a4,8020043a <interrupt_handler+0x7a>
    80200428:	60a2                	ld	ra,8(sp)
    8020042a:	0141                	addi	sp,sp,16
    8020042c:	8082                	ret
    8020042e:	00001517          	auipc	a0,0x1
    80200432:	aa250513          	addi	a0,a0,-1374 # 80200ed0 <etext+0x522>
    80200436:	b91d                	j	8020006c <cprintf>
    80200438:	b725                	j	80200360 <print_trapframe>
    8020043a:	60a2                	ld	ra,8(sp)
    8020043c:	06400593          	li	a1,100
    80200440:	00001517          	auipc	a0,0x1
    80200444:	a8050513          	addi	a0,a0,-1408 # 80200ec0 <etext+0x512>
    80200448:	0141                	addi	sp,sp,16
    8020044a:	b10d                	j	8020006c <cprintf>

000000008020044c <trap>:
    8020044c:	11853783          	ld	a5,280(a0)
    80200450:	0207ca63          	bltz	a5,80200484 <trap+0x38>
    80200454:	1141                	addi	sp,sp,-16
    80200456:	e022                	sd	s0,0(sp)
    80200458:	e406                	sd	ra,8(sp)
    8020045a:	470d                	li	a4,3
    8020045c:	842a                	mv	s0,a0
    8020045e:	02e78463          	beq	a5,a4,80200486 <trap+0x3a>
    80200462:	00f77a63          	bgeu	a4,a5,80200476 <trap+0x2a>
    80200466:	17f1                	addi	a5,a5,-4
    80200468:	471d                	li	a4,7
    8020046a:	00f76863          	bltu	a4,a5,8020047a <trap+0x2e>
    8020046e:	60a2                	ld	ra,8(sp)
    80200470:	6402                	ld	s0,0(sp)
    80200472:	0141                	addi	sp,sp,16
    80200474:	8082                	ret
    80200476:	fee79ce3          	bne	a5,a4,8020046e <trap+0x22>
    8020047a:	8522                	mv	a0,s0
    8020047c:	6402                	ld	s0,0(sp)
    8020047e:	60a2                	ld	ra,8(sp)
    80200480:	0141                	addi	sp,sp,16
    80200482:	bdf9                	j	80200360 <print_trapframe>
    80200484:	bf35                	j	802003c0 <interrupt_handler>
    80200486:	10853583          	ld	a1,264(a0)
    8020048a:	00001517          	auipc	a0,0x1
    8020048e:	a9650513          	addi	a0,a0,-1386 # 80200f20 <etext+0x572>
    80200492:	bdbff0ef          	jal	ra,8020006c <cprintf>
    80200496:	10843783          	ld	a5,264(s0)
    8020049a:	60a2                	ld	ra,8(sp)
    8020049c:	0789                	addi	a5,a5,2
    8020049e:	10f43423          	sd	a5,264(s0)
    802004a2:	6402                	ld	s0,0(sp)
    802004a4:	0141                	addi	sp,sp,16
    802004a6:	8082                	ret

00000000802004a8 <__alltraps>:
    802004a8:	14011073          	csrw	sscratch,sp
    802004ac:	712d                	addi	sp,sp,-288
    802004ae:	e002                	sd	zero,0(sp)
    802004b0:	e406                	sd	ra,8(sp)
    802004b2:	ec0e                	sd	gp,24(sp)
    802004b4:	f012                	sd	tp,32(sp)
    802004b6:	f416                	sd	t0,40(sp)
    802004b8:	f81a                	sd	t1,48(sp)
    802004ba:	fc1e                	sd	t2,56(sp)
    802004bc:	e0a2                	sd	s0,64(sp)
    802004be:	e4a6                	sd	s1,72(sp)
    802004c0:	e8aa                	sd	a0,80(sp)
    802004c2:	ecae                	sd	a1,88(sp)
    802004c4:	f0b2                	sd	a2,96(sp)
    802004c6:	f4b6                	sd	a3,104(sp)
    802004c8:	f8ba                	sd	a4,112(sp)
    802004ca:	fcbe                	sd	a5,120(sp)
    802004cc:	e142                	sd	a6,128(sp)
    802004ce:	e546                	sd	a7,136(sp)
    802004d0:	e94a                	sd	s2,144(sp)
    802004d2:	ed4e                	sd	s3,152(sp)
    802004d4:	f152                	sd	s4,160(sp)
    802004d6:	f556                	sd	s5,168(sp)
    802004d8:	f95a                	sd	s6,176(sp)
    802004da:	fd5e                	sd	s7,184(sp)
    802004dc:	e1e2                	sd	s8,192(sp)
    802004de:	e5e6                	sd	s9,200(sp)
    802004e0:	e9ea                	sd	s10,208(sp)
    802004e2:	edee                	sd	s11,216(sp)
    802004e4:	f1f2                	sd	t3,224(sp)
    802004e6:	f5f6                	sd	t4,232(sp)
    802004e8:	f9fa                	sd	t5,240(sp)
    802004ea:	fdfe                	sd	t6,248(sp)
    802004ec:	14001473          	csrrw	s0,sscratch,zero
    802004f0:	100024f3          	csrr	s1,sstatus
    802004f4:	14102973          	csrr	s2,sepc
    802004f8:	143029f3          	csrr	s3,stval
    802004fc:	14202a73          	csrr	s4,scause
    80200500:	e822                	sd	s0,16(sp)
    80200502:	e226                	sd	s1,256(sp)
    80200504:	e64a                	sd	s2,264(sp)
    80200506:	ea4e                	sd	s3,272(sp)
    80200508:	ee52                	sd	s4,280(sp)
    8020050a:	850a                	mv	a0,sp
    8020050c:	f41ff0ef          	jal	ra,8020044c <trap>

0000000080200510 <__trapret>:
    80200510:	6492                	ld	s1,256(sp)
    80200512:	6932                	ld	s2,264(sp)
    80200514:	10049073          	csrw	sstatus,s1
    80200518:	14191073          	csrw	sepc,s2
    8020051c:	60a2                	ld	ra,8(sp)
    8020051e:	61e2                	ld	gp,24(sp)
    80200520:	7202                	ld	tp,32(sp)
    80200522:	72a2                	ld	t0,40(sp)
    80200524:	7342                	ld	t1,48(sp)
    80200526:	73e2                	ld	t2,56(sp)
    80200528:	6406                	ld	s0,64(sp)
    8020052a:	64a6                	ld	s1,72(sp)
    8020052c:	6546                	ld	a0,80(sp)
    8020052e:	65e6                	ld	a1,88(sp)
    80200530:	7606                	ld	a2,96(sp)
    80200532:	76a6                	ld	a3,104(sp)
    80200534:	7746                	ld	a4,112(sp)
    80200536:	77e6                	ld	a5,120(sp)
    80200538:	680a                	ld	a6,128(sp)
    8020053a:	68aa                	ld	a7,136(sp)
    8020053c:	694a                	ld	s2,144(sp)
    8020053e:	69ea                	ld	s3,152(sp)
    80200540:	7a0a                	ld	s4,160(sp)
    80200542:	7aaa                	ld	s5,168(sp)
    80200544:	7b4a                	ld	s6,176(sp)
    80200546:	7bea                	ld	s7,184(sp)
    80200548:	6c0e                	ld	s8,192(sp)
    8020054a:	6cae                	ld	s9,200(sp)
    8020054c:	6d4e                	ld	s10,208(sp)
    8020054e:	6dee                	ld	s11,216(sp)
    80200550:	7e0e                	ld	t3,224(sp)
    80200552:	7eae                	ld	t4,232(sp)
    80200554:	7f4e                	ld	t5,240(sp)
    80200556:	7fee                	ld	t6,248(sp)
    80200558:	6142                	ld	sp,16(sp)
    8020055a:	10200073          	sret

000000008020055e <strnlen>:
    8020055e:	4781                	li	a5,0
    80200560:	e589                	bnez	a1,8020056a <strnlen+0xc>
    80200562:	a811                	j	80200576 <strnlen+0x18>
    80200564:	0785                	addi	a5,a5,1
    80200566:	00f58863          	beq	a1,a5,80200576 <strnlen+0x18>
    8020056a:	00f50733          	add	a4,a0,a5
    8020056e:	00074703          	lbu	a4,0(a4)
    80200572:	fb6d                	bnez	a4,80200564 <strnlen+0x6>
    80200574:	85be                	mv	a1,a5
    80200576:	852e                	mv	a0,a1
    80200578:	8082                	ret

000000008020057a <memset>:
    8020057a:	ca01                	beqz	a2,8020058a <memset+0x10>
    8020057c:	962a                	add	a2,a2,a0
    8020057e:	87aa                	mv	a5,a0
    80200580:	0785                	addi	a5,a5,1
    80200582:	feb78fa3          	sb	a1,-1(a5)
    80200586:	fec79de3          	bne	a5,a2,80200580 <memset+0x6>
    8020058a:	8082                	ret

000000008020058c <printnum>:
    8020058c:	02069813          	slli	a6,a3,0x20
    80200590:	7179                	addi	sp,sp,-48
    80200592:	02085813          	srli	a6,a6,0x20
    80200596:	e052                	sd	s4,0(sp)
    80200598:	03067a33          	remu	s4,a2,a6
    8020059c:	f022                	sd	s0,32(sp)
    8020059e:	ec26                	sd	s1,24(sp)
    802005a0:	e84a                	sd	s2,16(sp)
    802005a2:	f406                	sd	ra,40(sp)
    802005a4:	e44e                	sd	s3,8(sp)
    802005a6:	84aa                	mv	s1,a0
    802005a8:	892e                	mv	s2,a1
    802005aa:	fff7041b          	addiw	s0,a4,-1
    802005ae:	2a01                	sext.w	s4,s4
    802005b0:	03067e63          	bgeu	a2,a6,802005ec <printnum+0x60>
    802005b4:	89be                	mv	s3,a5
    802005b6:	00805763          	blez	s0,802005c4 <printnum+0x38>
    802005ba:	347d                	addiw	s0,s0,-1
    802005bc:	85ca                	mv	a1,s2
    802005be:	854e                	mv	a0,s3
    802005c0:	9482                	jalr	s1
    802005c2:	fc65                	bnez	s0,802005ba <printnum+0x2e>
    802005c4:	1a02                	slli	s4,s4,0x20
    802005c6:	00001797          	auipc	a5,0x1
    802005ca:	97a78793          	addi	a5,a5,-1670 # 80200f40 <etext+0x592>
    802005ce:	020a5a13          	srli	s4,s4,0x20
    802005d2:	9a3e                	add	s4,s4,a5
    802005d4:	7402                	ld	s0,32(sp)
    802005d6:	000a4503          	lbu	a0,0(s4)
    802005da:	70a2                	ld	ra,40(sp)
    802005dc:	69a2                	ld	s3,8(sp)
    802005de:	6a02                	ld	s4,0(sp)
    802005e0:	85ca                	mv	a1,s2
    802005e2:	87a6                	mv	a5,s1
    802005e4:	6942                	ld	s2,16(sp)
    802005e6:	64e2                	ld	s1,24(sp)
    802005e8:	6145                	addi	sp,sp,48
    802005ea:	8782                	jr	a5
    802005ec:	03065633          	divu	a2,a2,a6
    802005f0:	8722                	mv	a4,s0
    802005f2:	f9bff0ef          	jal	ra,8020058c <printnum>
    802005f6:	b7f9                	j	802005c4 <printnum+0x38>

00000000802005f8 <vprintfmt>:
    802005f8:	7119                	addi	sp,sp,-128
    802005fa:	f4a6                	sd	s1,104(sp)
    802005fc:	f0ca                	sd	s2,96(sp)
    802005fe:	ecce                	sd	s3,88(sp)
    80200600:	e8d2                	sd	s4,80(sp)
    80200602:	e4d6                	sd	s5,72(sp)
    80200604:	e0da                	sd	s6,64(sp)
    80200606:	fc5e                	sd	s7,56(sp)
    80200608:	f06a                	sd	s10,32(sp)
    8020060a:	fc86                	sd	ra,120(sp)
    8020060c:	f8a2                	sd	s0,112(sp)
    8020060e:	f862                	sd	s8,48(sp)
    80200610:	f466                	sd	s9,40(sp)
    80200612:	ec6e                	sd	s11,24(sp)
    80200614:	892a                	mv	s2,a0
    80200616:	84ae                	mv	s1,a1
    80200618:	8d32                	mv	s10,a2
    8020061a:	8a36                	mv	s4,a3
    8020061c:	02500993          	li	s3,37
    80200620:	5b7d                	li	s6,-1
    80200622:	00001a97          	auipc	s5,0x1
    80200626:	952a8a93          	addi	s5,s5,-1710 # 80200f74 <etext+0x5c6>
    8020062a:	00001b97          	auipc	s7,0x1
    8020062e:	b26b8b93          	addi	s7,s7,-1242 # 80201150 <error_string>
    80200632:	000d4503          	lbu	a0,0(s10)
    80200636:	001d0413          	addi	s0,s10,1
    8020063a:	01350a63          	beq	a0,s3,8020064e <vprintfmt+0x56>
    8020063e:	c121                	beqz	a0,8020067e <vprintfmt+0x86>
    80200640:	85a6                	mv	a1,s1
    80200642:	0405                	addi	s0,s0,1
    80200644:	9902                	jalr	s2
    80200646:	fff44503          	lbu	a0,-1(s0)
    8020064a:	ff351ae3          	bne	a0,s3,8020063e <vprintfmt+0x46>
    8020064e:	00044603          	lbu	a2,0(s0)
    80200652:	02000793          	li	a5,32
    80200656:	4c81                	li	s9,0
    80200658:	4881                	li	a7,0
    8020065a:	5c7d                	li	s8,-1
    8020065c:	5dfd                	li	s11,-1
    8020065e:	05500513          	li	a0,85
    80200662:	4825                	li	a6,9
    80200664:	fdd6059b          	addiw	a1,a2,-35
    80200668:	0ff5f593          	andi	a1,a1,255
    8020066c:	00140d13          	addi	s10,s0,1
    80200670:	04b56263          	bltu	a0,a1,802006b4 <vprintfmt+0xbc>
    80200674:	058a                	slli	a1,a1,0x2
    80200676:	95d6                	add	a1,a1,s5
    80200678:	4194                	lw	a3,0(a1)
    8020067a:	96d6                	add	a3,a3,s5
    8020067c:	8682                	jr	a3
    8020067e:	70e6                	ld	ra,120(sp)
    80200680:	7446                	ld	s0,112(sp)
    80200682:	74a6                	ld	s1,104(sp)
    80200684:	7906                	ld	s2,96(sp)
    80200686:	69e6                	ld	s3,88(sp)
    80200688:	6a46                	ld	s4,80(sp)
    8020068a:	6aa6                	ld	s5,72(sp)
    8020068c:	6b06                	ld	s6,64(sp)
    8020068e:	7be2                	ld	s7,56(sp)
    80200690:	7c42                	ld	s8,48(sp)
    80200692:	7ca2                	ld	s9,40(sp)
    80200694:	7d02                	ld	s10,32(sp)
    80200696:	6de2                	ld	s11,24(sp)
    80200698:	6109                	addi	sp,sp,128
    8020069a:	8082                	ret
    8020069c:	87b2                	mv	a5,a2
    8020069e:	00144603          	lbu	a2,1(s0)
    802006a2:	846a                	mv	s0,s10
    802006a4:	00140d13          	addi	s10,s0,1
    802006a8:	fdd6059b          	addiw	a1,a2,-35
    802006ac:	0ff5f593          	andi	a1,a1,255
    802006b0:	fcb572e3          	bgeu	a0,a1,80200674 <vprintfmt+0x7c>
    802006b4:	85a6                	mv	a1,s1
    802006b6:	02500513          	li	a0,37
    802006ba:	9902                	jalr	s2
    802006bc:	fff44783          	lbu	a5,-1(s0)
    802006c0:	8d22                	mv	s10,s0
    802006c2:	f73788e3          	beq	a5,s3,80200632 <vprintfmt+0x3a>
    802006c6:	ffed4783          	lbu	a5,-2(s10)
    802006ca:	1d7d                	addi	s10,s10,-1
    802006cc:	ff379de3          	bne	a5,s3,802006c6 <vprintfmt+0xce>
    802006d0:	b78d                	j	80200632 <vprintfmt+0x3a>
    802006d2:	fd060c1b          	addiw	s8,a2,-48
    802006d6:	00144603          	lbu	a2,1(s0)
    802006da:	846a                	mv	s0,s10
    802006dc:	fd06069b          	addiw	a3,a2,-48
    802006e0:	0006059b          	sext.w	a1,a2
    802006e4:	02d86463          	bltu	a6,a3,8020070c <vprintfmt+0x114>
    802006e8:	00144603          	lbu	a2,1(s0)
    802006ec:	002c169b          	slliw	a3,s8,0x2
    802006f0:	0186873b          	addw	a4,a3,s8
    802006f4:	0017171b          	slliw	a4,a4,0x1
    802006f8:	9f2d                	addw	a4,a4,a1
    802006fa:	fd06069b          	addiw	a3,a2,-48
    802006fe:	0405                	addi	s0,s0,1
    80200700:	fd070c1b          	addiw	s8,a4,-48
    80200704:	0006059b          	sext.w	a1,a2
    80200708:	fed870e3          	bgeu	a6,a3,802006e8 <vprintfmt+0xf0>
    8020070c:	f40ddce3          	bgez	s11,80200664 <vprintfmt+0x6c>
    80200710:	8de2                	mv	s11,s8
    80200712:	5c7d                	li	s8,-1
    80200714:	bf81                	j	80200664 <vprintfmt+0x6c>
    80200716:	fffdc693          	not	a3,s11
    8020071a:	96fd                	srai	a3,a3,0x3f
    8020071c:	00ddfdb3          	and	s11,s11,a3
    80200720:	00144603          	lbu	a2,1(s0)
    80200724:	2d81                	sext.w	s11,s11
    80200726:	846a                	mv	s0,s10
    80200728:	bf35                	j	80200664 <vprintfmt+0x6c>
    8020072a:	000a2c03          	lw	s8,0(s4)
    8020072e:	00144603          	lbu	a2,1(s0)
    80200732:	0a21                	addi	s4,s4,8
    80200734:	846a                	mv	s0,s10
    80200736:	bfd9                	j	8020070c <vprintfmt+0x114>
    80200738:	4705                	li	a4,1
    8020073a:	008a0593          	addi	a1,s4,8
    8020073e:	01174463          	blt	a4,a7,80200746 <vprintfmt+0x14e>
    80200742:	1a088e63          	beqz	a7,802008fe <vprintfmt+0x306>
    80200746:	000a3603          	ld	a2,0(s4)
    8020074a:	46c1                	li	a3,16
    8020074c:	8a2e                	mv	s4,a1
    8020074e:	2781                	sext.w	a5,a5
    80200750:	876e                	mv	a4,s11
    80200752:	85a6                	mv	a1,s1
    80200754:	854a                	mv	a0,s2
    80200756:	e37ff0ef          	jal	ra,8020058c <printnum>
    8020075a:	bde1                	j	80200632 <vprintfmt+0x3a>
    8020075c:	000a2503          	lw	a0,0(s4)
    80200760:	85a6                	mv	a1,s1
    80200762:	0a21                	addi	s4,s4,8
    80200764:	9902                	jalr	s2
    80200766:	b5f1                	j	80200632 <vprintfmt+0x3a>
    80200768:	4705                	li	a4,1
    8020076a:	008a0593          	addi	a1,s4,8
    8020076e:	01174463          	blt	a4,a7,80200776 <vprintfmt+0x17e>
    80200772:	18088163          	beqz	a7,802008f4 <vprintfmt+0x2fc>
    80200776:	000a3603          	ld	a2,0(s4)
    8020077a:	46a9                	li	a3,10
    8020077c:	8a2e                	mv	s4,a1
    8020077e:	bfc1                	j	8020074e <vprintfmt+0x156>
    80200780:	00144603          	lbu	a2,1(s0)
    80200784:	4c85                	li	s9,1
    80200786:	846a                	mv	s0,s10
    80200788:	bdf1                	j	80200664 <vprintfmt+0x6c>
    8020078a:	85a6                	mv	a1,s1
    8020078c:	02500513          	li	a0,37
    80200790:	9902                	jalr	s2
    80200792:	b545                	j	80200632 <vprintfmt+0x3a>
    80200794:	00144603          	lbu	a2,1(s0)
    80200798:	2885                	addiw	a7,a7,1
    8020079a:	846a                	mv	s0,s10
    8020079c:	b5e1                	j	80200664 <vprintfmt+0x6c>
    8020079e:	4705                	li	a4,1
    802007a0:	008a0593          	addi	a1,s4,8
    802007a4:	01174463          	blt	a4,a7,802007ac <vprintfmt+0x1b4>
    802007a8:	14088163          	beqz	a7,802008ea <vprintfmt+0x2f2>
    802007ac:	000a3603          	ld	a2,0(s4)
    802007b0:	46a1                	li	a3,8
    802007b2:	8a2e                	mv	s4,a1
    802007b4:	bf69                	j	8020074e <vprintfmt+0x156>
    802007b6:	03000513          	li	a0,48
    802007ba:	85a6                	mv	a1,s1
    802007bc:	e03e                	sd	a5,0(sp)
    802007be:	9902                	jalr	s2
    802007c0:	85a6                	mv	a1,s1
    802007c2:	07800513          	li	a0,120
    802007c6:	9902                	jalr	s2
    802007c8:	0a21                	addi	s4,s4,8
    802007ca:	6782                	ld	a5,0(sp)
    802007cc:	46c1                	li	a3,16
    802007ce:	ff8a3603          	ld	a2,-8(s4)
    802007d2:	bfb5                	j	8020074e <vprintfmt+0x156>
    802007d4:	000a3403          	ld	s0,0(s4)
    802007d8:	008a0713          	addi	a4,s4,8
    802007dc:	e03a                	sd	a4,0(sp)
    802007de:	14040263          	beqz	s0,80200922 <vprintfmt+0x32a>
    802007e2:	0fb05763          	blez	s11,802008d0 <vprintfmt+0x2d8>
    802007e6:	02d00693          	li	a3,45
    802007ea:	0cd79163          	bne	a5,a3,802008ac <vprintfmt+0x2b4>
    802007ee:	00044783          	lbu	a5,0(s0)
    802007f2:	0007851b          	sext.w	a0,a5
    802007f6:	cf85                	beqz	a5,8020082e <vprintfmt+0x236>
    802007f8:	00140a13          	addi	s4,s0,1
    802007fc:	05e00413          	li	s0,94
    80200800:	000c4563          	bltz	s8,8020080a <vprintfmt+0x212>
    80200804:	3c7d                	addiw	s8,s8,-1
    80200806:	036c0263          	beq	s8,s6,8020082a <vprintfmt+0x232>
    8020080a:	85a6                	mv	a1,s1
    8020080c:	0e0c8e63          	beqz	s9,80200908 <vprintfmt+0x310>
    80200810:	3781                	addiw	a5,a5,-32
    80200812:	0ef47b63          	bgeu	s0,a5,80200908 <vprintfmt+0x310>
    80200816:	03f00513          	li	a0,63
    8020081a:	9902                	jalr	s2
    8020081c:	000a4783          	lbu	a5,0(s4)
    80200820:	3dfd                	addiw	s11,s11,-1
    80200822:	0a05                	addi	s4,s4,1
    80200824:	0007851b          	sext.w	a0,a5
    80200828:	ffe1                	bnez	a5,80200800 <vprintfmt+0x208>
    8020082a:	01b05963          	blez	s11,8020083c <vprintfmt+0x244>
    8020082e:	3dfd                	addiw	s11,s11,-1
    80200830:	85a6                	mv	a1,s1
    80200832:	02000513          	li	a0,32
    80200836:	9902                	jalr	s2
    80200838:	fe0d9be3          	bnez	s11,8020082e <vprintfmt+0x236>
    8020083c:	6a02                	ld	s4,0(sp)
    8020083e:	bbd5                	j	80200632 <vprintfmt+0x3a>
    80200840:	4705                	li	a4,1
    80200842:	008a0c93          	addi	s9,s4,8
    80200846:	01174463          	blt	a4,a7,8020084e <vprintfmt+0x256>
    8020084a:	08088d63          	beqz	a7,802008e4 <vprintfmt+0x2ec>
    8020084e:	000a3403          	ld	s0,0(s4)
    80200852:	0a044d63          	bltz	s0,8020090c <vprintfmt+0x314>
    80200856:	8622                	mv	a2,s0
    80200858:	8a66                	mv	s4,s9
    8020085a:	46a9                	li	a3,10
    8020085c:	bdcd                	j	8020074e <vprintfmt+0x156>
    8020085e:	000a2783          	lw	a5,0(s4)
    80200862:	4719                	li	a4,6
    80200864:	0a21                	addi	s4,s4,8
    80200866:	41f7d69b          	sraiw	a3,a5,0x1f
    8020086a:	8fb5                	xor	a5,a5,a3
    8020086c:	40d786bb          	subw	a3,a5,a3
    80200870:	02d74163          	blt	a4,a3,80200892 <vprintfmt+0x29a>
    80200874:	00369793          	slli	a5,a3,0x3
    80200878:	97de                	add	a5,a5,s7
    8020087a:	639c                	ld	a5,0(a5)
    8020087c:	cb99                	beqz	a5,80200892 <vprintfmt+0x29a>
    8020087e:	86be                	mv	a3,a5
    80200880:	00000617          	auipc	a2,0x0
    80200884:	6f060613          	addi	a2,a2,1776 # 80200f70 <etext+0x5c2>
    80200888:	85a6                	mv	a1,s1
    8020088a:	854a                	mv	a0,s2
    8020088c:	0ce000ef          	jal	ra,8020095a <printfmt>
    80200890:	b34d                	j	80200632 <vprintfmt+0x3a>
    80200892:	00000617          	auipc	a2,0x0
    80200896:	6ce60613          	addi	a2,a2,1742 # 80200f60 <etext+0x5b2>
    8020089a:	85a6                	mv	a1,s1
    8020089c:	854a                	mv	a0,s2
    8020089e:	0bc000ef          	jal	ra,8020095a <printfmt>
    802008a2:	bb41                	j	80200632 <vprintfmt+0x3a>
    802008a4:	00000417          	auipc	s0,0x0
    802008a8:	6b440413          	addi	s0,s0,1716 # 80200f58 <etext+0x5aa>
    802008ac:	85e2                	mv	a1,s8
    802008ae:	8522                	mv	a0,s0
    802008b0:	e43e                	sd	a5,8(sp)
    802008b2:	cadff0ef          	jal	ra,8020055e <strnlen>
    802008b6:	40ad8dbb          	subw	s11,s11,a0
    802008ba:	01b05b63          	blez	s11,802008d0 <vprintfmt+0x2d8>
    802008be:	67a2                	ld	a5,8(sp)
    802008c0:	00078a1b          	sext.w	s4,a5
    802008c4:	3dfd                	addiw	s11,s11,-1
    802008c6:	85a6                	mv	a1,s1
    802008c8:	8552                	mv	a0,s4
    802008ca:	9902                	jalr	s2
    802008cc:	fe0d9ce3          	bnez	s11,802008c4 <vprintfmt+0x2cc>
    802008d0:	00044783          	lbu	a5,0(s0)
    802008d4:	00140a13          	addi	s4,s0,1
    802008d8:	0007851b          	sext.w	a0,a5
    802008dc:	d3a5                	beqz	a5,8020083c <vprintfmt+0x244>
    802008de:	05e00413          	li	s0,94
    802008e2:	bf39                	j	80200800 <vprintfmt+0x208>
    802008e4:	000a2403          	lw	s0,0(s4)
    802008e8:	b7ad                	j	80200852 <vprintfmt+0x25a>
    802008ea:	000a6603          	lwu	a2,0(s4)
    802008ee:	46a1                	li	a3,8
    802008f0:	8a2e                	mv	s4,a1
    802008f2:	bdb1                	j	8020074e <vprintfmt+0x156>
    802008f4:	000a6603          	lwu	a2,0(s4)
    802008f8:	46a9                	li	a3,10
    802008fa:	8a2e                	mv	s4,a1
    802008fc:	bd89                	j	8020074e <vprintfmt+0x156>
    802008fe:	000a6603          	lwu	a2,0(s4)
    80200902:	46c1                	li	a3,16
    80200904:	8a2e                	mv	s4,a1
    80200906:	b5a1                	j	8020074e <vprintfmt+0x156>
    80200908:	9902                	jalr	s2
    8020090a:	bf09                	j	8020081c <vprintfmt+0x224>
    8020090c:	85a6                	mv	a1,s1
    8020090e:	02d00513          	li	a0,45
    80200912:	e03e                	sd	a5,0(sp)
    80200914:	9902                	jalr	s2
    80200916:	6782                	ld	a5,0(sp)
    80200918:	8a66                	mv	s4,s9
    8020091a:	40800633          	neg	a2,s0
    8020091e:	46a9                	li	a3,10
    80200920:	b53d                	j	8020074e <vprintfmt+0x156>
    80200922:	03b05163          	blez	s11,80200944 <vprintfmt+0x34c>
    80200926:	02d00693          	li	a3,45
    8020092a:	f6d79de3          	bne	a5,a3,802008a4 <vprintfmt+0x2ac>
    8020092e:	00000417          	auipc	s0,0x0
    80200932:	62a40413          	addi	s0,s0,1578 # 80200f58 <etext+0x5aa>
    80200936:	02800793          	li	a5,40
    8020093a:	02800513          	li	a0,40
    8020093e:	00140a13          	addi	s4,s0,1
    80200942:	bd6d                	j	802007fc <vprintfmt+0x204>
    80200944:	00000a17          	auipc	s4,0x0
    80200948:	615a0a13          	addi	s4,s4,1557 # 80200f59 <etext+0x5ab>
    8020094c:	02800513          	li	a0,40
    80200950:	02800793          	li	a5,40
    80200954:	05e00413          	li	s0,94
    80200958:	b565                	j	80200800 <vprintfmt+0x208>

000000008020095a <printfmt>:
    8020095a:	715d                	addi	sp,sp,-80
    8020095c:	02810313          	addi	t1,sp,40
    80200960:	f436                	sd	a3,40(sp)
    80200962:	869a                	mv	a3,t1
    80200964:	ec06                	sd	ra,24(sp)
    80200966:	f83a                	sd	a4,48(sp)
    80200968:	fc3e                	sd	a5,56(sp)
    8020096a:	e0c2                	sd	a6,64(sp)
    8020096c:	e4c6                	sd	a7,72(sp)
    8020096e:	e41a                	sd	t1,8(sp)
    80200970:	c89ff0ef          	jal	ra,802005f8 <vprintfmt>
    80200974:	60e2                	ld	ra,24(sp)
    80200976:	6161                	addi	sp,sp,80
    80200978:	8082                	ret

000000008020097a <sbi_console_putchar>:
    8020097a:	4781                	li	a5,0
    8020097c:	00003717          	auipc	a4,0x3
    80200980:	68473703          	ld	a4,1668(a4) # 80204000 <SBI_CONSOLE_PUTCHAR>
    80200984:	88ba                	mv	a7,a4
    80200986:	852a                	mv	a0,a0
    80200988:	85be                	mv	a1,a5
    8020098a:	863e                	mv	a2,a5
    8020098c:	00000073          	ecall
    80200990:	87aa                	mv	a5,a0
    80200992:	8082                	ret

0000000080200994 <sbi_set_timer>:
    80200994:	4781                	li	a5,0
    80200996:	00003717          	auipc	a4,0x3
    8020099a:	67a73703          	ld	a4,1658(a4) # 80204010 <SBI_SET_TIMER>
    8020099e:	88ba                	mv	a7,a4
    802009a0:	852a                	mv	a0,a0
    802009a2:	85be                	mv	a1,a5
    802009a4:	863e                	mv	a2,a5
    802009a6:	00000073          	ecall
    802009aa:	87aa                	mv	a5,a0
    802009ac:	8082                	ret
