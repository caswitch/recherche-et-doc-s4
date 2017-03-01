	.file	"factorielle.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%d\n"
.LC4:
	.string	"%llu"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB49:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edi, %edi
	movl	$20, %edx
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	%rsp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	read
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rsp, %rdi
	call	strtol
	movl	$.LC2, %esi
	movq	%rax, %rbx
	movl	%eax, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	testl	%ebx, %ebx
	jle	.L10
	leal	-4(%rbx), %eax
	leal	-1(%rbx), %edx
	shrl	$2, %eax
	addl	$1, %eax
	cmpl	$5, %edx
	leal	0(,%rax,4), %ecx
	jbe	.L11
	pxor	%xmm6, %xmm6
	movdqa	.LC0(%rip), %xmm0
	xorl	%edx, %edx
	movdqa	.LC1(%rip), %xmm2
	movdqa	.LC3(%rip), %xmm7
.L4:
	movdqa	%xmm6, %xmm3
	movdqa	%xmm2, %xmm1
	movdqa	%xmm0, %xmm5
	addl	$1, %edx
	pcmpgtd	%xmm2, %xmm3
	cmpl	%edx, %eax
	psrlq	$32, %xmm5
	punpckldq	%xmm3, %xmm1
	movdqa	%xmm1, %xmm4
	movdqa	%xmm1, %xmm8
	pmuludq	%xmm5, %xmm1
	pmuludq	%xmm0, %xmm4
	psrlq	$32, %xmm8
	pmuludq	%xmm8, %xmm0
	paddq	%xmm1, %xmm0
	movdqa	%xmm2, %xmm1
	psllq	$32, %xmm0
	paddq	%xmm4, %xmm0
	movdqa	%xmm0, %xmm4
	paddd	%xmm7, %xmm2
	punpckhdq	%xmm3, %xmm1
	psrlq	$32, %xmm4
	movdqa	%xmm1, %xmm3
	movdqa	%xmm1, %xmm5
	pmuludq	%xmm4, %xmm1
	pmuludq	%xmm0, %xmm3
	psrlq	$32, %xmm5
	pmuludq	%xmm5, %xmm0
	paddq	%xmm1, %xmm0
	psllq	$32, %xmm0
	paddq	%xmm3, %xmm0
	ja	.L4
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm3
	movdqa	%xmm0, %xmm1
	cmpl	%ecx, %ebx
	psrldq	$8, %xmm2
	movdqa	%xmm2, %xmm4
	pmuludq	%xmm2, %xmm3
	psrlq	$32, %xmm1
	leal	1(%rcx), %eax
	pmuludq	%xmm2, %xmm1
	psrlq	$32, %xmm4
	pmuludq	%xmm4, %xmm0
	paddq	%xmm0, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm3, %xmm1
	movq	%xmm1, %r8
	je	.L2
.L3:
	movslq	%eax, %rdx
	imulq	%rdx, %r8
	leal	1(%rax), %edx
	cmpl	%edx, %ebx
	jl	.L2
	movslq	%edx, %rdx
	imulq	%rdx, %r8
	leal	2(%rax), %edx
	cmpl	%edx, %ebx
	jl	.L2
	movslq	%edx, %rdx
	imulq	%rdx, %r8
	leal	3(%rax), %edx
	cmpl	%edx, %ebx
	jl	.L2
	movslq	%edx, %rdx
	imulq	%rdx, %r8
	leal	4(%rax), %edx
	cmpl	%edx, %ebx
	jl	.L2
	movslq	%edx, %rdx
	addl	$5, %eax
	imulq	%rdx, %r8
	cmpl	%eax, %ebx
	jl	.L2
	cltq
	imulq	%rax, %r8
.L2:
	movl	$.LC4, %ecx
	movl	$20, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	xorl	%eax, %eax
	call	__sprintf_chk
	movl	$20, %edx
	movq	%rsp, %rsi
	movl	$1, %edi
	call	write
	xorl	%eax, %eax
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L17
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	movl	$1, %r8d
	movl	$1, %eax
	jmp	.L3
.L10:
	movl	$1, %r8d
	jmp	.L2
.L17:
	call	__stack_chk_fail
	.cfi_endproc
.LFE49:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	1
	.quad	1
	.align 16
.LC1:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
