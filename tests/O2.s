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
	.p2align 4,,15
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
	xorl	%edi, %edi
	movl	$20, %edx
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	movq	%rsp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	read
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rsp, %rdi
	call	strtol
	movl	$.LC0, %esi
	movq	%rax, %rbp
	movl	%eax, %edx
	movl	%eax, %ebx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	testl	%ebp, %ebp
	jle	.L5
	movl	$1, %eax
	movl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	imulq	%rax, %r8
	addq	$1, %rax
	cmpl	%eax, %ebx
	jge	.L3
.L2:
	movl	$.LC1, %ecx
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
	jne	.L9
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movl	$1, %r8d
	jmp	.L2
.L9:
	call	__stack_chk_fail
	.cfi_endproc
.LFE49:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE2:
	.section	.text.startup
.LHOTE2:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
