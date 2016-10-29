.globl Factorial
	.type	Factorial, @function
Factorial:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$1, -8(%ebp)
	movl	$1, -4(%ebp)
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax
	imull	-4(%ebp), %eax
	movl	%eax, -8(%ebp)
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	8(%ebp), %eax
	jle	.L3
	movl	-8(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	Factorial, .-Factorial
	.globl	nCr
	.type	nCr, @function

.globl nCr
	.type	nCr, @function
nCr:
  # Your code for nCr should go here
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 3, -12
	pushl	8(%ebp)
	call	Factorial
	addl	$4, %esp
	movl	%eax, -8(%ebp)
	pushl	12(%ebp)
	call	Factorial
	addl	$4, %esp
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	subl	12(%ebp), %eax
	pushl	%eax
	call	Factorial
	addl	$4, %esp
	imull	%ebx, %eax
	movl	%eax, -12(%ebp)
	movl	-8(%ebp), %eax
	cltd
	idivl	-12(%ebp)
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	nCr, .-nCr
	.ident	"GCC: (Debian 5.3.1-12) 5.3.1 20160316"
	.section	.note.GNU-stack,"",@progbits
