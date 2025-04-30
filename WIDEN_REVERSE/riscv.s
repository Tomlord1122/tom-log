	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"av.c"
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_reify                   # -- Begin function Perl_av_reify
	.p2align	1
	.type	Perl_av_reify,@function
Perl_av_reify:                          # @Perl_av_reify
	.cfi_startproc
# %bb.0:                                # %entry
	ld	a2, 0(a0)
	lbu	a1, 72(a2)
	andi	a1, a1, 1
	bnez	a1, .LBB0_16
# %bb.1:                                # %if.end
	lw	a3, 16(a2)
	ld	a1, 8(a2)
	addiw	a3, a3, 1
	addi	a4, a1, 1
	lui	a6, %hi(PL_sv_undef)
	addi	a6, a6, %lo(PL_sv_undef)
	bge	a4, a3, .LBB0_4
# %bb.2:                                # %while.body.preheader
	slli	a4, a3, 3
	addi	a4, a4, -8
	mv	a5, a3
.LBB0_3:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a2)
	add	a2, a2, a4
	sd	a6, 0(a2)
	ld	a2, 0(a0)
	ld	a1, 8(a2)
	addi	a5, a5, -1
	addi	a1, a1, 1
	addi	a4, a4, -8
	addiw	a3, a3, -1
	blt	a1, a5, .LBB0_3
.LBB0_4:                                # %while.cond8.preheader
	beqz	a3, .LBB0_11
# %bb.5:                                # %while.body10.preheader
	slli	a2, a3, 3
	addi	a2, a2, -8
	li	a3, -8
	lui	a4, %hi(PL_Sv)
	j	.LBB0_7
.LBB0_6:                                # %if.end21
                                        #   in Loop: Header=BB0_7 Depth=1
	addi	a2, a2, -8
	beq	a2, a3, .LBB0_10
.LBB0_7:                                # %while.body10
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	add	a1, a1, a2
	ld	a5, 0(a1)
	beq	a5, a6, .LBB0_6
# %bb.8:                                # %if.then18
                                        #   in Loop: Header=BB0_7 Depth=1
	sd	a5, %lo(PL_Sv)(a4)
	beqz	a5, .LBB0_6
# %bb.9:                                # %land.rhs
                                        #   in Loop: Header=BB0_7 Depth=1
	lw	a1, 8(a5)
	addi	a1, a1, 1
	sw	a1, 8(a5)
	j	.LBB0_6
.LBB0_10:                               # %while.end22.loopexit
	ld	a2, 0(a0)
.LBB0_11:                               # %while.end22
	ld	a1, 0(a2)
	ld	a3, 56(a2)
	sub	a3, a1, a3
	li	a1, 1
	slli	a1, a1, 35
	addi	a1, a1, -8
	and	a1, a1, a3
	beqz	a1, .LBB0_15
# %bb.12:                               # %while.body29.preheader
	slli	a3, a3, 29
	srai	a3, a3, 32
	slli	a2, a3, 3
	addi	a2, a2, -8
	li	a3, -8
.LBB0_13:                               # %while.body29
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 0(a0)
	ld	a1, 56(a1)
	add	a1, a1, a2
	addi	a2, a2, -8
	sd	a6, 0(a1)
	bne	a2, a3, .LBB0_13
# %bb.14:                               # %while.end35.loopexit
	ld	a2, 0(a0)
.LBB0_15:                               # %while.end35
	lbu	a1, 72(a2)
	andi	a1, a1, 253
	sb	a1, 72(a2)
	ld	a0, 0(a0)
	lbu	a1, 72(a0)
	ori	a1, a1, 1
	sb	a1, 72(a0)
.LBB0_16:                               # %cleanup
	ret
.Lfunc_end0:
	.size	Perl_av_reify, .Lfunc_end0-Perl_av_reify
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.section	.srodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function Perl_av_extend
.LCPI1_0:
	.quad	7378697629483820647             # 0x6666666666666667
	.text
	.globl	Perl_av_extend
	.p2align	1
	.type	Perl_av_extend,@function
Perl_av_extend:                         # @Perl_av_extend
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	sd	s8, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	mv	s8, a0
	lbu	a0, 13(a0)
	andi	a0, a0, 128
	mv	s2, a1
	beqz	a0, .LBB1_20
# %bb.1:                                # %cond.end
	li	a1, 80
	mv	a0, s8
	call	Perl_mg_find
	beqz	a0, .LBB1_20
# %bb.2:                                # %if.then
	mv	s3, a0
	lui	s4, %hi(PL_stack_sp)
	ld	s1, %lo(PL_stack_sp)(s4)
	call	Perl_push_scope
	lui	s0, %hi(PL_tmps_floor)
	addi	a0, s0, %lo(PL_tmps_floor)
	call	Perl_save_int
	lui	s5, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s5)
	lui	a1, %hi(PL_tmps_ix)
	lw	a1, %lo(PL_tmps_ix)(a1)
	ld	a0, 40(a0)
	sw	a1, %lo(PL_tmps_floor)(s0)
	bnez	a0, .LBB1_4
# %bb.3:                                # %if.then3
	li	a0, 32
	li	a1, 13
	call	Perl_new_stackinfo
	ld	a1, %lo(PL_curstackinfo)(s5)
	sd	a1, 32(a0)
	sd	a0, 40(a1)
.LBB1_4:                                # %if.end
	li	a1, 2
	ld	a2, 0(a0)
	sw	a1, 24(a0)
	li	a1, -1
	sw	a1, 16(a0)
	ld	a1, 0(a2)
	lui	a2, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a2)
	lui	s6, %hi(PL_stack_base)
	ld	a4, %lo(PL_stack_base)(s6)
	sd	zero, 8(a1)
	ld	a1, 0(a3)
	sub	s1, s1, a4
	srai	s1, s1, 3
	sd	s1, 8(a1)
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(s6)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 16(a3)
	slli	a3, a3, 3
	add	a3, a3, a1
	lui	s7, %hi(PL_stack_max)
	sd	a3, %lo(PL_stack_max)(s7)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 8(a3)
	slli	a3, a3, 3
	add	s1, a1, a3
	sd	s1, %lo(PL_stack_sp)(s4)
	ld	a3, 0(a0)
	lui	s0, %hi(PL_markstack_ptr)
	ld	a4, %lo(PL_markstack_ptr)(s0)
	lui	a5, %hi(PL_markstack_max)
	ld	a5, %lo(PL_markstack_max)(a5)
	sd	a3, %lo(PL_curstack)(a2)
	sd	a0, %lo(PL_curstackinfo)(s5)
	addi	a0, a4, 4
	sd	a0, %lo(PL_markstack_ptr)(s0)
	bne	a0, a5, .LBB1_6
# %bb.5:                                # %if.then17
	call	Perl_markstack_grow
	ld	a1, %lo(PL_stack_base)(s6)
	ld	a0, %lo(PL_markstack_ptr)(s0)
.LBB1_6:                                # %if.end18
	sub	a1, s1, a1
	srli	a1, a1, 3
	sw	a1, 0(a0)
	ld	a0, %lo(PL_stack_max)(s7)
	sub	a0, a0, s1
	li	a1, 8
	blt	a1, a0, .LBB1_8
# %bb.7:                                # %if.then30
	li	a2, 2
	mv	a0, s1
	mv	a1, s1
	call	Perl_stack_grow
	mv	s1, a0
.LBB1_8:                                # %if.end32
	ld	a0, 24(s3)
	bnez	a0, .LBB1_10
# %bb.9:                                # %cond.false36
	mv	a0, s8
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB1_10:                               # %cond.end39
	sd	a0, 8(s1)
	addiw	a0, s2, 1
	call	Perl_newSViv
	call	Perl_sv_2mortal
	addi	a1, s1, 16
	sd	a0, 16(s1)
	lui	s3, %hi(PL_stack_sp)
	sd	a1, %lo(PL_stack_sp)(s3)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	li	a1, 2
	call	Perl_call_method
	lui	s2, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s2)
	ld	s1, 32(a0)
	ld	s0, %lo(PL_stack_sp)(s3)
	bnez	s1, .LBB1_17
# %bb.11:                               # %if.then50
	lui	a0, %hi(PL_stderrgv)
	ld	a0, %lo(PL_stderrgv)(a0)
	beqz	a0, .LBB1_15
# %bb.12:                               # %land.lhs.true
	lbu	a1, 12(a0)
	li	a2, 13
	bne	a1, a2, .LBB1_15
# %bb.13:                               # %land.lhs.true56
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 16(a0)
	beqz	a0, .LBB1_15
# %bb.14:                               # %land.lhs.true59
	ld	a0, 0(a0)
	ld	a0, 64(a0)
	bnez	a0, .LBB1_16
.LBB1_15:                               # %cond.false71
	call	Perl_PerlIO_stderr
.LBB1_16:                               # %cond.end73
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	PerlIO_printf
	li	a0, 1
	call	Perl_my_exit
.LBB1_17:                               # %if.end76
	lui	a0, %hi(PL_curstack)
	ld	a1, %lo(PL_curstack)(a0)
	lui	a2, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a2)
	ld	a1, 0(a1)
	sub	s0, s0, a3
	srai	s0, s0, 3
	sd	s0, 8(a1)
	ld	a1, 0(s1)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(a2)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 16(a2)
	slli	a2, a2, 3
	add	a2, a2, a1
	lui	a3, %hi(PL_stack_max)
	sd	a2, %lo(PL_stack_max)(a3)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 8(a2)
	slli	a2, a2, 3
	add	a1, a1, a2
	sd	a1, %lo(PL_stack_sp)(s3)
	ld	a1, 0(s1)
	lui	a2, %hi(PL_tmps_ix)
	lw	a2, %lo(PL_tmps_ix)(a2)
	lui	a3, %hi(PL_tmps_floor)
	lw	a3, %lo(PL_tmps_floor)(a3)
	sd	a1, %lo(PL_curstack)(a0)
	sd	s1, %lo(PL_curstackinfo)(s2)
	bge	a3, a2, .LBB1_19
# %bb.18:                               # %if.then99
	call	Perl_free_tmps
.LBB1_19:                               # %if.end100
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	tail	Perl_pop_scope
.LBB1_20:                               # %if.end101
	ld	a2, 0(s8)
	ld	a0, 16(a2)
	bge	a0, s2, .LBB1_57
# %bb.21:                               # %if.then107
	ld	s1, 56(a2)
	ld	a1, 0(a2)
	beq	s1, a1, .LBB1_26
# %bb.22:                               # %if.then114
	ld	s3, 8(a2)
	sub	s4, a1, s1
	slli	s3, s3, 3
	addi	a2, s3, 8
	mv	a0, s1
	call	memmove
	ld	a0, 0(s8)
	ld	a2, 16(a0)
	slli	a1, s4, 29
	srai	a1, a1, 32
	add	a2, a2, a1
	sd	a2, 16(a0)
	ld	a0, 0(s8)
	ld	a2, 56(a0)
	sd	a2, 0(a0)
	ld	a0, 0(s8)
	lbu	a2, 72(a0)
	andi	a2, a2, 1
	beqz	a2, .LBB1_34
# %bb.23:                               # %if.then114
	li	a2, 1
	slli	a2, a2, 35
	addi	a2, a2, -8
	and	a2, s4, a2
	beqz	a2, .LBB1_34
# %bb.24:                               # %while.body.preheader
	li	a3, 4
	lui	a0, %hi(PL_sv_undef)
	addi	a0, a0, %lo(PL_sv_undef)
	bgeu	a1, a3, .LBB1_28
# %bb.25:
	mv	a2, a1
	j	.LBB1_31
.LBB1_26:                               # %if.else
	beqz	s1, .LBB1_45
# %bb.27:                               # %if.then166
	lui	a1, %hi(.LCPI1_0)
	ld	a1, %lo(.LCPI1_0)(a1)
	mulh	a0, a0, a1
	srli	a1, a0, 63
	srai	a0, a0, 1
	add	a0, a0, a1
	j	.LBB1_35
.LBB1_28:                               # %vector.ph
	andi	a2, a1, 3
	andi	a6, a1, -4
	slli	a4, a1, 3
	add	a5, s3, s1
	add	a4, a4, a5
	addi	a5, a4, -24
	li	s0, -32
	vsetivli	zero, 4, e64, m2, ta, ma
	vmv.v.x	v8, a0
	vrev.v	v8, v8
	mv	a4, a6
.LBB1_29:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vs2r.v	v8, (a5)
	sub	a4, a4, a3
	add	a5, a5, s0
	bnez	a4, .LBB1_29
# %bb.30:                               # %middle.block
	beq	a1, a6, .LBB1_33
.LBB1_31:                               # %scalar.ph
	slli	a1, a2, 3
	add	a1, a1, s3
	add	s1, s1, a1
.LBB1_32:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a2, a2, -1
	sd	a0, 0(s1)
	addi	s1, s1, -8
	bnez	a2, .LBB1_32
.LBB1_33:                               # %if.end150.loopexit
	ld	a0, 0(s8)
.LBB1_34:                               # %if.end150
	ld	a0, 16(a0)
	addi	a1, a0, -10
	bge	a1, s2, .LBB1_57
.LBB1_35:                               # %resize
	add	a0, a0, s2
	addiw	a0, a0, 1
	slli	a0, a0, 3
	li	a1, 16
.LBB1_36:                               # %while.cond175
                                        # =>This Inner Loop Header: Depth=1
	addi	a2, a1, -16
	slli	a1, a1, 1
	bltu	a2, a0, .LBB1_36
# %bb.37:                               # %while.end181
	srli	s2, a2, 3
	addiw	s2, s2, -1
	slli	a0, a2, 29
	srai	a0, a0, 29
	call	Perl_safesysmalloc
	ld	a1, 0(s8)
	ld	a2, 16(a1)
	ld	a1, 56(a1)
	mv	s1, a0
	slli	a2, a2, 3
	addi	a2, a2, 8
	call	memcpy
	ld	a0, 0(s8)
	ld	a1, 16(a0)
	ld	a0, 56(a0)
	li	a2, 65
	blt	a1, a2, .LBB1_42
# %bb.38:                               # %if.then200
	lui	a2, %hi(PL_nice_chunk_size)
	lw	a2, %lo(PL_nice_chunk_size)(a2)
	slli	a1, a1, 3
	addiw	s0, a1, 8
	bgeu	a2, s0, .LBB1_42
# %bb.39:                               # %if.then210
	lui	s3, %hi(PL_nice_chunk)
	ld	a1, %lo(PL_nice_chunk)(s3)
	beqz	a1, .LBB1_41
# %bb.40:                               # %if.then212
	mv	s4, a0
	mv	a0, a1
	call	Perl_safesysfree
	mv	a0, s4
.LBB1_41:                               # %if.end213
	sd	a0, %lo(PL_nice_chunk)(s3)
	lui	a0, %hi(PL_nice_chunk_size)
	sw	s0, %lo(PL_nice_chunk_size)(a0)
	j	.LBB1_43
.LBB1_42:                               # %if.else218
	call	Perl_safesysfree
.LBB1_43:                               # %if.end221
	ld	a0, 0(s8)
	sd	s1, 56(a0)
	ld	a0, 0(s8)
	ld	a1, 56(a0)
	ld	a2, 16(a0)
	lui	a0, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a0)
	slli	a0, a2, 3
	add	a0, a0, a1
	subw	s1, s2, a2
	bne	a3, s8, .LBB1_46
# %bb.44:                               # %if.then237
	lui	a2, %hi(PL_stack_sp)
	ld	a3, %lo(PL_stack_sp)(a2)
	lui	a4, %hi(PL_stack_base)
	ld	a5, %lo(PL_stack_base)(a4)
	sub	a3, a3, a5
	add	a1, a1, a3
	sd	a1, %lo(PL_stack_sp)(a2)
	ld	a1, 0(s8)
	ld	a1, 56(a1)
	sd	a1, %lo(PL_stack_base)(a4)
	slli	a2, s2, 3
	add	a1, a1, a2
	lui	a2, %hi(PL_stack_max)
	sd	a1, %lo(PL_stack_max)(a2)
	j	.LBB1_46
.LBB1_45:                               # %if.else249
	li	a0, 3
	max	s1, s2, a0
	slli	a0, s1, 3
	addi	a0, a0, 8
	call	Perl_safesysmalloc
	ld	a1, 0(s8)
	sd	a0, 56(a1)
	ld	a0, 0(s8)
	ld	a0, 56(a0)
	lui	a1, %hi(PL_sv_undef)
	addi	a1, a1, %lo(PL_sv_undef)
	sd	a1, 0(a0)
	mv	s2, s1
.LBB1_46:                               # %if.end268
	ld	a1, 0(s8)
	lbu	a2, 72(a1)
	andi	a2, a2, 1
	beqz	a2, .LBB1_56
# %bb.47:                               # %if.end268
	beqz	s1, .LBB1_56
# %bb.48:                               # %while.body277.preheader
	li	a2, 4
	bgeu	s1, a2, .LBB1_50
# %bb.49:
	mv	a1, s1
	j	.LBB1_53
.LBB1_50:                               # %vector.ph407
	andi	a1, s1, 3
	andi	s0, s1, -4
	slli	a3, s1, 3
	add	a3, a3, a0
	addi	a4, a3, -24
	li	a5, -32
	lui	a3, %hi(PL_sv_undef)
	addi	a3, a3, %lo(PL_sv_undef)
	vsetivli	zero, 4, e64, m2, ta, ma
	vmv.v.x	v8, a3
	vrev.v	v8, v8
	mv	a3, s0
.LBB1_51:                               # %vector.body412
                                        # =>This Inner Loop Header: Depth=1
	vs2r.v	v8, (a4)
	sub	a3, a3, a2
	add	a4, a4, a5
	bnez	a3, .LBB1_51
# %bb.52:                               # %middle.block404
	beq	s1, s0, .LBB1_55
.LBB1_53:                               # %scalar.ph405
	slli	a2, a1, 3
	add	a0, a0, a2
	lui	a2, %hi(PL_sv_undef)
	addi	a2, a2, %lo(PL_sv_undef)
.LBB1_54:                               # %while.body277
                                        # =>This Inner Loop Header: Depth=1
	addi	a1, a1, -1
	sd	a2, 0(a0)
	addi	a0, a0, -8
	bnez	a1, .LBB1_54
.LBB1_55:                               # %if.end282.loopexit
	ld	a1, 0(s8)
.LBB1_56:                               # %if.end282
	ld	a0, 56(a1)
	sd	a0, 0(a1)
	ld	a0, 0(s8)
	sd	s2, 16(a0)
.LBB1_57:                               # %cleanup
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end1:
	.size	Perl_av_extend, .Lfunc_end1-Perl_av_extend
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_fetch                   # -- Begin function Perl_av_fetch
	.p2align	1
	.type	Perl_av_fetch,@function
Perl_av_fetch:                          # @Perl_av_fetch
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	beqz	a0, .LBB2_34
# %bb.1:                                # %if.end
	mv	s2, a1
	mv	s1, a0
	lbu	a0, 13(a0)
	andi	a0, a0, 128
	bnez	a0, .LBB2_5
.LBB2_2:                                # %if.end113
	bgez	s2, .LBB2_21
# %bb.3:                                # %if.then116
	lbu	a0, 13(s1)
	andi	a0, a0, 128
	bnez	a0, .LBB2_19
# %bb.4:                                # %cond.false123
	ld	a0, 0(s1)
	ld	a0, 8(a0)
	j	.LBB2_20
.LBB2_5:                                # %if.then2
	mv	s0, a2
	li	a1, 80
	mv	a0, s1
	call	Perl_mg_find
	beqz	a0, .LBB2_15
# %bb.6:                                # %if.then6
	bgez	s2, .LBB2_32
# %bb.7:                                # %if.then8
	ld	a0, 24(a0)
	bnez	a0, .LBB2_9
# %bb.8:                                # %cond.false
	mv	a0, s1
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB2_9:                                # %cond.end
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 48(a0)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	li	a2, 16
	li	a3, 0
	call	Perl_hv_fetch
	beqz	a0, .LBB2_17
# %bb.10:                               # %land.lhs.true16
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 0(a0)
	beqz	a0, .LBB2_17
# %bb.11:                               # %cond.false20
	lwu	a1, 12(a0)
	slli	a2, a1, 45
	bltz	a2, .LBB2_35
# %bb.12:                               # %cond.false43
	slli	a2, a1, 47
	bltz	a2, .LBB2_39
# %bb.13:                               # %cond.false57
	slli	a1, a1, 46
	bltz	a1, .LBB2_40
# %bb.14:                               # %cond.false71
	call	Perl_sv_2bool
	bnez	a0, .LBB2_32
	j	.LBB2_17
.LBB2_15:                               # %lor.lhs.false
	li	a1, 68
	mv	a0, s1
	call	Perl_mg_find
	mv	a2, s0
	beqz	a0, .LBB2_2
# %bb.16:                               # %if.end80
	bgez	s2, .LBB2_32
.LBB2_17:                               # %if.then85
	lbu	a0, 13(s1)
	andi	a0, a0, 128
	bnez	a0, .LBB2_30
# %bb.18:                               # %cond.false92
	ld	a0, 0(s1)
	ld	a0, 8(a0)
	j	.LBB2_31
.LBB2_19:                               # %cond.true120
	mv	a0, s1
	mv	s0, a2
	call	Perl_mg_size
	mv	a2, s0
.LBB2_20:                               # %cond.end126
	add	a0, a0, s2
	addiw	s2, a0, 1
	bltz	s2, .LBB2_33
.LBB2_21:                               # %if.end136
	ld	a3, 0(s1)
	ld	a0, 8(a3)
	bge	a0, s2, .LBB2_23
# %bb.22:                               # %if.then142
	bnez	a2, .LBB2_29
	j	.LBB2_33
.LBB2_23:                               # %if.end148
	ld	a0, 0(a3)
	slli	a1, s2, 3
	add	a0, a0, a1
	ld	a4, 0(a0)
	lui	a1, %hi(PL_sv_undef)
	addi	a1, a1, %lo(PL_sv_undef)
	beq	a4, a1, .LBB2_28
# %bb.24:                               # %if.else
	lbu	a3, 72(a3)
	andi	a3, a3, 2
	beqz	a3, .LBB2_34
# %bb.25:                               # %land.lhs.true162
	beqz	a4, .LBB2_27
# %bb.26:                               # %lor.lhs.false168
	lbu	a3, 12(a4)
	li	a4, 255
	bne	a3, a4, .LBB2_34
.LBB2_27:                               # %if.then177
	sd	a1, 0(a0)
.LBB2_28:                               # %emptyness
	beqz	a2, .LBB2_33
.LBB2_29:                               # %if.end145
	li	a0, 0
	call	Perl_newSV
	mv	a2, a0
	mv	a0, s1
	mv	a1, s2
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	Perl_av_store
.LBB2_30:                               # %cond.true89
	mv	a0, s1
	call	Perl_mg_size
.LBB2_31:                               # %cond.end94
	add	a0, a0, s2
	addiw	s2, a0, 1
	bltz	s2, .LBB2_33
.LBB2_32:                               # %if.end103
	call	Perl_sv_newmortal
	mv	s0, a0
	li	a1, 9
	call	Perl_sv_upgrade
	mv	a0, s1
	mv	a1, s0
	li	a2, 0
	mv	a3, s2
	call	Perl_mg_copy
	ld	a0, 0(s0)
	li	a1, 116
	sb	a1, 80(a0)
	ld	a0, 0(s0)
	sd	s0, 72(a0)
	ld	a0, 0(s0)
	addi	a0, a0, 72
	j	.LBB2_34
.LBB2_33:
	li	a0, 0
.LBB2_34:                               # %cleanup188
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.LBB2_35:                               # %cond.true27
	ld	a0, 0(a0)
	lui	a1, %hi(PL_Xpv)
	sd	a0, %lo(PL_Xpv)(a1)
	beqz	a0, .LBB2_17
# %bb.36:                               # %land.lhs.true33
	ld	a1, 8(a0)
	li	a2, 1
	bltu	a2, a1, .LBB2_32
# %bb.37:                               # %lor.lhs.false35
	beqz	a1, .LBB2_17
# %bb.38:                               # %land.lhs.true38
	ld	a0, 0(a0)
	lbu	a0, 0(a0)
	li	a1, 48
	beq	a0, a1, .LBB2_17
	j	.LBB2_32
.LBB2_39:                               # %cond.true50
	ld	a0, 0(a0)
	ld	a0, 24(a0)
	bnez	a0, .LBB2_32
	j	.LBB2_17
.LBB2_40:                               # %cond.true64
	ld	a0, 0(a0)
	fld	fa5, 32(a0)
	fmv.d.x	fa4, zero
	feq.d	a0, fa5, fa4
	beqz	a0, .LBB2_32
	j	.LBB2_17
.Lfunc_end2:
	.size	Perl_av_fetch, .Lfunc_end2-Perl_av_fetch
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_store                   # -- Begin function Perl_av_store
	.p2align	1
	.type	Perl_av_store,@function
Perl_av_store:                          # @Perl_av_store
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB3_58
# %bb.1:                                # %if.end
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	mv	s2, a2
	mv	s3, a1
	mv	s0, a0
	bnez	a2, .LBB3_3
# %bb.2:
	lui	s2, %hi(PL_sv_undef)
	addi	s2, s2, %lo(PL_sv_undef)
.LBB3_3:                                # %if.end
	lwu	a0, 12(s0)
	slli	a1, a0, 48
	bgez	a1, .LBB3_15
# %bb.4:                                # %if.then5
	li	a1, 80
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB3_14
# %bb.5:                                # %if.then7
	bgez	s3, .LBB3_54
# %bb.6:                                # %if.then8
	ld	a0, 24(a0)
	bnez	a0, .LBB3_8
# %bb.7:                                # %cond.false
	mv	a0, s0
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB3_8:                                # %cond.end
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 48(a0)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	li	a2, 16
	li	a3, 0
	call	Perl_hv_fetch
	beqz	a0, .LBB3_50
# %bb.9:                                # %land.lhs.true
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 0(a0)
	beqz	a0, .LBB3_50
# %bb.10:                               # %cond.false19
	lwu	a1, 12(a0)
	slli	a2, a1, 45
	bltz	a2, .LBB3_44
# %bb.11:                               # %cond.false41
	slli	a2, a1, 47
	bltz	a2, .LBB3_48
# %bb.12:                               # %cond.false55
	slli	a1, a1, 46
	bltz	a1, .LBB3_49
# %bb.13:                               # %cond.false69
	call	Perl_sv_2bool
	bnez	a0, .LBB3_54
	j	.LBB3_50
.LBB3_14:                               # %if.then5.if.end109_crit_edge
	lw	a0, 12(s0)
.LBB3_15:                               # %if.end109
	bltz	s3, .LBB3_17
# %bb.16:                               # %if.end132
	slli	a1, a0, 40
	bltz	a1, .LBB3_22
	j	.LBB3_26
.LBB3_17:                               # %if.then112
	slli	a0, a0, 48
	bltz	a0, .LBB3_19
# %bb.18:                               # %cond.false119
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	j	.LBB3_20
.LBB3_19:                               # %cond.true116
	mv	a0, s0
	call	Perl_mg_size
.LBB3_20:                               # %cond.end122
	add	a0, a0, s3
	addiw	s3, a0, 1
	bltz	s3, .LBB3_56
# %bb.21:                               # %cond.end122.if.end132_crit_edge
	lw	a0, 12(s0)
	slli	a1, a0, 40
	bgez	a1, .LBB3_26
.LBB3_22:                               # %land.lhs.true136
	slli	a0, a0, 48
	bltz	a0, .LBB3_24
# %bb.23:                               # %cond.false144
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	bge	s3, a0, .LBB3_25
	j	.LBB3_26
.LBB3_24:                               # %cond.true141
	mv	a0, s0
	call	Perl_mg_size
	blt	s3, a0, .LBB3_26
.LBB3_25:                               # %if.then151
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
.LBB3_26:                               # %if.end152
	ld	a0, 0(s0)
	lbu	a1, 72(a0)
	andi	a1, a1, 3
	li	a2, 2
	bne	a1, a2, .LBB3_28
# %bb.27:                               # %if.then163
	mv	a0, s0
	call	Perl_av_reify
	ld	a0, 0(s0)
.LBB3_28:                               # %if.end164
	ld	a1, 16(a0)
	bge	a1, s3, .LBB3_30
# %bb.29:                               # %if.then169
	mv	a0, s0
	mv	a1, s3
	call	Perl_av_extend
	ld	a0, 0(s0)
.LBB3_30:                               # %if.end170
	lbu	a2, 72(a0)
	ld	a1, 8(a0)
	ld	s1, 0(a0)
	andi	a2, a2, 1
	slli	s4, s3, 3
	bge	a1, s3, .LBB3_38
# %bb.31:                               # %if.then177
	bnez	a2, .LBB3_37
# %bb.32:                               # %if.then183
	lui	a2, %hi(PL_curstack)
	ld	a2, %lo(PL_curstack)(a2)
	bne	a2, s0, .LBB3_35
# %bb.33:                               # %land.lhs.true186
	lui	a2, %hi(PL_stack_sp)
	ld	a4, %lo(PL_stack_sp)(a2)
	lui	a3, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a3)
	sub	a4, a4, a3
	srai	a4, a4, 3
	bge	a4, s3, .LBB3_35
# %bb.34:                               # %if.then190
	add	a3, a3, s4
	sd	a3, %lo(PL_stack_sp)(a2)
	ld	a0, 0(s0)
	ld	a1, 8(a0)
.LBB3_35:                               # %if.end191
	lui	a2, %hi(PL_sv_undef)
	addi	a2, a2, %lo(PL_sv_undef)
.LBB3_36:                               # %do.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a1, a1, 1
	sd	a1, 8(a0)
	slli	a1, a1, 3
	add	a1, a1, s1
	sd	a2, 0(a1)
	ld	a0, 0(s0)
	ld	a1, 8(a0)
	blt	a1, s3, .LBB3_36
.LBB3_37:                               # %if.end199
	sd	s3, 8(a0)
	j	.LBB3_40
.LBB3_38:                               # %if.else
	beqz	a2, .LBB3_40
# %bb.39:                               # %if.then208
	add	a0, s1, s4
	ld	a0, 0(a0)
	call	Perl_sv_free
.LBB3_40:                               # %if.end211
	add	a0, s1, s4
	sd	s2, 0(a0)
	lbu	a1, 13(s0)
	andi	a1, a1, 64
	beqz	a1, .LBB3_57
# %bb.41:                               # %if.then217
	mv	s1, a0
	lui	a0, %hi(PL_sv_undef)
	addi	a0, a0, %lo(PL_sv_undef)
	beq	s2, a0, .LBB3_43
# %bb.42:                               # %if.then220
	ld	a0, 0(s0)
	ld	a0, 40(a0)
	lbu	a0, 18(a0)
	addi	a1, a0, -65
	sltiu	a1, a1, 26
	slli	a1, a1, 5
	add	a0, a0, a1
	andi	a2, a0, 255
	mv	a0, s2
	mv	a1, s0
	li	a3, 0
	mv	a4, s3
	call	Perl_sv_magic
.LBB3_43:                               # %if.end239
	mv	a0, s0
	call	Perl_mg_set
	mv	a0, s1
	j	.LBB3_57
.LBB3_44:                               # %cond.true26
	ld	a0, 0(a0)
	lui	a1, %hi(PL_Xpv)
	sd	a0, %lo(PL_Xpv)(a1)
	beqz	a0, .LBB3_50
# %bb.45:                               # %land.lhs.true32
	ld	a1, 8(a0)
	li	a2, 1
	bltu	a2, a1, .LBB3_54
# %bb.46:                               # %lor.lhs.false
	beqz	a1, .LBB3_50
# %bb.47:                               # %land.lhs.true36
	ld	a0, 0(a0)
	lbu	a0, 0(a0)
	li	a1, 48
	beq	a0, a1, .LBB3_50
	j	.LBB3_54
.LBB3_48:                               # %cond.true48
	ld	a0, 0(a0)
	ld	a0, 24(a0)
	bnez	a0, .LBB3_54
	j	.LBB3_50
.LBB3_49:                               # %cond.true62
	ld	a0, 0(a0)
	fld	fa5, 32(a0)
	fmv.d.x	fa4, zero
	feq.d	a0, fa5, fa4
	beqz	a0, .LBB3_54
.LBB3_50:                               # %if.then79
	lbu	a0, 13(s0)
	andi	a0, a0, 128
	bnez	a0, .LBB3_52
# %bb.51:                               # %cond.false86
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	j	.LBB3_53
.LBB3_52:                               # %cond.true83
	mv	a0, s0
	call	Perl_mg_size
.LBB3_53:                               # %cleanup
	add	a0, a0, s3
	addiw	s3, a0, 1
	bltz	s3, .LBB3_56
.LBB3_54:                               # %if.end99
	lui	a0, %hi(PL_sv_undef)
	addi	a0, a0, %lo(PL_sv_undef)
	beq	s2, a0, .LBB3_56
# %bb.55:                               # %if.then102
	mv	a0, s0
	mv	a1, s2
	li	a2, 0
	mv	a3, s3
	call	Perl_mg_copy
.LBB3_56:
	li	a0, 0
.LBB3_57:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
.LBB3_58:                               # %cleanup244
	ret
.Lfunc_end3:
	.size	Perl_av_store, .Lfunc_end3-Perl_av_store
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_newAV                      # -- Begin function Perl_newAV
	.p2align	1
	.type	Perl_newAV,@function
Perl_newAV:                             # @Perl_newAV
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	li	a0, 0
	call	Perl_newSV
	mv	s0, a0
	li	a1, 10
	call	Perl_sv_upgrade
	ld	a0, 0(s0)
	lbu	a1, 72(a0)
	ori	a1, a1, 1
	sb	a1, 72(a0)
	ld	a0, 0(s0)
	sd	zero, 56(a0)
	ld	a0, 0(s0)
	sd	zero, 0(a0)
	ld	a0, 0(s0)
	li	a1, -1
	sd	a1, 8(a0)
	ld	a0, 0(s0)
	sd	a1, 16(a0)
	mv	a0, s0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	Perl_newAV, .Lfunc_end4-Perl_newAV
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_make                    # -- Begin function Perl_av_make
	.p2align	1
	.type	Perl_av_make,@function
Perl_av_make:                           # @Perl_av_make
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	mv	s0, a1
	mv	s3, a0
	li	a0, 0
	call	Perl_newSV
	mv	s2, a0
	li	a1, 10
	call	Perl_sv_upgrade
	ld	a0, 0(s2)
	li	a1, 1
	sb	a1, 72(a0)
	beqz	s3, .LBB5_4
# %bb.1:                                # %if.then
	slli	s4, s3, 3
	mv	a0, s4
	call	Perl_safesysmalloc
	ld	a1, 0(s2)
	mv	s1, a0
	sd	a0, 56(a1)
	ld	a0, 0(s2)
	sd	s1, 0(a0)
	ld	a0, 0(s2)
	addiw	a1, s3, -1
	sd	a1, 8(a0)
	ld	a0, 0(s2)
	sd	a1, 16(a0)
	blez	s3, .LBB5_4
# %bb.2:                                # %for.body.preheader
	add	s4, s4, s0
.LBB5_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	li	a0, 0
	call	Perl_newSV
	sd	a0, 0(s1)
	ld	a1, 0(s0)
	li	a2, 2
	call	Perl_sv_setsv_flags
	addi	s0, s0, 8
	addi	s1, s1, 8
	bne	s0, s4, .LBB5_3
.LBB5_4:                                # %if.end
	mv	a0, s2
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end5:
	.size	Perl_av_make, .Lfunc_end5-Perl_av_make
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_fake                    # -- Begin function Perl_av_fake
	.p2align	1
	.type	Perl_av_fake,@function
Perl_av_fake:                           # @Perl_av_fake
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	sd	s4, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	mv	s0, a1
	mv	s2, a0
	li	a0, 0
	call	Perl_newSV
	mv	s4, a0
	li	a1, 10
	call	Perl_sv_upgrade
	slli	s3, s2, 3
	addi	a0, s3, 8
	call	Perl_safesysmalloc
	ld	a1, 0(s4)
	mv	s1, a0
	sd	a0, 56(a1)
	mv	a1, s0
	mv	a2, s3
	call	memcpy
	ld	a1, 0(s4)
	li	a2, 2
	sb	a2, 72(a1)
	ld	a1, 0(s4)
	sd	s1, 0(a1)
	ld	a2, 0(s4)
	addiw	a1, s2, -1
	sd	a1, 8(a2)
	ld	a2, 0(s4)
	sd	a1, 16(a2)
	beqz	s2, .LBB6_3
# %bb.1:                                # %while.body.preheader
	slli	a1, a1, 32
	srli	a1, a1, 29
	add	a1, a1, s0
	addi	a1, a1, 8
	lui	a2, 1048575
	addi	a2, a2, 2047
.LBB6_2:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(s0)
	lwu	a4, 12(a3)
	and	a4, a4, a2
	addi	s0, s0, 8
	sw	a4, 12(a3)
	bne	s0, a1, .LBB6_2
.LBB6_3:                                # %while.end
	mv	a0, s4
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	ld	s4, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end6:
	.size	Perl_av_fake, .Lfunc_end6-Perl_av_fake
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_clear                   # -- Begin function Perl_av_clear
	.p2align	1
	.type	Perl_av_clear,@function
Perl_av_clear:                          # @Perl_av_clear
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB7_15
# %bb.1:                                # %if.end
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	mv	s2, a0
	lwu	a0, 12(a0)
	slli	a1, a0, 40
	bgez	a1, .LBB7_3
# %bb.2:                                # %if.then2
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
	lw	a0, 12(s2)
.LBB7_3:                                # %if.end3
	slli	a0, a0, 48
	bgez	a0, .LBB7_5
# %bb.4:                                # %if.then7
	mv	a0, s2
	call	Perl_mg_clear
.LBB7_5:                                # %if.end8
	ld	a0, 0(s2)
	ld	a1, 16(a0)
	bltz	a1, .LBB7_14
# %bb.6:                                # %if.end10
	lbu	a1, 72(a0)
	andi	a1, a1, 1
	beqz	a1, .LBB7_11
# %bb.7:                                # %if.then14
	lw	a1, 8(a0)
	addiw	a1, a1, 1
	beqz	a1, .LBB7_11
# %bb.8:                                # %while.body.preheader
	ld	s0, 0(a0)
	slli	a1, a1, 3
	addi	s0, s0, -8
	add	s1, s0, a1
	lui	s3, %hi(PL_sv_undef)
	addi	s3, s3, %lo(PL_sv_undef)
.LBB7_9:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s1)
	sd	s3, 0(s1)
	call	Perl_sv_free
	addi	s1, s1, -8
	bne	s1, s0, .LBB7_9
# %bb.10:                               # %if.end21.loopexit
	ld	a0, 0(s2)
.LBB7_11:                               # %if.end21
	ld	a1, 0(a0)
	ld	a2, 56(a0)
	sub	a1, a1, a2
	li	a2, 1
	slli	a2, a2, 35
	addi	a2, a2, -8
	and	a2, a2, a1
	beqz	a2, .LBB7_13
# %bb.12:                               # %if.then27
	ld	a2, 16(a0)
	slli	a1, a1, 29
	srai	a1, a1, 32
	add	a1, a1, a2
	sd	a1, 16(a0)
	ld	a0, 0(s2)
	ld	a1, 56(a0)
	sd	a1, 0(a0)
	ld	a0, 0(s2)
.LBB7_13:                               # %if.end35
	li	a1, -1
	sd	a1, 8(a0)
.LBB7_14:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
.LBB7_15:                               # %cleanup
	ret
.Lfunc_end7:
	.size	Perl_av_clear, .Lfunc_end7-Perl_av_clear
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_undef                   # -- Begin function Perl_av_undef
	.p2align	1
	.type	Perl_av_undef,@function
Perl_av_undef:                          # @Perl_av_undef
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB8_12
# %bb.1:                                # %if.end
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	mv	s0, a0
	lbu	a0, 13(a0)
	andi	a0, a0, 128
	beqz	a0, .LBB8_4
# %bb.2:                                # %cond.true
	li	a1, 80
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB8_4
# %bb.3:                                # %if.then3
	li	a1, -1
	mv	a0, s0
	call	Perl_av_fill
.LBB8_4:                                # %if.end4
	ld	a0, 0(s0)
	lbu	a1, 72(a0)
	andi	a1, a1, 1
	beqz	a1, .LBB8_9
# %bb.5:                                # %if.then7
	lw	a1, 8(a0)
	addiw	a1, a1, 1
	beqz	a1, .LBB8_9
# %bb.6:                                # %while.body.preheader
	slli	a1, a1, 3
	addi	s1, a1, -8
	li	s2, -8
.LBB8_7:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s0)
	ld	a0, 0(a0)
	add	a0, a0, s1
	ld	a0, 0(a0)
	call	Perl_sv_free
	addi	s1, s1, -8
	bne	s1, s2, .LBB8_7
# %bb.8:                                # %if.end12.loopexit
	ld	a0, 0(s0)
.LBB8_9:                                # %if.end12
	ld	a0, 56(a0)
	call	Perl_safesysfree
	ld	a0, 0(s0)
	sd	zero, 56(a0)
	ld	a0, 0(s0)
	sd	zero, 0(a0)
	ld	a0, 0(s0)
	li	a1, -1
	sd	a1, 8(a0)
	ld	a0, 0(s0)
	sd	a1, 16(a0)
	ld	a0, 0(s0)
	ld	a0, 64(a0)
	beqz	a0, .LBB8_11
# %bb.10:                               # %if.then22
	call	Perl_sv_free
	ld	a0, 0(s0)
	sd	zero, 64(a0)
.LBB8_11:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
.LBB8_12:                               # %cleanup
	ret
.Lfunc_end8:
	.size	Perl_av_undef, .Lfunc_end8-Perl_av_undef
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_fill                    # -- Begin function Perl_av_fill
	.p2align	1
	.type	Perl_av_fill,@function
Perl_av_fill:                           # @Perl_av_fill
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	sd	s8, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	.cfi_offset s8, -80
	mv	s1, a1
	mv	s8, a0
	bnez	a0, .LBB9_2
# %bb.1:                                # %if.then
	lui	a0, %hi(.L.str.7)
	addi	a0, a0, %lo(.L.str.7)
	call	Perl_croak
.LBB9_2:                                # %if.end
	lbu	a0, 13(s8)
	li	a1, -1
	andi	a0, a0, 128
	max	s3, s1, a1
	beqz	a0, .LBB9_22
# %bb.3:                                # %cond.end
	li	a1, 80
	mv	a0, s8
	call	Perl_mg_find
	beqz	a0, .LBB9_22
# %bb.4:                                # %if.then5
	mv	s2, a0
	lui	s4, %hi(PL_stack_sp)
	ld	s1, %lo(PL_stack_sp)(s4)
	call	Perl_push_scope
	lui	s0, %hi(PL_tmps_floor)
	addi	a0, s0, %lo(PL_tmps_floor)
	call	Perl_save_int
	lui	s5, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s5)
	lui	a1, %hi(PL_tmps_ix)
	lw	a1, %lo(PL_tmps_ix)(a1)
	ld	a0, 40(a0)
	sw	a1, %lo(PL_tmps_floor)(s0)
	bnez	a0, .LBB9_6
# %bb.5:                                # %if.then7
	li	a0, 32
	li	a1, 13
	call	Perl_new_stackinfo
	ld	a1, %lo(PL_curstackinfo)(s5)
	sd	a1, 32(a0)
	sd	a0, 40(a1)
.LBB9_6:                                # %if.end10
	li	a1, 2
	ld	a2, 0(a0)
	sw	a1, 24(a0)
	li	a1, -1
	sw	a1, 16(a0)
	ld	a1, 0(a2)
	lui	a2, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a2)
	lui	s6, %hi(PL_stack_base)
	ld	a4, %lo(PL_stack_base)(s6)
	sd	zero, 8(a1)
	ld	a1, 0(a3)
	sub	s1, s1, a4
	srai	s1, s1, 3
	sd	s1, 8(a1)
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(s6)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 16(a3)
	slli	a3, a3, 3
	add	a3, a3, a1
	lui	s7, %hi(PL_stack_max)
	sd	a3, %lo(PL_stack_max)(s7)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 8(a3)
	slli	a3, a3, 3
	add	s1, a1, a3
	sd	s1, %lo(PL_stack_sp)(s4)
	ld	a3, 0(a0)
	lui	s4, %hi(PL_markstack_ptr)
	ld	a4, %lo(PL_markstack_ptr)(s4)
	lui	a5, %hi(PL_markstack_max)
	ld	a5, %lo(PL_markstack_max)(a5)
	sd	a3, %lo(PL_curstack)(a2)
	sd	a0, %lo(PL_curstackinfo)(s5)
	addi	a0, a4, 4
	sd	a0, %lo(PL_markstack_ptr)(s4)
	bne	a0, a5, .LBB9_8
# %bb.7:                                # %if.then23
	call	Perl_markstack_grow
	ld	a1, %lo(PL_stack_base)(s6)
	ld	a0, %lo(PL_markstack_ptr)(s4)
.LBB9_8:                                # %if.end24
	sub	a1, s1, a1
	srli	a1, a1, 3
	sw	a1, 0(a0)
	ld	a0, %lo(PL_stack_max)(s7)
	sub	a0, a0, s1
	li	a1, 8
	blt	a1, a0, .LBB9_10
# %bb.9:                                # %if.then36
	li	a2, 2
	mv	a0, s1
	mv	a1, s1
	call	Perl_stack_grow
	mv	s1, a0
.LBB9_10:                               # %if.end38
	ld	a0, 24(s2)
	bnez	a0, .LBB9_12
# %bb.11:                               # %cond.false42
	mv	a0, s8
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB9_12:                               # %cond.end45
	sd	a0, 8(s1)
	addiw	a0, s3, 1
	call	Perl_newSViv
	call	Perl_sv_2mortal
	addi	a1, s1, 16
	sd	a0, 16(s1)
	lui	s3, %hi(PL_stack_sp)
	sd	a1, %lo(PL_stack_sp)(s3)
	lui	a0, %hi(.L.str.8)
	addi	a0, a0, %lo(.L.str.8)
	li	a1, 2
	call	Perl_call_method
	lui	s2, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s2)
	ld	s1, 32(a0)
	ld	s0, %lo(PL_stack_sp)(s3)
	bnez	s1, .LBB9_19
# %bb.13:                               # %if.then56
	lui	a0, %hi(PL_stderrgv)
	ld	a0, %lo(PL_stderrgv)(a0)
	beqz	a0, .LBB9_17
# %bb.14:                               # %land.lhs.true
	lbu	a1, 12(a0)
	li	a2, 13
	bne	a1, a2, .LBB9_17
# %bb.15:                               # %land.lhs.true62
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 16(a0)
	beqz	a0, .LBB9_17
# %bb.16:                               # %land.lhs.true65
	ld	a0, 0(a0)
	ld	a0, 64(a0)
	bnez	a0, .LBB9_18
.LBB9_17:                               # %cond.false77
	call	Perl_PerlIO_stderr
.LBB9_18:                               # %cond.end79
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	PerlIO_printf
	li	a0, 1
	call	Perl_my_exit
.LBB9_19:                               # %if.end82
	lui	a0, %hi(PL_curstack)
	ld	a1, %lo(PL_curstack)(a0)
	lui	a2, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a2)
	ld	a1, 0(a1)
	sub	s0, s0, a3
	srai	s0, s0, 3
	sd	s0, 8(a1)
	ld	a1, 0(s1)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(a2)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 16(a2)
	slli	a2, a2, 3
	add	a2, a2, a1
	lui	a3, %hi(PL_stack_max)
	sd	a2, %lo(PL_stack_max)(a3)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 8(a2)
	slli	a2, a2, 3
	add	a1, a1, a2
	sd	a1, %lo(PL_stack_sp)(s3)
	ld	a1, 0(s1)
	lui	a2, %hi(PL_tmps_ix)
	lw	a2, %lo(PL_tmps_ix)(a2)
	lui	a3, %hi(PL_tmps_floor)
	lw	a3, %lo(PL_tmps_floor)(a3)
	sd	a1, %lo(PL_curstack)(a0)
	sd	s1, %lo(PL_curstackinfo)(s2)
	bge	a3, a2, .LBB9_21
# %bb.20:                               # %if.then105
	call	Perl_free_tmps
.LBB9_21:                               # %if.end106
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	tail	Perl_pop_scope
.LBB9_22:                               # %if.end107
	ld	a0, 0(s8)
	ld	a1, 16(a0)
	bge	a1, s3, .LBB9_24
# %bb.23:                               # %if.else145
	lui	a2, %hi(PL_sv_undef)
	addi	a2, a2, %lo(PL_sv_undef)
	mv	a0, s8
	mv	a1, s3
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	tail	Perl_av_store
.LBB9_24:                               # %if.then113
	lbu	a2, 72(a0)
	lw	a1, 8(a0)
	ld	a0, 0(a0)
	andi	a2, a2, 1
	bnez	a2, .LBB9_28
# %bb.25:                               # %while.cond128.preheader
	bge	a1, s3, .LBB9_31
# %bb.26:                               # %while.body131.preheader
	slli	a1, a1, 3
	add	a1, a1, a0
	addi	a1, a1, 8
	slli	a2, s3, 3
	add	a0, a0, a2
	addi	a0, a0, 8
	lui	a2, %hi(PL_sv_undef)
	addi	a2, a2, %lo(PL_sv_undef)
.LBB9_27:                               # %while.body131
                                        # =>This Inner Loop Header: Depth=1
	sd	a2, 0(a1)
	addi	a1, a1, 8
	bne	a1, a0, .LBB9_27
	j	.LBB9_31
.LBB9_28:                               # %while.cond.preheader
	bge	s3, a1, .LBB9_31
# %bb.29:                               # %while.body.preheader
	slli	a1, a1, 3
	add	s1, a0, a1
	slli	s0, s3, 3
	add	s0, s0, a0
	lui	s2, %hi(PL_sv_undef)
	addi	s2, s2, %lo(PL_sv_undef)
.LBB9_30:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a0, 0(s1)
	call	Perl_sv_free
	sd	s2, 0(s1)
	addi	s1, s1, -8
	bne	s1, s0, .LBB9_30
.LBB9_31:                               # %if.end135
	ld	a0, 0(s8)
	sd	s3, 8(a0)
	lbu	a0, 13(s8)
	andi	a0, a0, 64
	bnez	a0, .LBB9_33
# %bb.32:                               # %cleanup
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.LBB9_33:                               # %if.then142
	mv	a0, s8
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	ld	s8, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	tail	Perl_mg_set
.Lfunc_end9:
	.size	Perl_av_fill, .Lfunc_end9-Perl_av_fill
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_push                    # -- Begin function Perl_av_push
	.p2align	1
	.type	Perl_av_push,@function
Perl_av_push:                           # @Perl_av_push
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	beqz	a0, .LBB10_21
# %bb.1:                                # %if.end
	mv	s3, a1
	mv	s1, a0
	lwu	a0, 12(a0)
	slli	a1, a0, 40
	bgez	a1, .LBB10_3
# %bb.2:                                # %if.then2
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
	lw	a0, 12(s1)
.LBB10_3:                               # %if.end3
	slli	a0, a0, 48
	bgez	a0, .LBB10_22
# %bb.4:                                # %cond.end
	li	a1, 80
	mv	a0, s1
	call	Perl_mg_find
	beqz	a0, .LBB10_22
# %bb.5:                                # %if.then8
	mv	s2, a0
	lui	s4, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s4)
	lui	s5, %hi(PL_stack_sp)
	ld	a0, 40(a0)
	ld	s0, %lo(PL_stack_sp)(s5)
	bnez	a0, .LBB10_7
# %bb.6:                                # %if.then10
	li	a0, 32
	li	a1, 13
	call	Perl_new_stackinfo
	ld	a1, %lo(PL_curstackinfo)(s4)
	sd	a1, 32(a0)
	sd	a0, 40(a1)
.LBB10_7:                               # %if.end13
	li	a1, 2
	ld	a2, 0(a0)
	sw	a1, 24(a0)
	li	a1, -1
	sw	a1, 16(a0)
	ld	a1, 0(a2)
	lui	a2, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a2)
	lui	s6, %hi(PL_stack_base)
	ld	a4, %lo(PL_stack_base)(s6)
	sd	zero, 8(a1)
	ld	a1, 0(a3)
	sub	s0, s0, a4
	srai	s0, s0, 3
	sd	s0, 8(a1)
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(s6)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 16(a3)
	slli	a3, a3, 3
	add	a3, a3, a1
	lui	s7, %hi(PL_stack_max)
	sd	a3, %lo(PL_stack_max)(s7)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 8(a3)
	slli	a3, a3, 3
	add	s0, a1, a3
	sd	s0, %lo(PL_stack_sp)(s5)
	ld	a3, 0(a0)
	lui	s5, %hi(PL_markstack_ptr)
	ld	a4, %lo(PL_markstack_ptr)(s5)
	lui	a5, %hi(PL_markstack_max)
	ld	a5, %lo(PL_markstack_max)(a5)
	sd	a3, %lo(PL_curstack)(a2)
	sd	a0, %lo(PL_curstackinfo)(s4)
	addi	a0, a4, 4
	sd	a0, %lo(PL_markstack_ptr)(s5)
	bne	a0, a5, .LBB10_9
# %bb.8:                                # %if.then25
	call	Perl_markstack_grow
	ld	a1, %lo(PL_stack_base)(s6)
	ld	a0, %lo(PL_markstack_ptr)(s5)
.LBB10_9:                               # %if.end26
	sub	a1, s0, a1
	srli	a1, a1, 3
	sw	a1, 0(a0)
	ld	a0, %lo(PL_stack_max)(s7)
	sub	a0, a0, s0
	li	a1, 8
	blt	a1, a0, .LBB10_11
# %bb.10:                               # %if.then38
	li	a2, 2
	mv	a0, s0
	mv	a1, s0
	call	Perl_stack_grow
	mv	s0, a0
.LBB10_11:                              # %if.end40
	ld	a0, 24(s2)
	bnez	a0, .LBB10_13
# %bb.12:                               # %cond.false44
	mv	a0, s1
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB10_13:                              # %cond.end47
	sd	a0, 8(s0)
	addi	a0, s0, 16
	sd	s3, 16(s0)
	lui	s3, %hi(PL_stack_sp)
	sd	a0, %lo(PL_stack_sp)(s3)
	call	Perl_push_scope
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	li	a1, 2
	call	Perl_call_method
	call	Perl_pop_scope
	lui	s2, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s2)
	ld	s1, 32(a0)
	ld	s0, %lo(PL_stack_sp)(s3)
	bnez	s1, .LBB10_20
# %bb.14:                               # %if.then55
	lui	a0, %hi(PL_stderrgv)
	ld	a0, %lo(PL_stderrgv)(a0)
	beqz	a0, .LBB10_18
# %bb.15:                               # %land.lhs.true
	lbu	a1, 12(a0)
	li	a2, 13
	bne	a1, a2, .LBB10_18
# %bb.16:                               # %land.lhs.true61
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 16(a0)
	beqz	a0, .LBB10_18
# %bb.17:                               # %land.lhs.true64
	ld	a0, 0(a0)
	ld	a0, 64(a0)
	bnez	a0, .LBB10_19
.LBB10_18:                              # %cond.false76
	call	Perl_PerlIO_stderr
.LBB10_19:                              # %cond.end78
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	PerlIO_printf
	li	a0, 1
	call	Perl_my_exit
.LBB10_20:                              # %if.end81
	lui	a0, %hi(PL_curstack)
	ld	a1, %lo(PL_curstack)(a0)
	lui	a2, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a2)
	ld	a1, 0(a1)
	sub	s0, s0, a3
	srai	s0, s0, 3
	sd	s0, 8(a1)
	ld	a1, 0(s1)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(a2)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 16(a2)
	slli	a2, a2, 3
	add	a2, a2, a1
	lui	a3, %hi(PL_stack_max)
	sd	a2, %lo(PL_stack_max)(a3)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 8(a2)
	slli	a2, a2, 3
	add	a1, a1, a2
	sd	a1, %lo(PL_stack_sp)(s3)
	ld	a1, 0(s1)
	sd	a1, %lo(PL_curstack)(a0)
	sd	s1, %lo(PL_curstackinfo)(s2)
.LBB10_21:                              # %cleanup
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.LBB10_22:                              # %if.end102
	ld	a0, 0(s1)
	lw	a1, 8(a0)
	addiw	a1, a1, 1
	mv	a0, s1
	mv	a2, s3
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	tail	Perl_av_store
.Lfunc_end10:
	.size	Perl_av_push, .Lfunc_end10-Perl_av_push
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_pop                     # -- Begin function Perl_av_pop
	.p2align	1
	.type	Perl_av_pop,@function
Perl_av_pop:                            # @Perl_av_pop
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	lui	s1, %hi(PL_sv_undef)
	addi	s1, s1, %lo(PL_sv_undef)
	beqz	a0, .LBB11_30
# %bb.1:                                # %if.end
	mv	s0, a0
	lwu	a0, 12(a0)
	slli	a1, a0, 40
	bgez	a1, .LBB11_3
# %bb.2:                                # %if.then3
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
	lw	a0, 12(s0)
.LBB11_3:                               # %if.end4
	slli	a1, a0, 48
	bgez	a1, .LBB11_16
# %bb.4:                                # %cond.end
	li	a1, 80
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB11_15
# %bb.5:                                # %if.then9
	mv	s2, a0
	lui	s3, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s3)
	lui	s4, %hi(PL_stack_sp)
	ld	a0, 40(a0)
	ld	s1, %lo(PL_stack_sp)(s4)
	bnez	a0, .LBB11_7
# %bb.6:                                # %if.then11
	li	a0, 32
	li	a1, 13
	call	Perl_new_stackinfo
	ld	a1, %lo(PL_curstackinfo)(s3)
	sd	a1, 32(a0)
	sd	a0, 40(a1)
.LBB11_7:                               # %if.end14
	li	a1, 2
	ld	a2, 0(a0)
	sw	a1, 24(a0)
	li	a1, -1
	sw	a1, 16(a0)
	ld	a1, 0(a2)
	lui	a2, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a2)
	lui	s5, %hi(PL_stack_base)
	ld	a4, %lo(PL_stack_base)(s5)
	sd	zero, 8(a1)
	ld	a1, 0(a3)
	sub	s1, s1, a4
	srai	s1, s1, 3
	sd	s1, 8(a1)
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(s5)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 16(a3)
	slli	a3, a3, 3
	add	a3, a3, a1
	lui	s6, %hi(PL_stack_max)
	sd	a3, %lo(PL_stack_max)(s6)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 8(a3)
	slli	a3, a3, 3
	add	s1, a1, a3
	sd	s1, %lo(PL_stack_sp)(s4)
	ld	a3, 0(a0)
	lui	s4, %hi(PL_markstack_ptr)
	ld	a4, %lo(PL_markstack_ptr)(s4)
	lui	a5, %hi(PL_markstack_max)
	ld	a5, %lo(PL_markstack_max)(a5)
	sd	a3, %lo(PL_curstack)(a2)
	sd	a0, %lo(PL_curstackinfo)(s3)
	addi	a0, a4, 4
	sd	a0, %lo(PL_markstack_ptr)(s4)
	bne	a0, a5, .LBB11_9
# %bb.8:                                # %if.then26
	call	Perl_markstack_grow
	ld	a1, %lo(PL_stack_base)(s5)
	ld	a0, %lo(PL_markstack_ptr)(s4)
.LBB11_9:                               # %if.end27
	sub	a1, s1, a1
	srli	a1, a1, 3
	sw	a1, 0(a0)
	ld	a0, %lo(PL_stack_max)(s6)
	sub	a0, a0, s1
	li	a1, 7
	blt	a1, a0, .LBB11_11
# %bb.10:                               # %if.then39
	li	a2, 1
	mv	a0, s1
	mv	a1, s1
	call	Perl_stack_grow
	mv	s1, a0
.LBB11_11:                              # %if.end41
	ld	a0, 24(s2)
	bnez	a0, .LBB11_13
# %bb.12:                               # %cond.false46
	mv	a0, s0
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB11_13:                              # %cond.end49
	addi	a1, s1, 8
	sd	a0, 8(s1)
	lui	s3, %hi(PL_stack_sp)
	sd	a1, %lo(PL_stack_sp)(s3)
	call	Perl_push_scope
	lui	a0, %hi(.L.str.4)
	addi	a0, a0, %lo(.L.str.4)
	li	a1, 0
	call	Perl_call_method
	beqz	a0, .LBB11_21
# %bb.14:                               # %if.then54
	ld	a0, %lo(PL_stack_sp)(s3)
	addi	a1, a0, -8
	sd	a1, %lo(PL_stack_sp)(s3)
	ld	a0, 0(a0)
	call	Perl_newSVsv
	mv	s1, a0
	j	.LBB11_22
.LBB11_15:                              # %cond.end.if.end108_crit_edge
	lw	a0, 12(s0)
.LBB11_16:                              # %if.end108
	slli	a0, a0, 48
	bltz	a0, .LBB11_18
# %bb.17:                               # %cond.false115
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	bgez	a0, .LBB11_19
	j	.LBB11_30
.LBB11_18:                              # %cond.true112
	mv	a0, s0
	call	Perl_mg_size
	bltz	a0, .LBB11_30
.LBB11_19:                              # %if.end123
	ld	a0, 0(s0)
	ld	a1, 8(a0)
	ld	a2, 0(a0)
	slli	a3, a1, 3
	add	a2, a2, a3
	ld	s1, 0(a2)
	addi	a1, a1, -1
	sd	a1, 8(a0)
	lui	a0, %hi(PL_sv_undef)
	addi	a0, a0, %lo(PL_sv_undef)
	sd	a0, 0(a2)
	lbu	a0, 13(s0)
	andi	a0, a0, 64
	beqz	a0, .LBB11_30
# %bb.20:                               # %if.then136
	mv	a0, s0
	call	Perl_mg_set
	j	.LBB11_30
.LBB11_21:
	lui	s1, %hi(PL_sv_undef)
	addi	s1, s1, %lo(PL_sv_undef)
.LBB11_22:                              # %if.end57
	call	Perl_pop_scope
	lui	s2, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s2)
	ld	s0, 32(a0)
	ld	s3, %lo(PL_stack_sp)(s3)
	bnez	s0, .LBB11_29
# %bb.23:                               # %if.then61
	lui	a0, %hi(PL_stderrgv)
	ld	a0, %lo(PL_stderrgv)(a0)
	beqz	a0, .LBB11_27
# %bb.24:                               # %land.lhs.true
	lbu	a1, 12(a0)
	li	a2, 13
	bne	a1, a2, .LBB11_27
# %bb.25:                               # %land.lhs.true67
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 16(a0)
	beqz	a0, .LBB11_27
# %bb.26:                               # %land.lhs.true70
	ld	a0, 0(a0)
	ld	a0, 64(a0)
	bnez	a0, .LBB11_28
.LBB11_27:                              # %cond.false82
	call	Perl_PerlIO_stderr
.LBB11_28:                              # %cond.end84
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	PerlIO_printf
	li	a0, 1
	call	Perl_my_exit
.LBB11_29:                              # %if.end87
	lui	a0, %hi(PL_curstack)
	ld	a1, %lo(PL_curstack)(a0)
	lui	a2, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a2)
	ld	a1, 0(a1)
	sub	a3, s3, a3
	srai	a3, a3, 3
	sd	a3, 8(a1)
	ld	a1, 0(s0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(a2)
	ld	a2, 0(s0)
	ld	a2, 0(a2)
	ld	a2, 16(a2)
	slli	a2, a2, 3
	add	a2, a2, a1
	lui	a3, %hi(PL_stack_max)
	sd	a2, %lo(PL_stack_max)(a3)
	ld	a2, 0(s0)
	ld	a2, 0(a2)
	ld	a2, 8(a2)
	slli	a2, a2, 3
	add	a1, a1, a2
	lui	a2, %hi(PL_stack_sp)
	sd	a1, %lo(PL_stack_sp)(a2)
	ld	a1, 0(s0)
	sd	a1, %lo(PL_curstack)(a0)
	sd	s0, %lo(PL_curstackinfo)(s2)
.LBB11_30:                              # %cleanup
	mv	a0, s1
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end11:
	.size	Perl_av_pop, .Lfunc_end11-Perl_av_pop
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_unshift                 # -- Begin function Perl_av_unshift
	.p2align	1
	.type	Perl_av_unshift,@function
Perl_av_unshift:                        # @Perl_av_unshift
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB12_35
# %bb.1:                                # %if.end
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	.cfi_offset s7, -72
	mv	s3, a1
	mv	s0, a0
	lwu	a0, 12(a0)
	slli	a1, a0, 40
	bgez	a1, .LBB12_3
# %bb.2:                                # %if.then2
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
	lw	a0, 12(s0)
.LBB12_3:                               # %if.end3
	slli	a0, a0, 48
	bgez	a0, .LBB12_16
# %bb.4:                                # %cond.end
	li	a1, 80
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB12_16
# %bb.5:                                # %if.then8
	mv	s2, a0
	lui	s4, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s4)
	lui	s5, %hi(PL_stack_sp)
	ld	a0, 40(a0)
	ld	s1, %lo(PL_stack_sp)(s5)
	bnez	a0, .LBB12_7
# %bb.6:                                # %if.then10
	li	a0, 32
	li	a1, 13
	call	Perl_new_stackinfo
	ld	a1, %lo(PL_curstackinfo)(s4)
	sd	a1, 32(a0)
	sd	a0, 40(a1)
.LBB12_7:                               # %if.end13
	li	a1, 2
	ld	a2, 0(a0)
	sw	a1, 24(a0)
	li	a1, -1
	sw	a1, 16(a0)
	ld	a1, 0(a2)
	lui	a2, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a2)
	lui	s6, %hi(PL_stack_base)
	ld	a4, %lo(PL_stack_base)(s6)
	sd	zero, 8(a1)
	ld	a1, 0(a3)
	sub	s1, s1, a4
	srai	s1, s1, 3
	sd	s1, 8(a1)
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(s6)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 16(a3)
	slli	a3, a3, 3
	add	a3, a3, a1
	lui	s7, %hi(PL_stack_max)
	sd	a3, %lo(PL_stack_max)(s7)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 8(a3)
	slli	a3, a3, 3
	add	s1, a1, a3
	sd	s1, %lo(PL_stack_sp)(s5)
	ld	a3, 0(a0)
	lui	s5, %hi(PL_markstack_ptr)
	ld	a4, %lo(PL_markstack_ptr)(s5)
	lui	a5, %hi(PL_markstack_max)
	ld	a5, %lo(PL_markstack_max)(a5)
	sd	a3, %lo(PL_curstack)(a2)
	sd	a0, %lo(PL_curstackinfo)(s4)
	addi	a0, a4, 4
	sd	a0, %lo(PL_markstack_ptr)(s5)
	bne	a0, a5, .LBB12_9
# %bb.8:                                # %if.then25
	call	Perl_markstack_grow
	ld	a1, %lo(PL_stack_base)(s6)
	ld	a0, %lo(PL_markstack_ptr)(s5)
.LBB12_9:                               # %if.end26
	sub	a1, s1, a1
	srli	a1, a1, 3
	sw	a1, 0(a0)
	ld	a0, %lo(PL_stack_max)(s7)
	sub	a0, a0, s1
	srai	a0, a0, 3
	addiw	a2, s3, 1
	bge	a0, a2, .LBB12_11
# %bb.10:                               # %if.then39
	mv	a0, s1
	mv	a1, s1
	call	Perl_stack_grow
	mv	s1, a0
.LBB12_11:                              # %if.end42
	ld	a0, 24(s2)
	bnez	a0, .LBB12_13
# %bb.12:                               # %cond.false46
	mv	a0, s0
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB12_13:                              # %cond.end49
	addi	a1, s1, 8
	sd	a0, 8(s1)
	blez	s3, .LBB12_25
# %bb.14:                               # %while.body.preheader
	addi	s3, s3, -1
	slli	s3, s3, 32
	srli	a0, s3, 29
	add	a0, a0, s1
	addi	a0, a0, 16
	lui	a3, %hi(PL_sv_undef)
	addi	a3, a3, %lo(PL_sv_undef)
.LBB12_15:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	addi	a2, a1, 8
	sd	a3, 8(a1)
	mv	a1, a2
	bne	a2, a0, .LBB12_15
	j	.LBB12_26
.LBB12_16:                              # %if.end106
	blez	s3, .LBB12_34
# %bb.17:                               # %if.end110
	ld	a0, 0(s0)
	lbu	a1, 72(a0)
	andi	a1, a1, 3
	li	a2, 2
	bne	a1, a2, .LBB12_19
# %bb.18:                               # %if.then121
	mv	a0, s0
	call	Perl_av_reify
	ld	a0, 0(s0)
.LBB12_19:                              # %if.end122
	ld	a1, 0(a0)
	ld	a2, 56(a0)
	sub	a1, a1, a2
	srli	a1, a1, 3
	sext.w	a1, a1
	beqz	a1, .LBB12_22
# %bb.20:                               # %if.end149
	ld	a2, 16(a0)
	min	a1, a1, s3
	add	a2, a2, a1
	sd	a2, 16(a0)
	ld	a0, 0(s0)
	ld	a2, 8(a0)
	add	a2, a2, a1
	sd	a2, 8(a0)
	ld	a0, 0(s0)
	ld	a2, 0(a0)
	subw	s3, s3, a1
	slli	a1, a1, 3
	sub	a2, a2, a1
	sd	a2, 0(a0)
	beqz	s3, .LBB12_34
# %bb.21:                               # %if.end149.if.then151_crit_edge
	ld	a0, 0(s0)
.LBB12_22:                              # %if.then151
	lw	s4, 8(a0)
	max	s2, s4, zero
	addw	s5, s3, s2
	add	s3, s3, s2
	addw	a1, s3, s4
	mv	a0, s0
	call	Perl_av_extend
	ld	a0, 0(s0)
	ld	a1, 8(a0)
	add	a1, a1, s5
	sd	a1, 8(a0)
	ld	a0, 0(s0)
	ld	s1, 0(a0)
	slli	a0, s5, 3
	add	a0, a0, s1
	addiw	a2, s4, 1
	slli	a2, a2, 3
	mv	a1, s1
	call	memmove
	slli	a0, s3, 3
	addi	s1, s1, -8
	add	a0, a0, s1
	lui	a1, %hi(PL_sv_undef)
	addi	a1, a1, %lo(PL_sv_undef)
.LBB12_23:                              # %do.body
                                        # =>This Inner Loop Header: Depth=1
	sd	a1, 0(a0)
	addi	a0, a0, -8
	bne	a0, s1, .LBB12_23
# %bb.24:                               # %do.end
	ld	a0, 0(s0)
	ld	a1, 16(a0)
	sub	a1, a1, s2
	sd	a1, 16(a0)
	ld	a0, 0(s0)
	ld	a1, 8(a0)
	sub	a1, a1, s2
	sd	a1, 8(a0)
	ld	a0, 0(s0)
	ld	a1, 0(a0)
	slli	s2, s2, 3
	add	a1, a1, s2
	sd	a1, 0(a0)
	j	.LBB12_34
.LBB12_25:
	mv	a2, a1
.LBB12_26:                              # %while.end
	lui	s3, %hi(PL_stack_sp)
	sd	a2, %lo(PL_stack_sp)(s3)
	call	Perl_push_scope
	lui	a0, %hi(.L.str.5)
	addi	a0, a0, %lo(.L.str.5)
	li	a1, 2
	call	Perl_call_method
	call	Perl_pop_scope
	lui	s2, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s2)
	ld	s1, 32(a0)
	ld	s0, %lo(PL_stack_sp)(s3)
	bnez	s1, .LBB12_33
# %bb.27:                               # %if.then59
	lui	a0, %hi(PL_stderrgv)
	ld	a0, %lo(PL_stderrgv)(a0)
	beqz	a0, .LBB12_31
# %bb.28:                               # %land.lhs.true
	lbu	a1, 12(a0)
	li	a2, 13
	bne	a1, a2, .LBB12_31
# %bb.29:                               # %land.lhs.true65
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 16(a0)
	beqz	a0, .LBB12_31
# %bb.30:                               # %land.lhs.true68
	ld	a0, 0(a0)
	ld	a0, 64(a0)
	bnez	a0, .LBB12_32
.LBB12_31:                              # %cond.false80
	call	Perl_PerlIO_stderr
.LBB12_32:                              # %cond.end82
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	PerlIO_printf
	li	a0, 1
	call	Perl_my_exit
.LBB12_33:                              # %if.end85
	lui	a0, %hi(PL_curstack)
	ld	a1, %lo(PL_curstack)(a0)
	lui	a2, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a2)
	ld	a1, 0(a1)
	sub	s0, s0, a3
	srai	s0, s0, 3
	sd	s0, 8(a1)
	ld	a1, 0(s1)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(a2)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 16(a2)
	slli	a2, a2, 3
	add	a2, a2, a1
	lui	a3, %hi(PL_stack_max)
	sd	a2, %lo(PL_stack_max)(a3)
	ld	a2, 0(s1)
	ld	a2, 0(a2)
	ld	a2, 8(a2)
	slli	a2, a2, 3
	add	a1, a1, a2
	sd	a1, %lo(PL_stack_sp)(s3)
	ld	a1, 0(s1)
	sd	a1, %lo(PL_curstack)(a0)
	sd	s1, %lo(PL_curstackinfo)(s2)
.LBB12_34:
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
.LBB12_35:                              # %cleanup
	ret
.Lfunc_end12:
	.size	Perl_av_unshift, .Lfunc_end12-Perl_av_unshift
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_shift                   # -- Begin function Perl_av_shift
	.p2align	1
	.type	Perl_av_shift,@function
Perl_av_shift:                          # @Perl_av_shift
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	.cfi_offset s4, -48
	.cfi_offset s5, -56
	.cfi_offset s6, -64
	lui	s1, %hi(PL_sv_undef)
	addi	s1, s1, %lo(PL_sv_undef)
	beqz	a0, .LBB13_32
# %bb.1:                                # %if.end
	mv	s0, a0
	lwu	a0, 12(a0)
	slli	a1, a0, 40
	bgez	a1, .LBB13_3
# %bb.2:                                # %if.then3
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
	lw	a0, 12(s0)
.LBB13_3:                               # %if.end4
	slli	a1, a0, 48
	bgez	a1, .LBB13_16
# %bb.4:                                # %cond.end
	li	a1, 80
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB13_15
# %bb.5:                                # %if.then9
	mv	s2, a0
	lui	s3, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s3)
	lui	s4, %hi(PL_stack_sp)
	ld	a0, 40(a0)
	ld	s1, %lo(PL_stack_sp)(s4)
	bnez	a0, .LBB13_7
# %bb.6:                                # %if.then11
	li	a0, 32
	li	a1, 13
	call	Perl_new_stackinfo
	ld	a1, %lo(PL_curstackinfo)(s3)
	sd	a1, 32(a0)
	sd	a0, 40(a1)
.LBB13_7:                               # %if.end14
	li	a1, 2
	ld	a2, 0(a0)
	sw	a1, 24(a0)
	li	a1, -1
	sw	a1, 16(a0)
	ld	a1, 0(a2)
	lui	a2, %hi(PL_curstack)
	ld	a3, %lo(PL_curstack)(a2)
	lui	s5, %hi(PL_stack_base)
	ld	a4, %lo(PL_stack_base)(s5)
	sd	zero, 8(a1)
	ld	a1, 0(a3)
	sub	s1, s1, a4
	srai	s1, s1, 3
	sd	s1, 8(a1)
	ld	a1, 0(a0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(s5)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 16(a3)
	slli	a3, a3, 3
	add	a3, a3, a1
	lui	s6, %hi(PL_stack_max)
	sd	a3, %lo(PL_stack_max)(s6)
	ld	a3, 0(a0)
	ld	a3, 0(a3)
	ld	a3, 8(a3)
	slli	a3, a3, 3
	add	s1, a1, a3
	sd	s1, %lo(PL_stack_sp)(s4)
	ld	a3, 0(a0)
	lui	s4, %hi(PL_markstack_ptr)
	ld	a4, %lo(PL_markstack_ptr)(s4)
	lui	a5, %hi(PL_markstack_max)
	ld	a5, %lo(PL_markstack_max)(a5)
	sd	a3, %lo(PL_curstack)(a2)
	sd	a0, %lo(PL_curstackinfo)(s3)
	addi	a0, a4, 4
	sd	a0, %lo(PL_markstack_ptr)(s4)
	bne	a0, a5, .LBB13_9
# %bb.8:                                # %if.then26
	call	Perl_markstack_grow
	ld	a1, %lo(PL_stack_base)(s5)
	ld	a0, %lo(PL_markstack_ptr)(s4)
.LBB13_9:                               # %if.end27
	sub	a1, s1, a1
	srli	a1, a1, 3
	sw	a1, 0(a0)
	ld	a0, %lo(PL_stack_max)(s6)
	sub	a0, a0, s1
	li	a1, 7
	blt	a1, a0, .LBB13_11
# %bb.10:                               # %if.then39
	li	a2, 1
	mv	a0, s1
	mv	a1, s1
	call	Perl_stack_grow
	mv	s1, a0
.LBB13_11:                              # %if.end41
	ld	a0, 24(s2)
	bnez	a0, .LBB13_13
# %bb.12:                               # %cond.false46
	mv	a0, s0
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB13_13:                              # %cond.end49
	addi	a1, s1, 8
	sd	a0, 8(s1)
	lui	s3, %hi(PL_stack_sp)
	sd	a1, %lo(PL_stack_sp)(s3)
	call	Perl_push_scope
	lui	a0, %hi(.L.str.6)
	addi	a0, a0, %lo(.L.str.6)
	li	a1, 0
	call	Perl_call_method
	beqz	a0, .LBB13_23
# %bb.14:                               # %if.then54
	ld	a0, %lo(PL_stack_sp)(s3)
	addi	a1, a0, -8
	sd	a1, %lo(PL_stack_sp)(s3)
	ld	a0, 0(a0)
	call	Perl_newSVsv
	mv	s1, a0
	j	.LBB13_24
.LBB13_15:                              # %cond.end.if.end108_crit_edge
	lw	a0, 12(s0)
.LBB13_16:                              # %if.end108
	slli	a0, a0, 48
	bltz	a0, .LBB13_18
# %bb.17:                               # %cond.false115
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	bgez	a0, .LBB13_19
	j	.LBB13_32
.LBB13_18:                              # %cond.true112
	mv	a0, s0
	call	Perl_mg_size
	bltz	a0, .LBB13_32
.LBB13_19:                              # %if.end123
	ld	a0, 0(s0)
	ld	a1, 0(a0)
	lbu	a2, 72(a0)
	ld	s1, 0(a1)
	andi	a2, a2, 1
	beqz	a2, .LBB13_21
# %bb.20:                               # %if.then130
	lui	a0, %hi(PL_sv_undef)
	addi	a0, a0, %lo(PL_sv_undef)
	sd	a0, 0(a1)
	ld	a0, 0(s0)
	ld	a1, 0(a0)
.LBB13_21:                              # %if.end133
	addi	a1, a1, 8
	sd	a1, 0(a0)
	ld	a0, 0(s0)
	ld	a1, 16(a0)
	addi	a1, a1, -1
	sd	a1, 16(a0)
	ld	a0, 0(s0)
	ld	a1, 8(a0)
	addi	a1, a1, -1
	sd	a1, 8(a0)
	lbu	a0, 13(s0)
	andi	a0, a0, 64
	beqz	a0, .LBB13_32
# %bb.22:                               # %if.then146
	mv	a0, s0
	call	Perl_mg_set
	j	.LBB13_32
.LBB13_23:
	lui	s1, %hi(PL_sv_undef)
	addi	s1, s1, %lo(PL_sv_undef)
.LBB13_24:                              # %if.end57
	call	Perl_pop_scope
	lui	s2, %hi(PL_curstackinfo)
	ld	a0, %lo(PL_curstackinfo)(s2)
	ld	s0, 32(a0)
	ld	s3, %lo(PL_stack_sp)(s3)
	bnez	s0, .LBB13_31
# %bb.25:                               # %if.then61
	lui	a0, %hi(PL_stderrgv)
	ld	a0, %lo(PL_stderrgv)(a0)
	beqz	a0, .LBB13_29
# %bb.26:                               # %land.lhs.true
	lbu	a1, 12(a0)
	li	a2, 13
	bne	a1, a2, .LBB13_29
# %bb.27:                               # %land.lhs.true67
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 16(a0)
	beqz	a0, .LBB13_29
# %bb.28:                               # %land.lhs.true70
	ld	a0, 0(a0)
	ld	a0, 64(a0)
	bnez	a0, .LBB13_30
.LBB13_29:                              # %cond.false82
	call	Perl_PerlIO_stderr
.LBB13_30:                              # %cond.end84
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	PerlIO_printf
	li	a0, 1
	call	Perl_my_exit
.LBB13_31:                              # %if.end87
	lui	a0, %hi(PL_curstack)
	ld	a1, %lo(PL_curstack)(a0)
	lui	a2, %hi(PL_stack_base)
	ld	a3, %lo(PL_stack_base)(a2)
	ld	a1, 0(a1)
	sub	a3, s3, a3
	srai	a3, a3, 3
	sd	a3, 8(a1)
	ld	a1, 0(s0)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	sd	a1, %lo(PL_stack_base)(a2)
	ld	a2, 0(s0)
	ld	a2, 0(a2)
	ld	a2, 16(a2)
	slli	a2, a2, 3
	add	a2, a2, a1
	lui	a3, %hi(PL_stack_max)
	sd	a2, %lo(PL_stack_max)(a3)
	ld	a2, 0(s0)
	ld	a2, 0(a2)
	ld	a2, 8(a2)
	slli	a2, a2, 3
	add	a1, a1, a2
	lui	a2, %hi(PL_stack_sp)
	sd	a1, %lo(PL_stack_sp)(a2)
	ld	a1, 0(s0)
	sd	a1, %lo(PL_curstack)(a0)
	sd	s0, %lo(PL_curstackinfo)(s2)
.LBB13_32:                              # %cleanup
	mv	a0, s1
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end13:
	.size	Perl_av_shift, .Lfunc_end13-Perl_av_shift
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_len                     # -- Begin function Perl_av_len
	.p2align	1
	.type	Perl_av_len,@function
Perl_av_len:                            # @Perl_av_len
	.cfi_startproc
# %bb.0:                                # %entry
	lbu	a1, 13(a0)
	andi	a1, a1, 128
	bnez	a1, .LBB14_2
# %bb.1:                                # %cond.false
	ld	a0, 0(a0)
	lw	a0, 8(a0)
	ret
.LBB14_2:                               # %cond.true
	tail	Perl_mg_size
.Lfunc_end14:
	.size	Perl_av_len, .Lfunc_end14-Perl_av_len
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_delete                  # -- Begin function Perl_av_delete
	.p2align	1
	.type	Perl_av_delete,@function
Perl_av_delete:                         # @Perl_av_delete
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	beqz	a0, .LBB15_42
# %bb.1:                                # %if.end
	mv	s2, a2
	mv	s1, a1
	mv	s0, a0
	lwu	a0, 12(a0)
	slli	a1, a0, 40
	bgez	a1, .LBB15_3
# %bb.2:                                # %if.then2
	lui	a0, %hi(PL_no_modify)
	addi	a0, a0, %lo(PL_no_modify)
	call	Perl_croak
	lw	a0, 12(s0)
.LBB15_3:                               # %if.end3
	slli	a0, a0, 48
	bgez	a0, .LBB15_23
# %bb.4:                                # %if.then7
	li	a1, 80
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB15_14
# %bb.5:                                # %if.then11.thread
	bgez	s1, .LBB15_20
# %bb.6:                                # %if.then14
	ld	a0, 24(a0)
	bnez	a0, .LBB15_8
# %bb.7:                                # %cond.false
	mv	a0, s0
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB15_8:                               # %cond.end
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 48(a0)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	li	a2, 16
	li	a3, 0
	call	Perl_hv_fetch
	beqz	a0, .LBB15_16
# %bb.9:                                # %land.lhs.true
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 0(a0)
	beqz	a0, .LBB15_16
# %bb.10:                               # %cond.false25
	lwu	a1, 12(a0)
	slli	a2, a1, 45
	bltz	a2, .LBB15_43
# %bb.11:                               # %cond.false48
	slli	a2, a1, 47
	bltz	a2, .LBB15_47
# %bb.12:                               # %cond.false62
	slli	a1, a1, 46
	bltz	a1, .LBB15_48
# %bb.13:                               # %cond.false76
	call	Perl_sv_2bool
	bnez	a0, .LBB15_20
	j	.LBB15_16
.LBB15_14:                              # %lor.lhs.false
	li	a1, 68
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB15_23
# %bb.15:                               # %if.then11
	bgez	s1, .LBB15_20
.LBB15_16:                              # %if.then87
	lbu	a0, 13(s0)
	andi	a0, a0, 128
	bnez	a0, .LBB15_18
# %bb.17:                               # %cond.false94
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	j	.LBB15_19
.LBB15_18:                              # %cond.true91
	mv	a0, s0
	call	Perl_mg_size
.LBB15_19:                              # %cleanup
	add	a0, a0, s1
	addiw	s1, a0, 1
	bltz	s1, .LBB15_41
.LBB15_20:                              # %if.end106
	li	a2, 1
	mv	a0, s0
	mv	a1, s1
	call	Perl_av_fetch
	beqz	a0, .LBB15_23
# %bb.21:                               # %if.then109
	ld	s0, 0(a0)
	mv	a0, s0
	call	Perl_mg_clear
	li	a1, 112
	mv	s1, s0
	mv	a0, s0
	call	Perl_mg_find
	beqz	a0, .LBB15_42
# %bb.22:                               # %if.then113
	li	a1, 112
	mv	a0, s1
	call	Perl_sv_unmagic
	mv	a0, s1
	j	.LBB15_42
.LBB15_23:                              # %if.end122
	bgez	s1, .LBB15_28
# %bb.24:                               # %if.then125
	lbu	a0, 13(s0)
	andi	a0, a0, 128
	bnez	a0, .LBB15_26
# %bb.25:                               # %cond.false132
	ld	a0, 0(s0)
	ld	a0, 8(a0)
	j	.LBB15_27
.LBB15_26:                              # %cond.true129
	mv	a0, s0
	call	Perl_mg_size
.LBB15_27:                              # %cond.end135
	add	a0, a0, s1
	addiw	s1, a0, 1
	bltz	s1, .LBB15_41
.LBB15_28:                              # %if.end145
	ld	a0, 0(s0)
	ld	a2, 8(a0)
	blt	a2, s1, .LBB15_41
# %bb.29:                               # %if.else
	lbu	a1, 72(a0)
	andi	a1, a1, 3
	li	a3, 2
	bne	a1, a3, .LBB15_31
# %bb.30:                               # %if.then162
	mv	a0, s0
	call	Perl_av_reify
	ld	a0, 0(s0)
	ld	a2, 8(a0)
.LBB15_31:                              # %if.end163
	ld	a0, 0(a0)
	slli	a4, s1, 3
	add	a3, a0, a4
	ld	a0, 0(a3)
	lui	a1, %hi(PL_sv_undef)
	addi	a1, a1, %lo(PL_sv_undef)
	sd	a1, 0(a3)
	bne	a2, s1, .LBB15_35
# %bb.32:                               # %if.then170
	ld	a3, 0(s0)
	addi	a2, a4, -8
	addi	s1, s1, 1
.LBB15_33:                              # %do.body
                                        # =>This Inner Loop Header: Depth=1
	ld	a4, 8(a3)
	addi	a4, a4, -1
	addi	s1, s1, -1
	sd	a4, 8(a3)
	blez	s1, .LBB15_35
# %bb.34:                               # %land.rhs
                                        #   in Loop: Header=BB15_33 Depth=1
	ld	a3, 0(s0)
	ld	a4, 0(a3)
	add	a4, a4, a2
	ld	a4, 0(a4)
	addi	a2, a2, -8
	beq	a4, a1, .LBB15_33
.LBB15_35:                              # %if.end191
	lbu	a1, 13(s0)
	andi	a1, a1, 64
	beqz	a1, .LBB15_37
# %bb.36:                               # %if.then195
	mv	s1, a0
	mv	a0, s0
	call	Perl_mg_set
	mv	a0, s1
.LBB15_37:                              # %if.end198
	andi	a1, s2, 2
	bnez	a1, .LBB15_40
# %bb.38:                               # %if.else202
	ld	a1, 0(s0)
	lbu	a1, 72(a1)
	andi	a1, a1, 1
	beqz	a1, .LBB15_42
# %bb.39:                               # %if.then208
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	Perl_sv_2mortal
.LBB15_40:                              # %if.then201
	call	Perl_sv_free
.LBB15_41:
	li	a0, 0
.LBB15_42:                              # %cleanup212
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.LBB15_43:                              # %cond.true32
	ld	a0, 0(a0)
	lui	a1, %hi(PL_Xpv)
	sd	a0, %lo(PL_Xpv)(a1)
	beqz	a0, .LBB15_16
# %bb.44:                               # %land.lhs.true38
	ld	a1, 8(a0)
	li	a2, 1
	bltu	a2, a1, .LBB15_20
# %bb.45:                               # %lor.lhs.false40
	beqz	a1, .LBB15_16
# %bb.46:                               # %land.lhs.true43
	ld	a0, 0(a0)
	lbu	a0, 0(a0)
	li	a1, 48
	beq	a0, a1, .LBB15_16
	j	.LBB15_20
.LBB15_47:                              # %cond.true55
	ld	a0, 0(a0)
	ld	a0, 24(a0)
	bnez	a0, .LBB15_20
	j	.LBB15_16
.LBB15_48:                              # %cond.true69
	ld	a0, 0(a0)
	fld	fa5, 32(a0)
	fmv.d.x	fa4, zero
	feq.d	a0, fa5, fa4
	beqz	a0, .LBB15_20
	j	.LBB15_16
.Lfunc_end15:
	.size	Perl_av_delete, .Lfunc_end15-Perl_av_delete
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_av_exists                  # -- Begin function Perl_av_exists
	.p2align	1
	.type	Perl_av_exists,@function
Perl_av_exists:                         # @Perl_av_exists
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	beqz	a0, .LBB16_31
# %bb.1:                                # %if.end
	mv	s3, a1
	mv	s1, a0
	lbu	a0, 13(a0)
	andi	a0, a0, 128
	beqz	a0, .LBB16_24
# %bb.2:                                # %if.then2
	li	a1, 80
	mv	a0, s1
	call	Perl_mg_find
	beqz	a0, .LBB16_12
# %bb.3:                                # %if.then6.thread
	mv	s0, a0
	call	Perl_sv_newmortal
	mv	s2, a0
	bgez	s3, .LBB16_18
# %bb.4:                                # %if.then10
	ld	a0, 24(s0)
	bnez	a0, .LBB16_6
# %bb.5:                                # %cond.false
	mv	a0, s1
	call	Perl_newRV
	call	Perl_sv_2mortal
.LBB16_6:                               # %cond.end
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 48(a0)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	li	a2, 16
	li	a3, 0
	call	Perl_hv_fetch
	beqz	a0, .LBB16_14
# %bb.7:                                # %land.lhs.true
	ld	a0, 0(a0)
	ld	a0, 0(a0)
	ld	a0, 56(a0)
	ld	a0, 0(a0)
	beqz	a0, .LBB16_14
# %bb.8:                                # %cond.false21
	lwu	a1, 12(a0)
	slli	a2, a1, 45
	bltz	a2, .LBB16_39
# %bb.9:                                # %cond.false44
	slli	a2, a1, 47
	bltz	a2, .LBB16_44
# %bb.10:                               # %cond.false58
	slli	a1, a1, 46
	bltz	a1, .LBB16_45
# %bb.11:                               # %cond.false72
	call	Perl_sv_2bool
	bnez	a0, .LBB16_18
	j	.LBB16_14
.LBB16_12:                              # %lor.lhs.false
	li	a1, 68
	mv	a0, s1
	call	Perl_mg_find
	beqz	a0, .LBB16_24
# %bb.13:                               # %if.then6
	call	Perl_sv_newmortal
	mv	s2, a0
	bgez	s3, .LBB16_18
.LBB16_14:                              # %if.then83
	lbu	a0, 13(s1)
	andi	a0, a0, 128
	bnez	a0, .LBB16_16
# %bb.15:                               # %cond.false90
	ld	a0, 0(s1)
	ld	a0, 8(a0)
	j	.LBB16_17
.LBB16_16:                              # %cond.true87
	mv	a0, s1
	call	Perl_mg_size
.LBB16_17:                              # %cleanup
	add	a0, a0, s3
	addiw	s3, a0, 1
	bltz	s3, .LBB16_30
.LBB16_18:                              # %if.end102
	mv	a0, s1
	mv	a1, s2
	li	a2, 0
	mv	a3, s3
	call	Perl_mg_copy
	li	a1, 112
	mv	a0, s2
	call	Perl_mg_find
	beqz	a0, .LBB16_24
# %bb.19:                               # %if.then106
	mv	a1, a0
	mv	a0, s2
	call	Perl_magic_existspack
	beqz	s2, .LBB16_30
# %bb.20:                               # %cond.false110
	lwu	a0, 12(s2)
	slli	a1, a0, 45
	bltz	a1, .LBB16_34
# %bb.21:                               # %cond.false129
	slli	a1, a0, 47
	bltz	a1, .LBB16_38
# %bb.22:                               # %cond.false138
	slli	a0, a0, 46
	bltz	a0, .LBB16_43
# %bb.23:                               # %cond.false147
	mv	a0, s2
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	tail	Perl_sv_2bool
.LBB16_24:                              # %if.end168
	bgez	s3, .LBB16_29
# %bb.25:                               # %if.then171
	lbu	a0, 13(s1)
	andi	a0, a0, 128
	bnez	a0, .LBB16_27
# %bb.26:                               # %cond.false178
	ld	a0, 0(s1)
	ld	a0, 8(a0)
	j	.LBB16_28
.LBB16_27:                              # %cond.true175
	mv	a0, s1
	call	Perl_mg_size
.LBB16_28:                              # %cond.end181
	add	a0, a0, s3
	addiw	s3, a0, 1
	bltz	s3, .LBB16_30
.LBB16_29:                              # %if.end191
	ld	a0, 0(s1)
	ld	a1, 8(a0)
	bge	a1, s3, .LBB16_32
.LBB16_30:                              # %if.else
	li	a0, 0
.LBB16_31:                              # %return
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.LBB16_32:                              # %land.lhs.true197
	ld	a0, 0(a0)
	slli	s3, s3, 3
	add	a0, a0, s3
	ld	a1, 0(a0)
	lui	a0, %hi(PL_sv_undef)
	addi	a0, a0, %lo(PL_sv_undef)
	beq	a1, a0, .LBB16_30
# %bb.33:                               # %land.lhs.true197
	li	a0, 1
	bnez	a1, .LBB16_31
	j	.LBB16_30
.LBB16_34:                              # %cond.true114
	ld	a1, 0(s2)
	lui	a0, %hi(PL_Xpv)
	sd	a1, %lo(PL_Xpv)(a0)
	beqz	a1, .LBB16_30
# %bb.35:                               # %land.rhs
	ld	a2, 8(a1)
	li	a0, 1
	bltu	a0, a2, .LBB16_31
# %bb.36:                               # %lor.rhs
	beqz	a2, .LBB16_30
# %bb.37:                               # %land.rhs122
	ld	a0, 0(a1)
	lbu	a0, 0(a0)
	addi	a0, a0, -48
	snez	a0, a0
	j	.LBB16_31
.LBB16_38:                              # %cond.true133
	ld	a0, 0(s2)
	ld	a0, 24(a0)
	snez	a0, a0
	j	.LBB16_31
.LBB16_39:                              # %cond.true28
	ld	a0, 0(a0)
	lui	a1, %hi(PL_Xpv)
	sd	a0, %lo(PL_Xpv)(a1)
	beqz	a0, .LBB16_14
# %bb.40:                               # %land.lhs.true34
	ld	a1, 8(a0)
	li	a2, 1
	bltu	a2, a1, .LBB16_18
# %bb.41:                               # %lor.lhs.false36
	beqz	a1, .LBB16_14
# %bb.42:                               # %land.lhs.true39
	ld	a0, 0(a0)
	lbu	a0, 0(a0)
	li	a1, 48
	beq	a0, a1, .LBB16_14
	j	.LBB16_18
.LBB16_43:                              # %cond.true142
	ld	a0, 0(s2)
	fld	fa5, 32(a0)
	fmv.d.x	fa4, zero
	feq.d	a0, fa5, fa4
	xori	a0, a0, 1
	j	.LBB16_31
.LBB16_44:                              # %cond.true51
	ld	a0, 0(a0)
	ld	a0, 24(a0)
	bnez	a0, .LBB16_18
	j	.LBB16_14
.LBB16_45:                              # %cond.true65
	ld	a0, 0(a0)
	fld	fa5, 32(a0)
	fmv.d.x	fa4, zero
	feq.d	a0, fa5, fa4
	beqz	a0, .LBB16_18
	j	.LBB16_14
.Lfunc_end16:
	.size	Perl_av_exists, .Lfunc_end16-Perl_av_exists
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_keys                  # -- Begin function Perl_avhv_keys
	.p2align	1
	.type	Perl_avhv_keys,@function
Perl_avhv_keys:                         # @Perl_avhv_keys
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	li	a1, 0
	li	a2, 0
	call	Perl_av_fetch
	beqz	a0, .LBB17_13
# %bb.1:                                # %if.then
	ld	s0, 0(a0)
	lwu	a0, 12(s0)
	slli	a1, a0, 50
	bgez	a1, .LBB17_3
# %bb.2:                                # %if.then2
	mv	a0, s0
	call	Perl_mg_get
	lw	a0, 12(s0)
.LBB17_3:                               # %if.end
	slli	a0, a0, 44
	bgez	a0, .LBB17_13
# %bb.4:                                # %if.then7
	lui	a0, %hi(PL_curcop)
	ld	a1, %lo(PL_curcop)(a0)
	ld	a1, 80(a1)
	beqz	a1, .LBB17_8
# %bb.5:                                # %land.lhs.true
	ld	a1, %lo(PL_curcop)(a0)
	ld	a1, 80(a1)
	li	a2, 32
	beq	a1, a2, .LBB17_8
# %bb.6:                                # %land.lhs.true10
	lui	a1, %hi(PL_curcop)
	ld	a2, %lo(PL_curcop)(a1)
	ld	a2, 80(a2)
	li	a3, 16
	beq	a2, a3, .LBB17_10
# %bb.7:                                # %lor.lhs.false
	ld	a1, %lo(PL_curcop)(a1)
	ld	a1, 80(a1)
	ld	a1, 0(a1)
	ld	a1, 0(a1)
	lbu	a1, 0(a1)
	andi	a1, a1, 16
	bnez	a1, .LBB17_10
.LBB17_8:                               # %lor.lhs.false16
	ld	a0, %lo(PL_curcop)(a0)
	ld	a0, 80(a0)
	bnez	a0, .LBB17_12
# %bb.9:                                # %land.lhs.true20
	lui	a0, %hi(PL_dowarn)
	lbu	a0, %lo(PL_dowarn)(a0)
	andi	a0, a0, 1
	beqz	a0, .LBB17_12
.LBB17_10:                              # %land.lhs.true24
	lui	a1, %hi(.L.str.9)
	addi	a1, a1, %lo(.L.str.9)
	mv	a0, s0
	call	Perl_sv_isa
	bnez	a0, .LBB17_12
# %bb.11:                               # %if.then27
	lui	a1, %hi(.L.str.10)
	addi	a1, a1, %lo(.L.str.10)
	li	a0, 2
	call	Perl_warner
.LBB17_12:                              # %if.end28
	ld	a0, 0(s0)
	ld	a0, 0(a0)
	lbu	a1, 12(a0)
	li	a2, 11
	beq	a1, a2, .LBB17_14
.LBB17_13:                              # %if.end37
	lui	a0, %hi(.L.str.11)
	addi	a0, a0, %lo(.L.str.11)
	call	Perl_croak
	li	a0, 0
.LBB17_14:                              # %cleanup38
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end17:
	.size	Perl_avhv_keys, .Lfunc_end17-Perl_avhv_keys
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_store_ent             # -- Begin function Perl_avhv_store_ent
	.p2align	1
	.type	Perl_avhv_store_ent,@function
Perl_avhv_store_ent:                    # @Perl_avhv_store_ent
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	mv	s0, a2
	mv	s1, a0
	mv	a2, a3
	call	S_avhv_index
	mv	a1, a0
	mv	a0, s1
	mv	a2, s0
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	Perl_av_store
.Lfunc_end18:
	.size	Perl_avhv_store_ent, .Lfunc_end18-Perl_avhv_store_ent
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.p2align	1                               # -- Begin function S_avhv_index
	.type	S_avhv_index,@function
S_avhv_index:                           # @S_avhv_index
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	mv	s0, a2
	mv	s1, a1
	call	Perl_avhv_keys
	mv	a1, s1
	li	a2, 0
	mv	a3, s0
	call	Perl_hv_fetch_ent
	mv	s0, a0
	bnez	a0, .LBB19_5
# %bb.1:                                # %if.then
	lbu	a0, 14(s1)
	andi	a0, a0, 4
	bnez	a0, .LBB19_3
# %bb.2:                                # %cond.false
	mv	a1, sp
	li	a2, 2
	mv	a0, s1
	call	Perl_sv_2pv_flags
	mv	a1, a0
	j	.LBB19_4
.LBB19_3:                               # %cond.true
	ld	a0, 0(s1)
	ld	a1, 8(a0)
	sd	a1, 0(sp)
	ld	a1, 0(a0)
.LBB19_4:                               # %cond.end
	lui	a0, %hi(.L.str.12)
	addi	a0, a0, %lo(.L.str.12)
	call	Perl_croak
.LBB19_5:                               # %if.end
	ld	a0, 16(s0)
	call	S_avhv_index_sv
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end19:
	.size	S_avhv_index, .Lfunc_end19-S_avhv_index
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_fetch_ent             # -- Begin function Perl_avhv_fetch_ent
	.p2align	1
	.type	Perl_avhv_fetch_ent,@function
Perl_avhv_fetch_ent:                    # @Perl_avhv_fetch_ent
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	mv	s0, a2
	mv	s1, a0
	mv	a2, a3
	call	S_avhv_index
	mv	a1, a0
	mv	a0, s1
	mv	a2, s0
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	Perl_av_fetch
.Lfunc_end20:
	.size	Perl_avhv_fetch_ent, .Lfunc_end20-Perl_avhv_fetch_ent
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_delete_ent            # -- Begin function Perl_avhv_delete_ent
	.p2align	1
	.type	Perl_avhv_delete_ent,@function
Perl_avhv_delete_ent:                   # @Perl_avhv_delete_ent
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	mv	s0, a3
	mv	s2, a2
	mv	s1, a1
	mv	s3, a0
	call	Perl_avhv_keys
	mv	a1, s1
	li	a2, 0
	mv	a3, s0
	call	Perl_hv_fetch_ent
	beqz	a0, .LBB21_3
# %bb.1:                                # %lor.lhs.false
	ld	a0, 16(a0)
	lhu	a1, 14(a0)
	andi	a1, a1, 1807
	beqz	a1, .LBB21_3
# %bb.2:                                # %if.end
	call	S_avhv_index_sv
	mv	a1, a0
	mv	a0, s3
	mv	a2, s2
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	tail	Perl_av_delete
.LBB21_3:                               # %cleanup
	li	a0, 0
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end21:
	.size	Perl_avhv_delete_ent, .Lfunc_end21-Perl_avhv_delete_ent
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.p2align	1                               # -- Begin function S_avhv_index_sv
	.type	S_avhv_index_sv,@function
S_avhv_index_sv:                        # @S_avhv_index_sv
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	lbu	a1, 14(a0)
	andi	a1, a1, 1
	bnez	a1, .LBB22_2
# %bb.1:                                # %cond.false
	call	Perl_sv_2iv
	sext.w	s0, a0
	bgtz	s0, .LBB22_4
	j	.LBB22_3
.LBB22_2:                               # %cond.true
	ld	a0, 0(a0)
	ld	a0, 24(a0)
	sext.w	s0, a0
	bgtz	s0, .LBB22_4
.LBB22_3:                               # %if.then
	lui	a0, %hi(.L.str.13)
	addi	a0, a0, %lo(.L.str.13)
	call	Perl_croak
.LBB22_4:                               # %if.end
	mv	a0, s0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end22:
	.size	S_avhv_index_sv, .Lfunc_end22-S_avhv_index_sv
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_exists_ent            # -- Begin function Perl_avhv_exists_ent
	.p2align	1
	.type	Perl_avhv_exists_ent,@function
Perl_avhv_exists_ent:                   # @Perl_avhv_exists_ent
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	sd	s2, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	mv	s1, a2
	mv	s0, a1
	mv	s2, a0
	call	Perl_avhv_keys
	mv	a1, s0
	li	a2, 0
	mv	a3, s1
	call	Perl_hv_fetch_ent
	beqz	a0, .LBB23_3
# %bb.1:                                # %lor.lhs.false
	ld	a0, 16(a0)
	lhu	a1, 14(a0)
	andi	a1, a1, 1807
	beqz	a1, .LBB23_3
# %bb.2:                                # %if.end
	call	S_avhv_index_sv
	mv	a1, a0
	mv	a0, s2
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	tail	Perl_av_exists
.LBB23_3:                               # %cleanup
	li	a0, 0
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	ld	s2, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end23:
	.size	Perl_avhv_exists_ent, .Lfunc_end23-Perl_avhv_exists_ent
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_iternext              # -- Begin function Perl_avhv_iternext
	.p2align	1
	.type	Perl_avhv_iternext,@function
Perl_avhv_iternext:                     # @Perl_avhv_iternext
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	call	Perl_avhv_keys
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	tail	Perl_hv_iternext
.Lfunc_end24:
	.size	Perl_avhv_iternext, .Lfunc_end24-Perl_avhv_iternext
	.cfi_endproc
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	Perl_avhv_iterval               # -- Begin function Perl_avhv_iterval
	.p2align	1
	.type	Perl_avhv_iterval,@function
Perl_avhv_iterval:                      # @Perl_avhv_iterval
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	mv	s0, a1
	mv	s1, a0
	call	Perl_avhv_keys
	mv	a1, s0
	call	Perl_hv_iterval
	call	S_avhv_index_sv
	mv	a1, a0
	li	a2, 1
	mv	a0, s1
	call	Perl_av_fetch
	ld	a0, 0(a0)
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end25:
	.size	Perl_avhv_iterval, .Lfunc_end25-Perl_avhv_iterval
	.cfi_endproc
                                        # -- End function
	.option	pop
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"EXTEND"
	.size	.L.str, 7

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"panic: POPSTACK\n"
	.size	.L.str.1, 17

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"NEGATIVE_INDICES"
	.size	.L.str.2, 17

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"PUSH"
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"POP"
	.size	.L.str.4, 4

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"UNSHIFT"
	.size	.L.str.5, 8

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"SHIFT"
	.size	.L.str.6, 6

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"panic: null array"
	.size	.L.str.7, 18

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"STORESIZE"
	.size	.L.str.8, 10

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"pseudohash"
	.size	.L.str.9, 11

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"Pseudo-hashes are deprecated"
	.size	.L.str.10, 29

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"Can't coerce array into hash"
	.size	.L.str.11, 29

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"No such pseudo-hash field \"%s\""
	.size	.L.str.12, 31

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"Bad index while coercing array into hash"
	.size	.L.str.13, 41

	.ident	"clang version 19.1.0-rc3 (https://github.com/Tomlord1122/llvm-project.git 47d5c3e1c9e2c98b44f2b9ea8aa02100ed00cc52)"
	.section	".note.GNU-stack","",@progbits
