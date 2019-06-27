@ GBE+ NDS Hardware Suite Copyright Daniel Baxter 2019
@ Licensed under the GPLv2 or newer
@
@ File : test_1.s
@ Date : June 23rd, 2019
@ Description : Low-level NDS9 DMA test
@
@ Tests various aspects of the NDS' ARM9 DMA channels

@@@@@@@@@@@@@@@@
@ DMA_TEST_1_1 @
@@@@@@@@@@@@@@@@
@ No parameters
@@@@@@@@@@@@@@@@
DMA_TEST_1_1:

@ Test DMA Type 0 - Immediate

stmfd	r13!, {r0, r1, r2, r3, r14}

@ Clear data at destination address
ldr 	r1, =#0x2200000
mov	r0, #0x00
str	r0, [r1]
str	r0, [r1, #0x04]

@ Setup DMA0 for immediate transfer
ldr	r1, =#0x40000B0
ldr	r0, =dma_data
str	r0, [r1]

ldr 	r0, =#0x2200000
str	r0, [r1, #0x04]

mov	r0, #0x02
strh	r0, [r1, #0x08]

ldr	r0, =#0x8400
strh	r0, [r1, #0x0A]

@ Wait until Bit 15 of DMA_CNT is clear
DMA_1_1_CNT_LOOP:
ldrh	r0, [r1, #0x0A]
and	r0, #0x8000
cmp	r0, #0x00
bne	DMA_1_1_CNT_LOOP

@ Verify data at destination address
ldr 	r1, =#0x2200000
ldr	r0, [r1]
ldr	r2, =#0x44332211
cmp	r0, r2
bne	DMA_TEST_1_1_FAIL

ldr	r0, [r1, #0x04]
ldr	r2, =#0x88776655
cmp	r0, r2
beq	DMA_TEST_1_1_PASS

@ Draw FAIL
DMA_TEST_1_1_FAIL:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =fail_str
mov	r1, #0x1C
mov	r2, #0x02
bl	PRINT_STRING
b	DMA_TEST_1_1_RET

@ Draw PASS
DMA_TEST_1_1_PASS:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =pass_str
mov	r1, #0x1C
mov	r2, #0x02
bl	PRINT_STRING

DMA_TEST_1_1_RET:
ldmfd	r13!, {r0, r1, r2, r3, r14}
mov	r15, r14

@@@@@@@@@@@@@@@@
@ DMA_TEST_1_2 @
@@@@@@@@@@@@@@@@
@ No parameters
@@@@@@@@@@@@@@@@
DMA_TEST_1_2:

@ Test DMA Type 1 - VBlank

stmfd	r13!, {r0, r1, r2, r3, r14}

@ Clear data at destination address
ldr 	r1, =#0x2200000
mov	r0, #0x00
str	r0, [r1]
str	r0, [r1, #0x04]

@ Setup DMA0 for VBlank transfer
ldr	r1, =#0x40000B0
ldr	r0, =dma_data
str	r0, [r1]

ldr 	r0, =#0x2200000
str	r0, [r1, #0x04]

mov	r0, #0x02
strh	r0, [r1, #0x08]

ldr	r0, =#0x8C00
strh	r0, [r1, #0x0A]

@ Wait until Bit 15 of DMA_CNT is clear
DMA_1_2_CNT_LOOP:
ldrh	r0, [r1, #0x0A]
and	r0, #0x8000
cmp	r0, #0x00
bne	DMA_1_2_CNT_LOOP

@ Verify data at destination address
ldr 	r1, =#0x2200000
ldr	r0, [r1]
ldr	r2, =#0x44332211
cmp	r0, r2
bne	DMA_TEST_1_2_FAIL

ldr	r0, [r1, #0x04]
ldr	r2, =#0x88776655
cmp	r0, r2
beq	DMA_TEST_1_2_PASS

@ Draw FAIL
DMA_TEST_1_2_FAIL:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =fail_str
mov	r1, #0x1C
mov	r2, #0x03
bl	PRINT_STRING
b	DMA_TEST_1_2_RET

@ Draw PASS
DMA_TEST_1_2_PASS:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =pass_str
mov	r1, #0x1C
mov	r2, #0x03
bl	PRINT_STRING

DMA_TEST_1_2_RET:
ldmfd	r13!, {r0, r1, r2, r3, r14}
mov	r15, r14

@@@@@@@@@@@@@@@@
@ DMA_TEST_1_3 @
@@@@@@@@@@@@@@@@
@ No parameters
@@@@@@@@@@@@@@@@
DMA_TEST_1_3:

@ Test DMA Type 2 - HBlank

stmfd	r13!, {r0, r1, r2, r3, r14}

@ Clear data at destination address
ldr 	r1, =#0x2200000
mov	r0, #0x00
str	r0, [r1]
str	r0, [r1, #0x04]

@ Setup DMA0 for HBlank transfer
ldr	r1, =#0x40000B0
ldr	r0, =dma_data
str	r0, [r1]

ldr 	r0, =#0x2200000
str	r0, [r1, #0x04]

mov	r0, #0x02
strh	r0, [r1, #0x08]

ldr	r0, =#0x9400
strh	r0, [r1, #0x0A]

@ Wait until Bit 15 of DMA_CNT is clear
DMA_1_3_CNT_LOOP:
ldrh	r0, [r1, #0x0A]
and	r0, #0x8000
cmp	r0, #0x00
bne	DMA_1_3_CNT_LOOP

@ Verify data at destination address
ldr 	r1, =#0x2200000
ldr	r0, [r1]
ldr	r2, =#0x44332211
cmp	r0, r2
bne	DMA_TEST_1_3_FAIL

ldr	r0, [r1, #0x04]
ldr	r2, =#0x88776655
cmp	r0, r2
beq	DMA_TEST_1_3_PASS

@ Draw FAIL
DMA_TEST_1_3_FAIL:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =fail_str
mov	r1, #0x1C
mov	r2, #0x04
bl	PRINT_STRING
b	DMA_TEST_1_3_RET

@ Draw PASS
DMA_TEST_1_3_PASS:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =pass_str
mov	r1, #0x1C
mov	r2, #0x04
bl	PRINT_STRING

DMA_TEST_1_3_RET:
ldmfd	r13!, {r0, r1, r2, r3, r14}
mov	r15, r14

@@@@@@@@@@@@@@@@
@ DMA_TEST_1_4 @
@@@@@@@@@@@@@@@@
@ No parameters
@@@@@@@@@@@@@@@@
DMA_TEST_1_4:

@ Test DMA Type 3 - Start of display

stmfd	r13!, {r0, r1, r2, r3, r14}

@ Clear data at destination address
ldr 	r1, =#0x2200000
mov	r0, #0x00
str	r0, [r1]
str	r0, [r1, #0x04]

@ Setup DMA0 for HBlank transfer
ldr	r1, =#0x40000B0
ldr	r0, =dma_data
str	r0, [r1]

ldr 	r0, =#0x2200000
str	r0, [r1, #0x04]

mov	r0, #0x02
strh	r0, [r1, #0x08]

ldr	r0, =#0x9C00
strh	r0, [r1, #0x0A]

@ Wait until Bit 15 of DMA_CNT is clear
DMA_1_4_CNT_LOOP:
ldrh	r0, [r1, #0x0A]
and	r0, #0x8000
cmp	r0, #0x00
bne	DMA_1_4_CNT_LOOP

@ Verify data at destination address
ldr 	r1, =#0x2200000
ldr	r0, [r1]
ldr	r2, =#0x44332211
cmp	r0, r2
bne	DMA_TEST_1_4_FAIL

ldr	r0, [r1, #0x04]
ldr	r2, =#0x88776655
cmp	r0, r2
beq	DMA_TEST_1_4_PASS

@ Draw FAIL
DMA_TEST_1_4_FAIL:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =fail_str
mov	r1, #0x1C
mov	r2, #0x05
bl	PRINT_STRING
b	DMA_TEST_1_4_RET

@ Draw PASS
DMA_TEST_1_4_PASS:
ldr	r0, =0x1
bl	WAIT_FRAMES

ldr	r0, =pass_str
mov	r1, #0x1C
mov	r2, #0x05
bl	PRINT_STRING

DMA_TEST_1_4_RET:
ldmfd	r13!, {r0, r1, r2, r3, r14}
mov	r15, r14

