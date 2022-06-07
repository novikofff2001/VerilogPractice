
pulpino.elf:     file format elf32-littleriscv


Disassembly of section .vectors:

00000000 <_stack_start-0x108000>:
   0:	00000013          	nop
   4:	00000013          	nop
   8:	00000013          	nop
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00000013          	nop
  20:	00000013          	nop
  24:	00000013          	nop
  28:	00000013          	nop
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop
  4c:	00000013          	nop
  50:	00000013          	nop
  54:	00000013          	nop
  58:	00000013          	nop
  5c:	0ee0006f          	j	14a <ISR_I2C_ASM>
  60:	0fe0006f          	j	15e <ISR_UART_ASM>
  64:	10e0006f          	j	172 <ISR_GPIO_ASM>
  68:	11e0006f          	j	186 <ISR_SPIM0_ASM>
  6c:	12e0006f          	j	19a <ISR_SPIM1_ASM>
  70:	1520006f          	j	1c2 <ISR_TA_OVF_ASM>
  74:	13a0006f          	j	1ae <ISR_TA_CMP_ASM>
  78:	1720006f          	j	1ea <ISR_TB_OVF_ASM>
  7c:	15a0006f          	j	1d6 <ISR_TB_CMP_ASM>
  80:	0540006f          	j	d4 <reset_handler>
  84:	17a0006f          	j	1fe <illegal_insn_handler>
  88:	18a0006f          	j	212 <ecall_insn_handler>

Disassembly of section .text:

0000008c <ISR_I2C>:
  8c:	1141                	addi	sp,sp,-16
  8e:	c622                	sw	s0,12(sp)
  90:	0800                	addi	s0,sp,16
  92:	a001                	j	92 <ISR_I2C+0x6>

00000094 <ISR_UART>:
  94:	1141                	addi	sp,sp,-16
  96:	c622                	sw	s0,12(sp)
  98:	0800                	addi	s0,sp,16
  9a:	a001                	j	9a <ISR_UART+0x6>

0000009c <ISR_GPIO>:
  9c:	1141                	addi	sp,sp,-16
  9e:	c622                	sw	s0,12(sp)
  a0:	0800                	addi	s0,sp,16
  a2:	a001                	j	a2 <ISR_GPIO+0x6>

000000a4 <ISR_SPIM0>:
  a4:	1141                	addi	sp,sp,-16
  a6:	c622                	sw	s0,12(sp)
  a8:	0800                	addi	s0,sp,16
  aa:	a001                	j	aa <ISR_SPIM0+0x6>

000000ac <ISR_SPIM1>:
  ac:	1141                	addi	sp,sp,-16
  ae:	c622                	sw	s0,12(sp)
  b0:	0800                	addi	s0,sp,16
  b2:	a001                	j	b2 <ISR_SPIM1+0x6>

000000b4 <ISR_TA_OVF>:
  b4:	1141                	addi	sp,sp,-16
  b6:	c622                	sw	s0,12(sp)
  b8:	0800                	addi	s0,sp,16
  ba:	a001                	j	ba <ISR_TA_OVF+0x6>

000000bc <ISR_TA_CMP>:
  bc:	1141                	addi	sp,sp,-16
  be:	c622                	sw	s0,12(sp)
  c0:	0800                	addi	s0,sp,16
  c2:	a001                	j	c2 <ISR_TA_CMP+0x6>

000000c4 <ISR_TB_OVF>:
  c4:	1141                	addi	sp,sp,-16
  c6:	c622                	sw	s0,12(sp)
  c8:	0800                	addi	s0,sp,16
  ca:	a001                	j	ca <ISR_TB_OVF+0x6>

000000cc <ISR_TB_CMP>:
  cc:	1141                	addi	sp,sp,-16
  ce:	c622                	sw	s0,12(sp)
  d0:	0800                	addi	s0,sp,16
  d2:	a001                	j	d2 <ISR_TB_CMP+0x6>

000000d4 <reset_handler>:
  d4:	30501073          	csrw	mtvec,zero
  d8:	00000093          	li	ra,0
  dc:	8106                	mv	sp,ra
  de:	8186                	mv	gp,ra
  e0:	8206                	mv	tp,ra
  e2:	8286                	mv	t0,ra
  e4:	8306                	mv	t1,ra
  e6:	8386                	mv	t2,ra
  e8:	8406                	mv	s0,ra
  ea:	8486                	mv	s1,ra
  ec:	8506                	mv	a0,ra
  ee:	8586                	mv	a1,ra
  f0:	8606                	mv	a2,ra
  f2:	8686                	mv	a3,ra
  f4:	8706                	mv	a4,ra
  f6:	8786                	mv	a5,ra
  f8:	8806                	mv	a6,ra
  fa:	8886                	mv	a7,ra
  fc:	8906                	mv	s2,ra
  fe:	8986                	mv	s3,ra
 100:	8a06                	mv	s4,ra
 102:	8a86                	mv	s5,ra
 104:	8b06                	mv	s6,ra
 106:	8b86                	mv	s7,ra
 108:	8c06                	mv	s8,ra
 10a:	8c86                	mv	s9,ra
 10c:	8d06                	mv	s10,ra
 10e:	8d86                	mv	s11,ra
 110:	8e06                	mv	t3,ra
 112:	8e86                	mv	t4,ra
 114:	8f06                	mv	t5,ra
 116:	8f86                	mv	t6,ra
 118:	00108117          	auipc	sp,0x108
 11c:	ee810113          	addi	sp,sp,-280 # 108000 <_stack_start>

00000120 <_start>:
 120:	00100d17          	auipc	s10,0x100
 124:	efcd0d13          	addi	s10,s10,-260 # 10001c <_bss_end>
 128:	00100d97          	auipc	s11,0x100
 12c:	ef4d8d93          	addi	s11,s11,-268 # 10001c <_bss_end>
 130:	01bd5763          	ble	s11,s10,13e <main_entry>

00000134 <zero_loop>:
 134:	000d2023          	sw	zero,0(s10)
 138:	0d11                	addi	s10,s10,4
 13a:	ffaddde3          	ble	s10,s11,134 <zero_loop>

0000013e <main_entry>:
 13e:	00000513          	li	a0,0
 142:	00000593          	li	a1,0
 146:	37c000ef          	jal	ra,4c2 <main>

0000014a <ISR_I2C_ASM>:
 14a:	711d                	addi	sp,sp,-96
 14c:	ce86                	sw	ra,92(sp)
 14e:	0d8000ef          	jal	ra,226 <store_regs>
 152:	00000097          	auipc	ra,0x0
 156:	11e08093          	addi	ra,ra,286 # 270 <end_except>
 15a:	f33ff06f          	j	8c <ISR_I2C>

0000015e <ISR_UART_ASM>:
 15e:	711d                	addi	sp,sp,-96
 160:	ce86                	sw	ra,92(sp)
 162:	0c4000ef          	jal	ra,226 <store_regs>
 166:	00000097          	auipc	ra,0x0
 16a:	10a08093          	addi	ra,ra,266 # 270 <end_except>
 16e:	f27ff06f          	j	94 <ISR_UART>

00000172 <ISR_GPIO_ASM>:
 172:	711d                	addi	sp,sp,-96
 174:	ce86                	sw	ra,92(sp)
 176:	0b0000ef          	jal	ra,226 <store_regs>
 17a:	00000097          	auipc	ra,0x0
 17e:	0f608093          	addi	ra,ra,246 # 270 <end_except>
 182:	f1bff06f          	j	9c <ISR_GPIO>

00000186 <ISR_SPIM0_ASM>:
 186:	711d                	addi	sp,sp,-96
 188:	ce86                	sw	ra,92(sp)
 18a:	09c000ef          	jal	ra,226 <store_regs>
 18e:	00000097          	auipc	ra,0x0
 192:	0e208093          	addi	ra,ra,226 # 270 <end_except>
 196:	f0fff06f          	j	a4 <ISR_SPIM0>

0000019a <ISR_SPIM1_ASM>:
 19a:	711d                	addi	sp,sp,-96
 19c:	ce86                	sw	ra,92(sp)
 19e:	088000ef          	jal	ra,226 <store_regs>
 1a2:	00000097          	auipc	ra,0x0
 1a6:	0ce08093          	addi	ra,ra,206 # 270 <end_except>
 1aa:	f03ff06f          	j	ac <ISR_SPIM1>

000001ae <ISR_TA_CMP_ASM>:
 1ae:	711d                	addi	sp,sp,-96
 1b0:	ce86                	sw	ra,92(sp)
 1b2:	074000ef          	jal	ra,226 <store_regs>
 1b6:	00000097          	auipc	ra,0x0
 1ba:	0ba08093          	addi	ra,ra,186 # 270 <end_except>
 1be:	effff06f          	j	bc <ISR_TA_CMP>

000001c2 <ISR_TA_OVF_ASM>:
 1c2:	711d                	addi	sp,sp,-96
 1c4:	ce86                	sw	ra,92(sp)
 1c6:	060000ef          	jal	ra,226 <store_regs>
 1ca:	00000097          	auipc	ra,0x0
 1ce:	0a608093          	addi	ra,ra,166 # 270 <end_except>
 1d2:	ee3ff06f          	j	b4 <ISR_TA_OVF>

000001d6 <ISR_TB_CMP_ASM>:
 1d6:	711d                	addi	sp,sp,-96
 1d8:	ce86                	sw	ra,92(sp)
 1da:	04c000ef          	jal	ra,226 <store_regs>
 1de:	00000097          	auipc	ra,0x0
 1e2:	09208093          	addi	ra,ra,146 # 270 <end_except>
 1e6:	ee7ff06f          	j	cc <ISR_TB_CMP>

000001ea <ISR_TB_OVF_ASM>:
 1ea:	711d                	addi	sp,sp,-96
 1ec:	ce86                	sw	ra,92(sp)
 1ee:	038000ef          	jal	ra,226 <store_regs>
 1f2:	00000097          	auipc	ra,0x0
 1f6:	07e08093          	addi	ra,ra,126 # 270 <end_except>
 1fa:	ecbff06f          	j	c4 <ISR_TB_OVF>

000001fe <illegal_insn_handler>:
 1fe:	711d                	addi	sp,sp,-96
 200:	ce86                	sw	ra,92(sp)
 202:	024000ef          	jal	ra,226 <store_regs>
 206:	00000097          	auipc	ra,0x0
 20a:	06a08093          	addi	ra,ra,106 # 270 <end_except>
 20e:	0ba0006f          	j	2c8 <illegal_insn_handler_c>

00000212 <ecall_insn_handler>:
 212:	711d                	addi	sp,sp,-96
 214:	ce86                	sw	ra,92(sp)
 216:	010000ef          	jal	ra,226 <store_regs>
 21a:	00000097          	auipc	ra,0x0
 21e:	05608093          	addi	ra,ra,86 # 270 <end_except>
 222:	0ae0006f          	j	2d0 <ecall_insn_handler_c>

00000226 <store_regs>:
 226:	c00e                	sw	gp,0(sp)
 228:	c212                	sw	tp,4(sp)
 22a:	c416                	sw	t0,8(sp)
 22c:	c61a                	sw	t1,12(sp)
 22e:	c81e                	sw	t2,16(sp)
 230:	ca2a                	sw	a0,20(sp)
 232:	cc2e                	sw	a1,24(sp)
 234:	ce32                	sw	a2,28(sp)
 236:	d036                	sw	a3,32(sp)
 238:	d23a                	sw	a4,36(sp)
 23a:	d43e                	sw	a5,40(sp)
 23c:	d642                	sw	a6,44(sp)
 23e:	d846                	sw	a7,48(sp)
 240:	da72                	sw	t3,52(sp)
 242:	dc76                	sw	t4,56(sp)
 244:	de7a                	sw	t5,60(sp)
 246:	c0fe                	sw	t6,64(sp)
 248:	7b002e73          	csrr	t3,lpstart0
 24c:	7b102ef3          	csrr	t4,lpend0
 250:	7b202f73          	csrr	t5,lpcount0
 254:	c2f2                	sw	t3,68(sp)
 256:	c4f6                	sw	t4,72(sp)
 258:	c6fa                	sw	t5,76(sp)
 25a:	7b402e73          	csrr	t3,lpstart1
 25e:	7b502ef3          	csrr	t4,lpend1
 262:	7b602f73          	csrr	t5,lpcount1
 266:	c8f2                	sw	t3,80(sp)
 268:	caf6                	sw	t4,84(sp)
 26a:	ccfa                	sw	t5,88(sp)
 26c:	00008067          	ret

00000270 <end_except>:
 270:	4e46                	lw	t3,80(sp)
 272:	4ed6                	lw	t4,84(sp)
 274:	4f66                	lw	t5,88(sp)
 276:	7b4e1073          	csrw	lpstart1,t3
 27a:	7b5e9073          	csrw	lpend1,t4
 27e:	7b6f1073          	csrw	lpcount1,t5
 282:	4e16                	lw	t3,68(sp)
 284:	4ea6                	lw	t4,72(sp)
 286:	4f36                	lw	t5,76(sp)
 288:	7b0e1073          	csrw	lpstart0,t3
 28c:	7b1e9073          	csrw	lpend0,t4
 290:	7b2f1073          	csrw	lpcount0,t5
 294:	4182                	lw	gp,0(sp)
 296:	4212                	lw	tp,4(sp)
 298:	42a2                	lw	t0,8(sp)
 29a:	4332                	lw	t1,12(sp)
 29c:	43c2                	lw	t2,16(sp)
 29e:	4552                	lw	a0,20(sp)
 2a0:	45e2                	lw	a1,24(sp)
 2a2:	4672                	lw	a2,28(sp)
 2a4:	5682                	lw	a3,32(sp)
 2a6:	5712                	lw	a4,36(sp)
 2a8:	57a2                	lw	a5,40(sp)
 2aa:	5832                	lw	a6,44(sp)
 2ac:	58c2                	lw	a7,48(sp)
 2ae:	5e52                	lw	t3,52(sp)
 2b0:	5ee2                	lw	t4,56(sp)
 2b2:	5f72                	lw	t5,60(sp)
 2b4:	4f86                	lw	t6,64(sp)
 2b6:	40f6                	lw	ra,92(sp)
 2b8:	6125                	addi	sp,sp,96
 2ba:	30200073          	mret

000002be <_fini>:
 2be:	8082                	ret

000002c0 <default_exception_handler_c>:
 2c0:	1141                	addi	sp,sp,-16
 2c2:	c622                	sw	s0,12(sp)
 2c4:	0800                	addi	s0,sp,16
 2c6:	a001                	j	2c6 <default_exception_handler_c+0x6>

000002c8 <illegal_insn_handler_c>:
 2c8:	1141                	addi	sp,sp,-16
 2ca:	c622                	sw	s0,12(sp)
 2cc:	0800                	addi	s0,sp,16
 2ce:	a001                	j	2ce <illegal_insn_handler_c+0x6>

000002d0 <ecall_insn_handler_c>:
 2d0:	1141                	addi	sp,sp,-16
 2d2:	c622                	sw	s0,12(sp)
 2d4:	0800                	addi	s0,sp,16
 2d6:	a001                	j	2d6 <ecall_insn_handler_c+0x6>

000002d8 <write_ack>:
 2d8:	1101                	addi	sp,sp,-32
 2da:	ce22                	sw	s0,28(sp)
 2dc:	1000                	addi	s0,sp,32
 2de:	fea42623          	sw	a0,-20(s0)
 2e2:	001007b7          	lui	a5,0x100
 2e6:	0047a783          	lw	a5,4(a5) # 100004 <ack_ptr>
 2ea:	fec42703          	lw	a4,-20(s0)
 2ee:	0762                	slli	a4,a4,0x18
 2f0:	8761                	srai	a4,a4,0x18
 2f2:	00e78023          	sb	a4,0(a5)
 2f6:	0001                	nop
 2f8:	4472                	lw	s0,28(sp)
 2fa:	6105                	addi	sp,sp,32
 2fc:	8082                	ret

000002fe <write_req>:
 2fe:	1101                	addi	sp,sp,-32
 300:	ce22                	sw	s0,28(sp)
 302:	1000                	addi	s0,sp,32
 304:	fea42623          	sw	a0,-20(s0)
 308:	001007b7          	lui	a5,0x100
 30c:	0087a783          	lw	a5,8(a5) # 100008 <req_ptr>
 310:	fec42703          	lw	a4,-20(s0)
 314:	0762                	slli	a4,a4,0x18
 316:	8761                	srai	a4,a4,0x18
 318:	00e78023          	sb	a4,0(a5)
 31c:	0001                	nop
 31e:	4472                	lw	s0,28(sp)
 320:	6105                	addi	sp,sp,32
 322:	8082                	ret

00000324 <write_rst>:
 324:	1101                	addi	sp,sp,-32
 326:	ce22                	sw	s0,28(sp)
 328:	1000                	addi	s0,sp,32
 32a:	fea42623          	sw	a0,-20(s0)
 32e:	001007b7          	lui	a5,0x100
 332:	0087a783          	lw	a5,8(a5) # 100008 <req_ptr>
 336:	fec42703          	lw	a4,-20(s0)
 33a:	0762                	slli	a4,a4,0x18
 33c:	8761                	srai	a4,a4,0x18
 33e:	00e78023          	sb	a4,0(a5)
 342:	0001                	nop
 344:	4472                	lw	s0,28(sp)
 346:	6105                	addi	sp,sp,32
 348:	8082                	ret

0000034a <write_valid>:
 34a:	1101                	addi	sp,sp,-32
 34c:	ce22                	sw	s0,28(sp)
 34e:	1000                	addi	s0,sp,32
 350:	fea42623          	sw	a0,-20(s0)
 354:	001007b7          	lui	a5,0x100
 358:	00c7a783          	lw	a5,12(a5) # 10000c <valid_ptr>
 35c:	fec42703          	lw	a4,-20(s0)
 360:	0762                	slli	a4,a4,0x18
 362:	8761                	srai	a4,a4,0x18
 364:	00e78023          	sb	a4,0(a5)
 368:	0001                	nop
 36a:	4472                	lw	s0,28(sp)
 36c:	6105                	addi	sp,sp,32
 36e:	8082                	ret

00000370 <write_busy>:
 370:	1101                	addi	sp,sp,-32
 372:	ce22                	sw	s0,28(sp)
 374:	1000                	addi	s0,sp,32
 376:	fea42623          	sw	a0,-20(s0)
 37a:	001007b7          	lui	a5,0x100
 37e:	0087a783          	lw	a5,8(a5) # 100008 <req_ptr>
 382:	fec42703          	lw	a4,-20(s0)
 386:	0762                	slli	a4,a4,0x18
 388:	8761                	srai	a4,a4,0x18
 38a:	00e78023          	sb	a4,0(a5)
 38e:	0001                	nop
 390:	4472                	lw	s0,28(sp)
 392:	6105                	addi	sp,sp,32
 394:	8082                	ret

00000396 <reset>:
 396:	1141                	addi	sp,sp,-16
 398:	c622                	sw	s0,12(sp)
 39a:	0800                	addi	s0,sp,16
 39c:	001007b7          	lui	a5,0x100
 3a0:	0007a783          	lw	a5,0(a5) # 100000 <_edata>
 3a4:	00078023          	sb	zero,0(a5)
 3a8:	0001                	nop
 3aa:	4432                	lw	s0,12(sp)
 3ac:	0141                	addi	sp,sp,16
 3ae:	8082                	ret

000003b0 <is_valid>:
 3b0:	1141                	addi	sp,sp,-16
 3b2:	c622                	sw	s0,12(sp)
 3b4:	0800                	addi	s0,sp,16
 3b6:	001007b7          	lui	a5,0x100
 3ba:	00c7a783          	lw	a5,12(a5) # 10000c <valid_ptr>
 3be:	00078783          	lb	a5,0(a5)
 3c2:	853e                	mv	a0,a5
 3c4:	4432                	lw	s0,12(sp)
 3c6:	0141                	addi	sp,sp,16
 3c8:	8082                	ret

000003ca <is_busy>:
 3ca:	1141                	addi	sp,sp,-16
 3cc:	c622                	sw	s0,12(sp)
 3ce:	0800                	addi	s0,sp,16
 3d0:	001007b7          	lui	a5,0x100
 3d4:	0107a783          	lw	a5,16(a5) # 100010 <busy_ptr>
 3d8:	00078783          	lb	a5,0(a5)
 3dc:	853e                	mv	a0,a5
 3de:	4432                	lw	s0,12(sp)
 3e0:	0141                	addi	sp,sp,16
 3e2:	8082                	ret

000003e4 <get_data>:
 3e4:	1101                	addi	sp,sp,-32
 3e6:	ce22                	sw	s0,28(sp)
 3e8:	1000                	addi	s0,sp,32
 3ea:	fea42623          	sw	a0,-20(s0)
 3ee:	001007b7          	lui	a5,0x100
 3f2:	0187a783          	lw	a5,24(a5) # 100018 <output_data_ptr>
 3f6:	00078783          	lb	a5,0(a5)
 3fa:	873e                	mv	a4,a5
 3fc:	fec42783          	lw	a5,-20(s0)
 400:	c398                	sw	a4,0(a5)
 402:	001007b7          	lui	a5,0x100
 406:	0187a783          	lw	a5,24(a5) # 100018 <output_data_ptr>
 40a:	0791                	addi	a5,a5,4
 40c:	00078703          	lb	a4,0(a5)
 410:	fec42783          	lw	a5,-20(s0)
 414:	0791                	addi	a5,a5,4
 416:	c398                	sw	a4,0(a5)
 418:	001007b7          	lui	a5,0x100
 41c:	0187a783          	lw	a5,24(a5) # 100018 <output_data_ptr>
 420:	07a1                	addi	a5,a5,8
 422:	00078703          	lb	a4,0(a5)
 426:	fec42783          	lw	a5,-20(s0)
 42a:	07a1                	addi	a5,a5,8
 42c:	c398                	sw	a4,0(a5)
 42e:	001007b7          	lui	a5,0x100
 432:	0187a783          	lw	a5,24(a5) # 100018 <output_data_ptr>
 436:	07b1                	addi	a5,a5,12
 438:	00078703          	lb	a4,0(a5)
 43c:	fec42783          	lw	a5,-20(s0)
 440:	07b1                	addi	a5,a5,12
 442:	c398                	sw	a4,0(a5)
 444:	0001                	nop
 446:	4472                	lw	s0,28(sp)
 448:	6105                	addi	sp,sp,32
 44a:	8082                	ret

0000044c <write_data>:
 44c:	1101                	addi	sp,sp,-32
 44e:	ce22                	sw	s0,28(sp)
 450:	1000                	addi	s0,sp,32
 452:	fea42623          	sw	a0,-20(s0)
 456:	fec42783          	lw	a5,-20(s0)
 45a:	4398                	lw	a4,0(a5)
 45c:	001007b7          	lui	a5,0x100
 460:	0147a783          	lw	a5,20(a5) # 100014 <input_data_ptr>
 464:	0762                	slli	a4,a4,0x18
 466:	8761                	srai	a4,a4,0x18
 468:	00e78023          	sb	a4,0(a5)
 46c:	fec42783          	lw	a5,-20(s0)
 470:	0791                	addi	a5,a5,4
 472:	4398                	lw	a4,0(a5)
 474:	001007b7          	lui	a5,0x100
 478:	0147a783          	lw	a5,20(a5) # 100014 <input_data_ptr>
 47c:	0791                	addi	a5,a5,4
 47e:	0762                	slli	a4,a4,0x18
 480:	8761                	srai	a4,a4,0x18
 482:	00e78023          	sb	a4,0(a5)
 486:	fec42783          	lw	a5,-20(s0)
 48a:	07a1                	addi	a5,a5,8
 48c:	4398                	lw	a4,0(a5)
 48e:	001007b7          	lui	a5,0x100
 492:	0147a783          	lw	a5,20(a5) # 100014 <input_data_ptr>
 496:	07a1                	addi	a5,a5,8
 498:	0762                	slli	a4,a4,0x18
 49a:	8761                	srai	a4,a4,0x18
 49c:	00e78023          	sb	a4,0(a5)
 4a0:	fec42783          	lw	a5,-20(s0)
 4a4:	07b1                	addi	a5,a5,12
 4a6:	4398                	lw	a4,0(a5)
 4a8:	001007b7          	lui	a5,0x100
 4ac:	0147a783          	lw	a5,20(a5) # 100014 <input_data_ptr>
 4b0:	07b1                	addi	a5,a5,12
 4b2:	0762                	slli	a4,a4,0x18
 4b4:	8761                	srai	a4,a4,0x18
 4b6:	00e78023          	sb	a4,0(a5)
 4ba:	0001                	nop
 4bc:	4472                	lw	s0,28(sp)
 4be:	6105                	addi	sp,sp,32
 4c0:	8082                	ret

000004c2 <main>:
 4c2:	1101                	addi	sp,sp,-32
 4c4:	ce06                	sw	ra,28(sp)
 4c6:	cc22                	sw	s0,24(sp)
 4c8:	1000                	addi	s0,sp,32
 4ca:	4785                	li	a5,1
 4cc:	fef42023          	sw	a5,-32(s0)
 4d0:	4789                	li	a5,2
 4d2:	fef42223          	sw	a5,-28(s0)
 4d6:	478d                	li	a5,3
 4d8:	fef42423          	sw	a5,-24(s0)
 4dc:	4791                	li	a5,4
 4de:	fef42623          	sw	a5,-20(s0)
 4e2:	fe040793          	addi	a5,s0,-32
 4e6:	853e                	mv	a0,a5
 4e8:	3795                	jal	44c <write_data>
 4ea:	4505                	li	a0,1
 4ec:	3d09                	jal	2fe <write_req>
 4ee:	4501                	li	a0,0
 4f0:	3539                	jal	2fe <write_req>
 4f2:	3d7d                	jal	3b0 <is_valid>
 4f4:	872a                	mv	a4,a0
 4f6:	4785                	li	a5,1
 4f8:	00f70363          	beq	a4,a5,4fe <main+0x3c>
 4fc:	bfdd                	j	4f2 <main+0x30>
 4fe:	0001                	nop
 500:	4505                	li	a0,1
 502:	3bd9                	jal	2d8 <write_ack>
 504:	a001                	j	504 <main+0x42>

00000506 <__CTOR_LIST__>:
	...

0000050e <__CTOR_END__>:
	...

Disassembly of section .sdata:

00100000 <reset_ptr>:
  100000:	8000                	0x8000
  100002:	1a11                	addi	s4,s4,-28

00100004 <ack_ptr>:
  100004:	8004                	0x8004
  100006:	1a11                	addi	s4,s4,-28

00100008 <req_ptr>:
  100008:	8004                	0x8004
  10000a:	1a11                	addi	s4,s4,-28

0010000c <valid_ptr>:
  10000c:	8008                	0x8008
  10000e:	1a11                	addi	s4,s4,-28

00100010 <busy_ptr>:
  100010:	8009                	srli	s0,s0,0x2
  100012:	1a11                	addi	s4,s4,-28

00100014 <input_data_ptr>:
  100014:	8010                	0x8010
  100016:	1a11                	addi	s4,s4,-28

00100018 <output_data_ptr>:
  100018:	8014                	0x8014
  10001a:	1a11                	addi	s4,s4,-28

Disassembly of section .stack:

00106000 <_stack-0x1000>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3720                	fld	fs0,104(a4)
   c:	312e                	fld	ft2,232(sp)
   e:	312e                	fld	ft2,232(sp)
  10:	3220                	fld	fs0,96(a2)
  12:	3130                	fld	fa2,96(a0)
  14:	30353037          	lui	zero,0x30353
  18:	0039                	c.addi	zero,14

Disassembly of section .Pulp_Chip.Info:

00000000 <.Pulp_Chip.Info>:
   0:	000a                	0xa
   2:	0000                	unimp
   4:	0038                	addi	a4,sp,8
   6:	0000                	unimp
   8:	0001                	nop
   a:	0000                	unimp
   c:	7550                	flw	fa2,44(a0)
   e:	706c                	flw	fa1,100(s0)
  10:	495f 666e 006f      	0x6f666e495f
  16:	70696863          	bltu	s2,t1,726 <__DTOR_END__+0x210>
  1a:	6e3d                	lui	t3,0xf
  1c:	20656e6f          	jal	t3,56222 <_stack_len+0x54222>
  20:	3d757063          	bleu	s7,a0,3e0 <is_busy+0x16>
  24:	6f6e                	flw	ft10,216(sp)
  26:	656e                	flw	fa0,216(sp)
  28:	7020                	flw	fs0,96(s0)
  2a:	3d65                	jal	fffffee2 <pulp__FC+0xfffffee3>
  2c:	312d                	jal	fffffc56 <pulp__FC+0xfffffc57>
  2e:	6620                	flw	fs0,72(a2)
  30:	312d3d63          	p.bneimm	s10,-14,34a <write_valid>
  34:	6c20                	flw	fs0,88(s0)
  36:	3d32                	fld	fs10,296(sp)
  38:	312d                	jal	fffffc62 <pulp__FC+0xfffffc63>
  3a:	6c20                	flw	fs0,88(s0)
  3c:	6331                	lui	t1,0xc
  3e:	3d6c                	fld	fa1,248(a0)
  40:	312d                	jal	fffffc6a <pulp__FC+0xfffffc6b>
  42:	6c20                	flw	fs0,88(s0)
  44:	6631                	lui	a2,0xc
  46:	312d3d63          	p.bneimm	s10,-14,360 <write_valid+0x16>
  4a:	0000                	unimp
	...
