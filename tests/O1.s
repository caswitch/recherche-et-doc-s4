	.file	"factorielle.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
.LC1:
	.string	"%llu"
	.text
	.globl	main
	.type	main, @function
main:
.LFB49:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movl	$20, %edx
	movq	%rsp, %rsi
	movl	$0, %edi
	call	read
	movl	$10, %edx
	movl	$0, %esi
	movq	%rsp, %rdi
	call	strtol
	movq	%rax, %rbp
	movl	%eax, %ebx
	movl	%eax, %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	testl	%ebp, %ebp
	jle	.L5
	movl	$1, %r8d
	movl	$1, %eax
.L3:
	movslq	%eax, %rdx
	imulq	%rdx, %r8
	addl	$1, %eax
	cmpl	%ebx, %eax
	jle	.L3
	jmp	.L2
.L5:
	movl	$1, %r8d
.L2:
	movl	$.LC1, %ecx
	movl	$20, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	movl	$0, %eax
	call	__sprintf_chk
	movl	$20, %edx
	movq	%rsp, %rsi
	movl	$1, %edi
	call	write
	movl	$0, %eax
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L4
	call	__stack_chk_fail
.L4:
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE49:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
