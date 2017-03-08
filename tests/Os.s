	.file	"factorielle.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%llu"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.section	.text.startup,"ax",@progbits
.LHOTB2:
	.globl	main
	.type	main, @function
main:
.LFB31:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$20, %edx
	xorl	%edi, %edi
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	leaq	4(%rsp), %rsi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	read
	leaq	4(%rsp), %rdi
	call	atoi
	movl	$.LC0, %esi
	movl	%eax, %edx
	movl	%eax, %ebx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movl	$1, %r8d
.L2:
	incq	%rax
	cmpl	%eax, %ebx
	jl	.L7
	imulq	%rax, %r8
	jmp	.L2
.L7:
	leaq	4(%rsp), %rdi
	movl	$.LC1, %ecx
	movl	$20, %edx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__sprintf_chk
	leaq	4(%rsp), %rsi
	movl	$20, %edx
	movl	$1, %edi
	call	write
	xorl	%eax, %eax
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L4
	call	__stack_chk_fail
.L4:
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
