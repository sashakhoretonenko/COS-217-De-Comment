	.arch armv8-a
	.file	"decomment.c"
	.text
	.align	2
	.global	handleREG_CODE
	.type	handleREG_CODE, %function
handleREG_CODE:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 0
.L3:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleREG_CODE, .-handleREG_CODE
	.align	2
	.global	handleSLASH
	.type	handleSLASH, %function
handleSLASH:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	beq	.L7
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L8
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	b	.L9
.L8:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L10
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	b	.L9
.L10:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L7
	mov	w0, 1
	b	.L9
.L7:
	mov	w0, 32
	bl	putchar
	mov	w0, 3
.L9:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleSLASH, .-handleSLASH
	.align	2
	.global	handleIN_COMMENT
	.type	handleIN_COMMENT, %function
handleIN_COMMENT:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L12
	mov	w0, 2
	b	.L13
.L12:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L14
	ldr	w0, [sp, 28]
	bl	putchar
.L14:
	mov	w0, 3
.L13:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleIN_COMMENT, .-handleIN_COMMENT
	.align	2
	.global	handleSTAR
	.type	handleSTAR, %function
handleSTAR:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L16
	mov	w0, 2
	b	.L17
.L16:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L18
	ldr	w0, [sp, 28]
	bl	putchar
.L18:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L19
	mov	w0, 0
	b	.L17
.L19:
	mov	w0, 3
.L17:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleSTAR, .-handleSTAR
	.align	2
	.global	handleIN_STRING
	.type	handleIN_STRING, %function
handleIN_STRING:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L21
	mov	w0, 0
	b	.L22
.L21:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L23
	mov	w0, 5
	b	.L22
.L23:
	mov	w0, 4
.L22:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleIN_STRING, .-handleIN_STRING
	.align	2
	.global	handleIN_CHARLIT
	.type	handleIN_CHARLIT, %function
handleIN_CHARLIT:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L25
	mov	w0, 0
	b	.L26
.L25:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L27
	mov	w0, 7
	b	.L26
.L27:
	mov	w0, 6
.L26:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleIN_CHARLIT, .-handleIN_CHARLIT
	.align	2
	.global	handleESCAPE_STRING
	.type	handleESCAPE_STRING, %function
handleESCAPE_STRING:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleESCAPE_STRING, .-handleESCAPE_STRING
	.align	2
	.global	handleESCAPE_CHARLIT
	.type	handleESCAPE_CHARLIT, %function
handleESCAPE_CHARLIT:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 6
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleESCAPE_CHARLIT, .-handleESCAPE_CHARLIT
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d unterminated comment"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 24]
	b	.L33
.L43:
	ldr	w0, [sp, 16]
	cmp	w0, 10
	bne	.L34
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
.L34:
	ldr	w0, [sp, 28]
	cmp	w0, 7
	beq	.L35
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bhi	.L33
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L36
	ldr	w0, [sp, 28]
	cmp	w0, 6
	bhi	.L33
	ldr	w0, [sp, 28]
	cmp	w0, 5
	beq	.L37
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bhi	.L33
	ldr	w0, [sp, 28]
	cmp	w0, 4
	beq	.L38
	ldr	w0, [sp, 28]
	cmp	w0, 4
	bhi	.L33
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bhi	.L33
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L40
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bhi	.L33
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L42
	b	.L33
.L41:
	ldr	w0, [sp, 16]
	bl	handleREG_CODE
	str	w0, [sp, 28]
	b	.L33
.L42:
	ldr	w0, [sp, 24]
	str	w0, [sp, 20]
	ldr	w0, [sp, 16]
	bl	handleSLASH
	str	w0, [sp, 28]
	b	.L33
.L40:
	ldr	w0, [sp, 16]
	bl	handleSTAR
	str	w0, [sp, 28]
	b	.L33
.L39:
	ldr	w0, [sp, 16]
	bl	handleIN_COMMENT
	str	w0, [sp, 28]
	b	.L33
.L38:
	ldr	w0, [sp, 16]
	bl	handleIN_STRING
	str	w0, [sp, 28]
	b	.L33
.L37:
	ldr	w0, [sp, 16]
	bl	handleESCAPE_STRING
	str	w0, [sp, 28]
	b	.L33
.L36:
	ldr	w0, [sp, 16]
	bl	handleIN_CHARLIT
	str	w0, [sp, 28]
	b	.L33
.L35:
	ldr	w0, [sp, 16]
	bl	handleESCAPE_CHARLIT
	str	w0, [sp, 28]
.L33:
	bl	getchar
	str	w0, [sp, 16]
	ldr	w0, [sp, 16]
	cmn	w0, #1
	bne	.L43
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bne	.L44
	mov	w0, 47
	bl	putchar
.L44:
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L45
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bne	.L46
.L45:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	ldr	w2, [sp, 20]
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L47
.L46:
	mov	w0, 0
.L47:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.3.1 20221121 (Red Hat 11.3.1-4)"
	.section	.note.GNU-stack,"",@progbits
