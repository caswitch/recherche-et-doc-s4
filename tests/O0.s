	.file	"factorielle.c"
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%llu"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$1, -40(%rbp)
	leaq	-32(%rbp), %rax
	movl	$20, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$1, -48(%rbp)
	jmp	.L2
.L3:
	movl	-48(%rbp), %eax
	cltq
	movq	-40(%rbp), %rdx
	imulq	%rdx, %rax
	movq	%rax, -40(%rbp)
	addl	$1, -48(%rbp)
.L2:
	movl	-48(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L3
	movq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-32(%rbp), %rax
	movl	$20, %edx
	movq	%rax, %rsi
	movl	$1, %edi
	call	write
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L5
	call	__stack_chk_fail
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
