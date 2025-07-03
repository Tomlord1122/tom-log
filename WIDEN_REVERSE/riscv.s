	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"decompress.c"
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.globl	BZ2_decompress                  # -- Begin function BZ2_decompress
	.p2align	1
	.type	BZ2_decompress,@function
BZ2_decompress:                         # @BZ2_decompress
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -368
	.cfi_def_cfa_offset 368
	sd	ra, 360(sp)                     # 8-byte Folded Spill
	sd	s0, 352(sp)                     # 8-byte Folded Spill
	sd	s1, 344(sp)                     # 8-byte Folded Spill
	sd	s2, 336(sp)                     # 8-byte Folded Spill
	sd	s3, 328(sp)                     # 8-byte Folded Spill
	sd	s4, 320(sp)                     # 8-byte Folded Spill
	sd	s5, 312(sp)                     # 8-byte Folded Spill
	sd	s6, 304(sp)                     # 8-byte Folded Spill
	sd	s7, 296(sp)                     # 8-byte Folded Spill
	sd	s8, 288(sp)                     # 8-byte Folded Spill
	sd	s9, 280(sp)                     # 8-byte Folded Spill
	sd	s10, 272(sp)                    # 8-byte Folded Spill
	sd	s11, 264(sp)                    # 8-byte Folded Spill
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
	.cfi_offset s9, -88
	.cfi_offset s10, -96
	.cfi_offset s11, -104
	addi	sp, sp, -160
	.cfi_escape 0x0f, 0x0e, 0x72, 0x00, 0x11, 0xf0, 0x02, 0x22, 0x11, 0x0a, 0x92, 0xa2, 0x38, 0x00, 0x1e, 0x22 # sp + 368 + 10 * vlenb
	lui	a1, 16
	addiw	s9, a1, -1500
	add	s9, s9, a0
	lui	a1, 11
	addiw	a1, a1, -1168
	add	a7, a0, a1
	lui	a1, 2
	addiw	a1, a1, -373
	add	a6, a0, a1
	addi	s1, a0, 2047
	lw	a1, 8(a0)
	ld	s8, 0(a0)
	addi	a2, s1, 1105
	sd	a2, 200(sp)                     # 8-byte Folded Spill
	li	a3, 10
	addi	s0, a0, 1100
	bne	a1, a3, .LBB0_19
# %bb.1:                                # %if.end.thread
	vsetivli	zero, 16, e32, m4, ta, ma
	vmv.v.i	v8, 0
	vs4r.v	v8, (s9)
	addi	a1, s9, 92
	vsetivli	zero, 4, e32, m1, ta, ma
	vmv.v.i	v8, 0
	vs1r.v	v8, (a1)
	addi	a1, s9, 80
	vs1r.v	v8, (a1)
	addi	a1, s9, 64
	vs1r.v	v8, (a1)
	lw	a2, 36(a0)
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_8
.LBB0_2:                                # %if.then29
	sd	a7, 176(sp)                     # 8-byte Folded Spill
	sd	a6, 192(sp)                     # 8-byte Folded Spill
	sd	s1, 184(sp)                     # 8-byte Folded Spill
	sd	s0, 168(sp)                     # 8-byte Folded Spill
	lw	a1, 32(a0)
	sd	zero, 232(sp)                   # 8-byte Folded Spill
	li	t3, 0
	li	t4, 0
	li	a6, 0
	li	ra, 0
	li	t0, 0
	li	s6, 0
	li	t2, 0
	li	t1, 0
	sd	zero, 216(sp)                   # 8-byte Folded Spill
	li	t5, 0
	li	s5, 0
	li	s11, 0
	li	s0, 0
	li	s1, 0
	li	s10, 0
	li	s2, 0
	li	t6, 0
	sd	zero, 224(sp)                   # 8-byte Folded Spill
	li	a7, 0
	li	s3, 0
	li	s7, 0
	sd	zero, 208(sp)                   # 8-byte Folded Spill
	li	s4, 0
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 66
	li	a1, -5
	bne	a3, a4, .LBB0_24
.LBB0_3:                                # %sw.bb62
	li	a3, 11
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_12
.LBB0_4:                                # %if.then69
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 90
	li	a1, -5
	bne	a3, a4, .LBB0_24
.LBB0_5:                                # %sw.bb119
	li	a3, 12
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_16
.LBB0_6:                                # %if.then126
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 104
	li	a1, -5
	beq	a3, a4, .LBB0_42
	j	.LBB0_24
.LBB0_7:                                # %if.end56
                                        #   in Loop: Header=BB0_8 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_2
.LBB0_8:                                # %if.end33
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_22
# %bb.9:                                # %if.end38
                                        #   in Loop: Header=BB0_8 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_7
# %bb.10:                               # %if.then53
                                        #   in Loop: Header=BB0_8 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_7
.LBB0_11:                               # %if.end112
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_4
.LBB0_12:                               # %if.end79
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.13:                               # %if.end85
                                        #   in Loop: Header=BB0_12 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_11
# %bb.14:                               # %if.then108
                                        #   in Loop: Header=BB0_12 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_11
.LBB0_15:                               # %if.end169
                                        #   in Loop: Header=BB0_16 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_6
.LBB0_16:                               # %if.end136
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.17:                               # %if.end142
                                        #   in Loop: Header=BB0_16 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_15
# %bb.18:                               # %if.then165
                                        #   in Loop: Header=BB0_16 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_15
.LBB0_19:                               # %if.end
	sd	a7, 176(sp)                     # 8-byte Folded Spill
	sd	a6, 192(sp)                     # 8-byte Folded Spill
	sd	s1, 184(sp)                     # 8-byte Folded Spill
	sd	s0, 168(sp)                     # 8-byte Folded Spill
	lw	a2, 0(s9)
	sd	a2, 232(sp)                     # 8-byte Folded Spill
	lw	t3, 4(s9)
	lw	t4, 8(s9)
	lw	a6, 12(s9)
	lw	ra, 16(s9)
	lw	t0, 20(s9)
	lw	s6, 24(s9)
	lw	t2, 28(s9)
	lw	t1, 32(s9)
	lw	a2, 36(s9)
	sd	a2, 216(sp)                     # 8-byte Folded Spill
	lw	t5, 40(s9)
	lw	s5, 44(s9)
	lw	s11, 48(s9)
	lw	s0, 52(s9)
	lw	s1, 56(s9)
	lw	s10, 60(s9)
	lw	s2, 64(s9)
	lw	t6, 68(s9)
	lw	a2, 72(s9)
	sd	a2, 224(sp)                     # 8-byte Folded Spill
	lw	a7, 76(s9)
	lw	s3, 80(s9)
	ld	s7, 84(s9)
	ld	a2, 92(s9)
	sd	a2, 208(sp)                     # 8-byte Folded Spill
	ld	s4, 100(s9)
	addi	a1, a1, -11
	li	a2, 39
	bltu	a2, a1, .LBB0_77
# %bb.20:                               # %if.end
	slli	a1, a1, 2
	lui	a2, %hi(.LJTI0_0)
	addi	a2, a2, %lo(.LJTI0_0)
	add	a1, a1, a2
	lw	a1, 0(a1)
	jr	a1
.LBB0_21:                               # %if.end.sw.bb62_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_3
.LBB0_22:
	li	s10, 0
	li	s4, 0
	sd	zero, 208(sp)                   # 8-byte Folded Spill
	li	s7, 0
	li	s3, 0
	li	a7, 0
	sd	zero, 224(sp)                   # 8-byte Folded Spill
	li	t6, 0
	li	s2, 0
	li	s1, 0
	li	s0, 0
	li	s11, 0
	li	s5, 0
	li	t5, 0
	sd	zero, 216(sp)                   # 8-byte Folded Spill
	li	t1, 0
	li	t2, 0
	li	s6, 0
	li	t0, 0
	li	ra, 0
	li	a6, 0
	li	t4, 0
	li	t3, 0
	sd	zero, 232(sp)                   # 8-byte Folded Spill
.LBB0_23:
	li	a1, 0
.LBB0_24:                               # %save_state_and_return
	ld	a0, 232(sp)                     # 8-byte Folded Reload
	sw	a0, 0(s9)
	sw	t3, 4(s9)
	sw	t4, 8(s9)
	sw	a6, 12(s9)
	sw	ra, 16(s9)
	sw	t0, 20(s9)
	sw	s6, 24(s9)
	sw	t2, 28(s9)
	sw	t1, 32(s9)
	ld	a0, 216(sp)                     # 8-byte Folded Reload
	sw	a0, 36(s9)
	sw	t5, 40(s9)
	sw	s5, 44(s9)
	sw	s11, 48(s9)
	sw	s0, 52(s9)
	sw	s1, 56(s9)
	sw	s10, 60(s9)
	sw	s2, 64(s9)
	sw	t6, 68(s9)
	ld	a0, 224(sp)                     # 8-byte Folded Reload
	sw	a0, 72(s9)
	sw	a7, 76(s9)
	sw	s3, 80(s9)
	sd	s7, 84(s9)
	ld	a0, 208(sp)                     # 8-byte Folded Reload
	sd	a0, 92(s9)
	sd	s4, 100(s9)
	mv	a0, a1
	addi	sp, sp, 160
	ld	ra, 360(sp)                     # 8-byte Folded Reload
	ld	s0, 352(sp)                     # 8-byte Folded Reload
	ld	s1, 344(sp)                     # 8-byte Folded Reload
	ld	s2, 336(sp)                     # 8-byte Folded Reload
	ld	s3, 328(sp)                     # 8-byte Folded Reload
	ld	s4, 320(sp)                     # 8-byte Folded Reload
	ld	s5, 312(sp)                     # 8-byte Folded Reload
	ld	s6, 304(sp)                     # 8-byte Folded Reload
	ld	s7, 296(sp)                     # 8-byte Folded Reload
	ld	s8, 288(sp)                     # 8-byte Folded Reload
	ld	s9, 280(sp)                     # 8-byte Folded Reload
	ld	s10, 272(sp)                    # 8-byte Folded Reload
	ld	s11, 264(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 368
	ret
.LBB0_25:                               # %if.end.sw.bb3285_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_182
.LBB0_26:                               # %if.end.sw.bb3171_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_177
.LBB0_27:                               # %if.end.sw.bb3228_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_180
.LBB0_28:                               # %if.end.sw.bb1606_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_260
.LBB0_29:                               # %if.end.sw.bb3114_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_175
.LBB0_30:                               # %if.end.sw.bb451_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_87
.LBB0_31:                               # %if.end.sw.bb337_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_83
.LBB0_32:                               # %if.end.sw.bb3057_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_173
.LBB0_33:                               # %if.end.sw.bb119_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_5
.LBB0_34:                               # %if.end.sw.bb1023_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_109
.LBB0_35:                               # %if.end.sw.bb966_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_107
.LBB0_36:                               # %if.end.sw.bb394_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_85
.LBB0_37:                               # %if.end.sw.bb2943_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_169
.LBB0_38:                               # %if.end.sw.bb508_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_89
.LBB0_39:                               # %if.end.sw.bb743_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_99
.LBB0_40:                               # %if.end.sw.bb800_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_101
.LBB0_41:                               # %if.end.sw.bb176_crit_edge
	lw	a2, 36(a0)
.LBB0_42:                               # %sw.bb176
	li	a3, 13
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_48
.LBB0_43:                               # %if.then183
	lw	a1, 32(a0)
	addi	a3, a2, -8
	srlw	a1, a1, a3
	andi	a2, a1, 255
	sw	a3, 36(a0)
	sw	a2, 40(a0)
	addi	a3, a2, -58
	li	a4, -9
	li	a1, -5
	bltu	a3, a4, .LBB0_24
# %bb.44:                               # %if.end234
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s10, 120(sp)                    # 8-byte Folded Spill
	mv	s10, s3
	mv	s3, s6
	sd	t0, 128(sp)                     # 8-byte Folded Spill
	sd	a7, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	sd	t1, 96(sp)                      # 8-byte Folded Spill
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sd	ra, 144(sp)                     # 8-byte Folded Spill
	mv	s4, t2
	sd	t5, 104(sp)                     # 8-byte Folded Spill
	sd	t4, 64(sp)                      # 8-byte Folded Spill
	sd	t3, 88(sp)                      # 8-byte Folded Spill
	sd	t6, 80(sp)                      # 8-byte Folded Spill
	mv	s7, a6
	addi	a1, a2, -48
	sw	a1, 40(a0)
	mv	s6, a0
	lbu	a2, 44(a0)
	ld	a3, 56(s8)
	ld	a0, 72(s8)
	beqz	a2, .LBB0_78
# %bb.45:                               # %if.then237
	lui	a2, 49
	addiw	a2, a2, -704
	mul	a1, a1, a2
	li	a2, 1
	jalr	a3
	ld	s0, 200(sp)                     # 8-byte Folded Reload
	sd	a0, 8(s0)
	ld	a3, 56(s8)
	lw	a1, 40(s6)
	ld	a0, 72(s8)
	lui	a2, 24
	addi	a2, a2, 1696
	mul	a1, a1, a2
	sraiw	a1, a1, 1
	li	a2, 1
	jalr	a3
	ld	a3, 8(s0)
	sd	a0, 16(s0)
	li	a1, -3
	beqz	a3, .LBB0_226
# %bb.46:                               # %if.then237
	mv	a2, a0
	mv	a0, s6
	mv	a6, s7
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	mv	t2, s4
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	mv	s6, s3
	mv	s3, s10
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	bnez	a2, .LBB0_80
	j	.LBB0_24
.LBB0_47:                               # %if.end225
                                        #   in Loop: Header=BB0_48 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_43
.LBB0_48:                               # %if.end192
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.49:                               # %if.end198
                                        #   in Loop: Header=BB0_48 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_47
# %bb.50:                               # %if.then221
                                        #   in Loop: Header=BB0_48 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_47
.LBB0_51:                               # %if.end.sw.bb565_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_91
.LBB0_52:                               # %if.end.sw.bb2479_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_338
.LBB0_53:                               # %if.end.sw.bb3000_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_171
.LBB0_54:                               # %if.end.sw.bb857_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_103
.LBB0_55:                               # %if.end.sw.bb3399_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_186
.LBB0_56:                               # %if.end.sw.bb686_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_97
.LBB0_57:                               # %if.end.sw.bb909_crit_edge
	lw	a1, 36(a0)
	j	.LBB0_105
.LBB0_58:                               # %if.end.sw.bb1870_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_323
.LBB0_59:                               # %if.end.sw.bb2063_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_332
.LBB0_60:                               # %if.end.sw.bb3342_crit_edge
	lw	a2, 36(a0)
	j	.LBB0_184
.LBB0_61:                               # %if.end.sw.bb1312_crit_edge
	lw	a2, 36(a0)
.LBB0_62:                               # %sw.bb1312
	li	a3, 31
	li	a1, 14
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_74
.LBB0_63:                               # %if.then1319
	mv	s8, s1
	mv	s1, s10
	mv	s10, s6
	lw	a1, 32(a0)
	li	t0, 0
	addi	a2, a2, -15
	srlw	a1, a1, a2
	slli	a1, a1, 49
	srli	s6, a1, 49
	sw	a2, 36(a0)
	beqz	s6, .LBB0_224
# %bb.64:
	sd	t0, 232(sp)                     # 8-byte Folded Spill
	bge	t0, s6, .LBB0_228
.LBB0_65:
	li	t3, 0
	mv	t0, s6
	mv	s6, s10
	mv	s10, s1
	mv	s1, s8
.LBB0_66:                               # %sw.bb1373
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_70 Depth 2
	lw	a1, 36(a0)
	li	a2, 32
	sw	a2, 8(a0)
	blez	a1, .LBB0_70
.LBB0_67:                               # %if.then1380
                                        #   in Loop: Header=BB0_66 Depth=1
	lw	a2, 32(a0)
	addi	a1, a1, -1
	srlw	a2, a2, a1
	andi	a2, a2, 1
	sw	a1, 36(a0)
	beqz	a2, .LBB0_227
# %bb.68:                               # %if.end1429
                                        #   in Loop: Header=BB0_66 Depth=1
	addiw	t3, t3, 1
	li	a1, -4
	blt	t3, ra, .LBB0_66
	j	.LBB0_24
.LBB0_69:                               # %if.end1423
                                        #   in Loop: Header=BB0_70 Depth=2
	lw	a1, 36(a0)
	bgtz	a1, .LBB0_67
.LBB0_70:                               # %if.end1390
                                        #   Parent Loop BB0_66 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	beqz	a3, .LBB0_23
# %bb.71:                               # %if.end1396
                                        #   in Loop: Header=BB0_70 Depth=2
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_69
# %bb.72:                               # %if.then1419
                                        #   in Loop: Header=BB0_70 Depth=2
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_69
.LBB0_73:                               # %if.end1361
                                        #   in Loop: Header=BB0_74 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_63
.LBB0_74:                               # %if.end1328
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.75:                               # %if.end1334
                                        #   in Loop: Header=BB0_74 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_73
# %bb.76:                               # %if.then1357
                                        #   in Loop: Header=BB0_74 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_73
.LBB0_77:                               # %sw.default
	lui	a0, 1
	addiw	a0, a0, -95
	mv	a1, s1
	mv	s1, a6
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s11, 104(sp)                    # 8-byte Folded Spill
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sd	s10, 120(sp)                    # 8-byte Folded Spill
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	mv	s10, a1
	mv	s8, t6
	mv	s2, t3
	mv	s11, t4
	mv	s4, t5
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	mv	s6, t2
	mv	s5, ra
	mv	s7, t1
	mv	s0, a7
	mv	s3, t0
	call	BZ2_bz__AssertH__fail
	lui	a0, 1
	addiw	a0, a0, -94
	call	BZ2_bz__AssertH__fail
	mv	t0, s3
	mv	a7, s0
	mv	t1, s7
	mv	ra, s5
	mv	t2, s6
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	mv	t5, s4
	mv	t4, s11
	mv	t3, s2
	mv	t6, s8
	mv	a0, s10
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	mv	a6, s1
	mv	s1, a0
	j	.LBB0_23
.LBB0_78:                               # %if.else
	lui	a2, 98
	addiw	a2, a2, -1408
	mul	a1, a1, a2
	li	a2, 1
	jalr	a3
	ld	a1, 200(sp)                     # 8-byte Folded Reload
	sd	a0, 0(a1)
	beqz	a0, .LBB0_225
# %bb.79:
	mv	a0, s6
	mv	a6, s7
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	mv	t2, s4
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	mv	s6, s3
	mv	s3, s10
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
.LBB0_80:                               # %sw.bb275
	lw	a2, 36(a0)
	li	a3, 14
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_142
.LBB0_81:                               # %if.then282
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	andi	a3, a1, 255
	li	a1, 23
	sw	a2, 36(a0)
	beq	a3, a1, .LBB0_169
# %bb.82:                               # %if.then282
	li	a4, 49
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_83:                               # %sw.bb337
	li	a3, 15
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_166
.LBB0_84:                               # %if.then344
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 65
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_85:                               # %sw.bb394
	li	a3, 16
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_162
.LBB0_86:                               # %if.then401
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 89
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_87:                               # %sw.bb451
	li	a3, 17
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_158
.LBB0_88:                               # %if.then458
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 38
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_89:                               # %sw.bb508
	li	a3, 18
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_154
.LBB0_90:                               # %if.then515
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 83
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_91:                               # %sw.bb565
	li	a3, 19
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_150
.LBB0_92:                               # %if.then572
	lw	a1, 32(a0)
	addi	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a2, a1, 255
	li	a3, 89
	li	a1, -4
	bne	a2, a3, .LBB0_24
# %bb.93:                               # %if.end621
	lw	a2, 48(a0)
	lw	a1, 52(a0)
	addiw	a2, a2, 1
	li	a3, 2
	sw	a2, 48(a0)
	bge	a1, a3, .LBB0_259
.LBB0_94:                               # %if.end628
	ld	a1, 200(sp)                     # 8-byte Folded Reload
	sw	zero, 24(a1)
.LBB0_95:                               # %sw.bb629
	lw	a2, 36(a0)
	li	a3, 20
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_146
.LBB0_96:                               # %if.then636
	lw	a3, 32(a0)
	ld	a5, 200(sp)                     # 8-byte Folded Reload
	lw	a4, 24(a5)
	addiw	a1, a2, -8
	srlw	a2, a3, a1
	sw	a1, 36(a0)
	slli	a4, a4, 8
	andi	a2, a2, 255
	or	a2, a2, a4
	sw	a2, 24(a5)
.LBB0_97:                               # %sw.bb686
	li	a3, 21
	li	a2, 7
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_138
.LBB0_98:                               # %if.then693
	lw	a2, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 24(a4)
	addiw	a1, a1, -8
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	slli	a3, a3, 8
	andi	a2, a2, 255
	or	a2, a2, a3
	sw	a2, 24(a4)
.LBB0_99:                               # %sw.bb743
	li	a3, 22
	li	a2, 7
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_130
.LBB0_100:                              # %if.then750
	lw	a2, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 24(a4)
	addiw	a1, a1, -8
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	slli	a3, a3, 8
	andi	a2, a2, 255
	or	a2, a2, a3
	sw	a2, 24(a4)
.LBB0_101:                              # %sw.bb800
	li	a3, 23
	li	a2, 7
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_126
.LBB0_102:                              # %if.then807
	lw	a2, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 24(a4)
	addiw	a1, a1, -8
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	slli	a3, a3, 8
	andi	a2, a2, 255
	or	a2, a2, a3
	sw	a2, 24(a4)
.LBB0_103:                              # %sw.bb857
	li	a2, 24
	sw	a2, 8(a0)
	blez	a1, .LBB0_134
.LBB0_104:                              # %if.then864
	lw	a2, 32(a0)
	addiw	a1, a1, -1
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	andi	a2, a2, 1
	sb	a2, 20(a0)
	sw	zero, 56(a0)
.LBB0_105:                              # %sw.bb909
	li	a3, 25
	li	a2, 7
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_122
.LBB0_106:                              # %if.then916
	lw	a2, 32(a0)
	lw	a3, 56(a0)
	addiw	a1, a1, -8
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	slli	a3, a3, 8
	andi	a2, a2, 255
	or	a2, a2, a3
	sw	a2, 56(a0)
.LBB0_107:                              # %sw.bb966
	li	a3, 26
	li	a2, 7
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_118
.LBB0_108:                              # %if.then973
	lw	a2, 32(a0)
	lw	a3, 56(a0)
	addiw	a1, a1, -8
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	slli	a3, a3, 8
	andi	a2, a2, 255
	or	a2, a2, a3
	sw	a2, 56(a0)
.LBB0_109:                              # %sw.bb1023
	li	a3, 27
	li	a2, 7
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_114
.LBB0_110:                              # %if.then1030
	lw	a2, 32(a0)
	lw	a3, 56(a0)
	addi	a1, a1, -8
	srlw	a2, a2, a1
	sw	a1, 36(a0)
	slliw	a3, a3, 8
	andi	a2, a2, 255
	or	a2, a2, a3
	sw	a2, 56(a0)
	li	a1, -4
	bltz	a3, .LBB0_24
# %bb.111:                              # %if.end1084
	lw	a3, 40(a0)
	lui	a4, 24
	addi	a4, a4, 1696
	mulw	a3, a3, a4
	addi	a3, a3, 10
	blt	a3, a2, .LBB0_24
# %bb.112:
	li	a3, 0
	j	.LBB0_266
.LBB0_113:                              # %if.end1073
                                        #   in Loop: Header=BB0_114 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_110
.LBB0_114:                              # %if.end1040
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.115:                              # %if.end1046
                                        #   in Loop: Header=BB0_114 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_113
# %bb.116:                              # %if.then1069
                                        #   in Loop: Header=BB0_114 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_113
.LBB0_117:                              # %if.end1016
                                        #   in Loop: Header=BB0_118 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_108
.LBB0_118:                              # %if.end983
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.119:                              # %if.end989
                                        #   in Loop: Header=BB0_118 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_117
# %bb.120:                              # %if.then1012
                                        #   in Loop: Header=BB0_118 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_117
.LBB0_121:                              # %if.end959
                                        #   in Loop: Header=BB0_122 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_106
.LBB0_122:                              # %if.end926
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.123:                              # %if.end932
                                        #   in Loop: Header=BB0_122 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_121
# %bb.124:                              # %if.then955
                                        #   in Loop: Header=BB0_122 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_121
.LBB0_125:                              # %if.end850
                                        #   in Loop: Header=BB0_126 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_102
.LBB0_126:                              # %if.end817
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.127:                              # %if.end823
                                        #   in Loop: Header=BB0_126 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_125
# %bb.128:                              # %if.then846
                                        #   in Loop: Header=BB0_126 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_125
.LBB0_129:                              # %if.end793
                                        #   in Loop: Header=BB0_130 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_100
.LBB0_130:                              # %if.end760
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.131:                              # %if.end766
                                        #   in Loop: Header=BB0_130 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_129
# %bb.132:                              # %if.then789
                                        #   in Loop: Header=BB0_130 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_129
.LBB0_133:                              # %if.end907
                                        #   in Loop: Header=BB0_134 Depth=1
	lw	a1, 36(a0)
	bgtz	a1, .LBB0_104
.LBB0_134:                              # %if.end874
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	beqz	a3, .LBB0_23
# %bb.135:                              # %if.end880
                                        #   in Loop: Header=BB0_134 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_133
# %bb.136:                              # %if.then903
                                        #   in Loop: Header=BB0_134 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_133
.LBB0_137:                              # %if.end736
                                        #   in Loop: Header=BB0_138 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_98
.LBB0_138:                              # %if.end703
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.139:                              # %if.end709
                                        #   in Loop: Header=BB0_138 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_137
# %bb.140:                              # %if.then732
                                        #   in Loop: Header=BB0_138 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_137
.LBB0_141:                              # %if.end325
                                        #   in Loop: Header=BB0_142 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_81
.LBB0_142:                              # %if.end292
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.143:                              # %if.end298
                                        #   in Loop: Header=BB0_142 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_141
# %bb.144:                              # %if.then321
                                        #   in Loop: Header=BB0_142 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_141
.LBB0_145:                              # %if.end679
                                        #   in Loop: Header=BB0_146 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_96
.LBB0_146:                              # %if.end646
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.147:                              # %if.end652
                                        #   in Loop: Header=BB0_146 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_145
# %bb.148:                              # %if.then675
                                        #   in Loop: Header=BB0_146 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_145
.LBB0_149:                              # %if.end615
                                        #   in Loop: Header=BB0_150 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_92
.LBB0_150:                              # %if.end582
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.151:                              # %if.end588
                                        #   in Loop: Header=BB0_150 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_149
# %bb.152:                              # %if.then611
                                        #   in Loop: Header=BB0_150 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_149
.LBB0_153:                              # %if.end558
                                        #   in Loop: Header=BB0_154 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_90
.LBB0_154:                              # %if.end525
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.155:                              # %if.end531
                                        #   in Loop: Header=BB0_154 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_153
# %bb.156:                              # %if.then554
                                        #   in Loop: Header=BB0_154 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_153
.LBB0_157:                              # %if.end501
                                        #   in Loop: Header=BB0_158 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_88
.LBB0_158:                              # %if.end468
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.159:                              # %if.end474
                                        #   in Loop: Header=BB0_158 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_157
# %bb.160:                              # %if.then497
                                        #   in Loop: Header=BB0_158 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_157
.LBB0_161:                              # %if.end444
                                        #   in Loop: Header=BB0_162 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_86
.LBB0_162:                              # %if.end411
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.163:                              # %if.end417
                                        #   in Loop: Header=BB0_162 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_161
# %bb.164:                              # %if.then440
                                        #   in Loop: Header=BB0_162 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_161
.LBB0_165:                              # %if.end387
                                        #   in Loop: Header=BB0_166 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_84
.LBB0_166:                              # %if.end354
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.167:                              # %if.end360
                                        #   in Loop: Header=BB0_166 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_165
# %bb.168:                              # %if.then383
                                        #   in Loop: Header=BB0_166 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_165
.LBB0_169:                              # %sw.bb2943
	li	a3, 42
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_221
.LBB0_170:                              # %if.then2950
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 114
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_171:                              # %sw.bb3000
	li	a3, 43
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_217
.LBB0_172:                              # %if.then3007
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 69
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_173:                              # %sw.bb3057
	li	a3, 44
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_213
.LBB0_174:                              # %if.then3064
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 56
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_175:                              # %sw.bb3114
	li	a3, 45
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_209
.LBB0_176:                              # %if.then3121
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 80
	li	a1, -4
	bne	a3, a4, .LBB0_24
.LBB0_177:                              # %sw.bb3171
	li	a3, 46
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_205
.LBB0_178:                              # %if.then3178
	lw	a1, 32(a0)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	andi	a3, a1, 255
	li	a4, 144
	li	a1, -4
	bne	a3, a4, .LBB0_24
# %bb.179:                              # %if.end3227
	ld	a1, 200(sp)                     # 8-byte Folded Reload
	sw	zero, 28(a1)
.LBB0_180:                              # %sw.bb3228
	li	a3, 47
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_201
.LBB0_181:                              # %if.then3235
	lw	a1, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 28(a4)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	slli	a3, a3, 8
	andi	a1, a1, 255
	or	a1, a1, a3
	sw	a1, 28(a4)
.LBB0_182:                              # %sw.bb3285
	li	a3, 48
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_197
.LBB0_183:                              # %if.then3292
	lw	a1, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 28(a4)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	slli	a3, a3, 8
	andi	a1, a1, 255
	or	a1, a1, a3
	sw	a1, 28(a4)
.LBB0_184:                              # %sw.bb3342
	li	a3, 49
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_193
.LBB0_185:                              # %if.then3349
	lw	a1, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 28(a4)
	addiw	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	slli	a3, a3, 8
	andi	a1, a1, 255
	or	a1, a1, a3
	sw	a1, 28(a4)
.LBB0_186:                              # %sw.bb3399
	li	a3, 50
	li	a1, 7
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_189
.LBB0_187:                              # %if.then3406
	lw	a1, 32(a0)
	ld	a4, 200(sp)                     # 8-byte Folded Reload
	lw	a3, 28(a4)
	addi	a2, a2, -8
	srlw	a1, a1, a2
	sw	a2, 36(a0)
	slli	a3, a3, 8
	andi	a1, a1, 255
	or	a1, a1, a3
	sw	a1, 28(a4)
	li	a1, 1
	sw	a1, 8(a0)
	li	a1, 4
	j	.LBB0_24
.LBB0_188:                              # %if.end3449
                                        #   in Loop: Header=BB0_189 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_187
.LBB0_189:                              # %if.end3416
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.190:                              # %if.end3422
                                        #   in Loop: Header=BB0_189 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_188
# %bb.191:                              # %if.then3445
                                        #   in Loop: Header=BB0_189 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_188
.LBB0_192:                              # %if.end3392
                                        #   in Loop: Header=BB0_193 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_185
.LBB0_193:                              # %if.end3359
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.194:                              # %if.end3365
                                        #   in Loop: Header=BB0_193 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_192
# %bb.195:                              # %if.then3388
                                        #   in Loop: Header=BB0_193 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_192
.LBB0_196:                              # %if.end3335
                                        #   in Loop: Header=BB0_197 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_183
.LBB0_197:                              # %if.end3302
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.198:                              # %if.end3308
                                        #   in Loop: Header=BB0_197 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_196
# %bb.199:                              # %if.then3331
                                        #   in Loop: Header=BB0_197 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_196
.LBB0_200:                              # %if.end3278
                                        #   in Loop: Header=BB0_201 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_181
.LBB0_201:                              # %if.end3245
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.202:                              # %if.end3251
                                        #   in Loop: Header=BB0_201 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_200
# %bb.203:                              # %if.then3274
                                        #   in Loop: Header=BB0_201 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_200
.LBB0_204:                              # %if.end3221
                                        #   in Loop: Header=BB0_205 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_178
.LBB0_205:                              # %if.end3188
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.206:                              # %if.end3194
                                        #   in Loop: Header=BB0_205 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_204
# %bb.207:                              # %if.then3217
                                        #   in Loop: Header=BB0_205 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_204
.LBB0_208:                              # %if.end3164
                                        #   in Loop: Header=BB0_209 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_176
.LBB0_209:                              # %if.end3131
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.210:                              # %if.end3137
                                        #   in Loop: Header=BB0_209 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_208
# %bb.211:                              # %if.then3160
                                        #   in Loop: Header=BB0_209 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_208
.LBB0_212:                              # %if.end3107
                                        #   in Loop: Header=BB0_213 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_174
.LBB0_213:                              # %if.end3074
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.214:                              # %if.end3080
                                        #   in Loop: Header=BB0_213 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_212
# %bb.215:                              # %if.then3103
                                        #   in Loop: Header=BB0_213 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_212
.LBB0_216:                              # %if.end3050
                                        #   in Loop: Header=BB0_217 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_172
.LBB0_217:                              # %if.end3017
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.218:                              # %if.end3023
                                        #   in Loop: Header=BB0_217 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_216
# %bb.219:                              # %if.then3046
                                        #   in Loop: Header=BB0_217 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_216
.LBB0_220:                              # %if.end2993
                                        #   in Loop: Header=BB0_221 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_170
.LBB0_221:                              # %if.end2960
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	beqz	a4, .LBB0_23
# %bb.222:                              # %if.end2966
                                        #   in Loop: Header=BB0_221 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_220
# %bb.223:                              # %if.then2989
                                        #   in Loop: Header=BB0_221 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_220
.LBB0_224:
	li	a1, -4
	mv	s6, s10
	mv	s10, s1
	mv	s1, s8
	j	.LBB0_24
.LBB0_225:
	li	a1, -3
.LBB0_226:
	mv	a6, s7
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	mv	t2, s4
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	mv	s6, s3
	mv	s3, s10
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	j	.LBB0_24
.LBB0_227:                              # %while.end1435
	mv	s8, s1
	mv	s1, s10
	mv	s10, s6
	ld	a3, 232(sp)                     # 8-byte Folded Reload
	add	a1, a0, a3
	lui	a2, 6
	add	a1, a1, a2
	sb	t3, 1310(a1)
	addiw	a3, a3, 1
	mv	s6, t0
	sd	a3, 232(sp)                     # 8-byte Folded Spill
	blt	a3, t0, .LBB0_65
.LBB0_228:                              # %for.end1441
	blez	ra, .LBB0_233
# %bb.229:                              # %for.body1447.preheader
	li	a1, 32
	bgeu	ra, a1, .LBB0_254
# %bb.230:
	li	a1, 0
.LBB0_231:                              # %scalar.ph
	addi	a2, sp, 242
.LBB0_232:                              # %for.body1447
                                        # =>This Inner Loop Header: Depth=1
	andi	a3, a1, 255
	add	a3, a3, a2
	sb	a1, 0(a3)
	addi	a1, a1, 1
	andi	a3, a1, 255
	bltu	a3, ra, .LBB0_232
.LBB0_233:                              # %for.cond1453.preheader
	blez	s6, .LBB0_252
# %bb.234:                              # %for.body1456.lr.ph
	sd	t1, 96(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	t2, 32(sp)                      # 8-byte Folded Spill
	sd	t5, 104(sp)                     # 8-byte Folded Spill
	sd	t3, 88(sp)                      # 8-byte Folded Spill
	sd	s1, 120(sp)                     # 8-byte Folded Spill
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	t6, 80(sp)                      # 8-byte Folded Spill
	sd	a7, 112(sp)                     # 8-byte Folded Spill
	sd	ra, 144(sp)                     # 8-byte Folded Spill
	mv	ra, a6
	li	s7, 0
	li	s0, -1
	srli	s0, s0, 32
	lui	a2, 6
	addiw	t0, a2, 1310
	add	t0, t0, a0
	lui	a2, 2
	addiw	t2, a2, -308
	add	t2, t2, a0
	li	t4, 16
	addi	a6, sp, 227
	li	t3, -16
	addi	a7, sp, 241
	addi	a3, sp, 242
	li	t1, 64
	j	.LBB0_236
.LBB0_235:                              # %while.end1474
                                        #   in Loop: Header=BB0_236 Depth=1
	sb	s4, 242(sp)
	add	a1, t2, s7
	addi	s7, s7, 1
	sb	s4, 0(a1)
	beq	s7, s6, .LBB0_251
.LBB0_236:                              # %for.body1456
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_249 Depth 2
                                        #     Child Loop BB0_240 Depth 2
	add	a2, t0, s7
	lbu	a1, 0(a2)
	add	a5, a3, a1
	lbu	s4, 0(a5)
	beqz	a1, .LBB0_235
# %bb.237:                              # %while.body1466.preheader
                                        #   in Loop: Header=BB0_236 Depth=1
	bgeu	a1, t1, .LBB0_241
.LBB0_238:                              #   in Loop: Header=BB0_236 Depth=1
	mv	s5, a1
	mv	t5, a1
.LBB0_239:                              # %scalar.ph5587
                                        #   in Loop: Header=BB0_236 Depth=1
	add	a2, a3, s5
	add	a4, s5, s0
	addi	t5, t5, -1
	andi	a1, t5, 255
	add	a5, a7, s5
	sub	a5, a5, a1
.LBB0_240:                              # %while.body1466
                                        #   Parent Loop BB0_236 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	and	a1, a4, s0
	add	a1, a1, a3
	lbu	a1, 0(a1)
	sb	a1, 0(a2)
	addi	a2, a2, -1
	addi	a4, a4, -1
	bne	a2, a5, .LBB0_240
	j	.LBB0_235
.LBB0_241:                              # %vector.scevcheck5578
                                        #   in Loop: Header=BB0_236 Depth=1
	addi	a4, a1, -1
	andi	s1, a4, -256
	bltu	a4, s1, .LBB0_238
# %bb.242:                              # %vector.scevcheck5578
                                        #   in Loop: Header=BB0_236 Depth=1
	bnez	zero, .LBB0_238
# %bb.243:                              # %vector.scevcheck5578
                                        #   in Loop: Header=BB0_236 Depth=1
	andi	s1, a4, 255
	sub	a2, a5, s1
	bltu	a5, a2, .LBB0_238
# %bb.244:                              # %vector.scevcheck5578
                                        #   in Loop: Header=BB0_236 Depth=1
	bnez	zero, .LBB0_238
# %bb.245:                              # %vector.scevcheck5578
                                        #   in Loop: Header=BB0_236 Depth=1
	slli	a4, a4, 32
	srli	a4, a4, 32
	add	a4, a4, a3
	sub	a2, a4, s1
	bltu	a4, a2, .LBB0_238
# %bb.246:                              # %vector.scevcheck5578
                                        #   in Loop: Header=BB0_236 Depth=1
	bnez	zero, .LBB0_238
# %bb.247:                              # %vector.memcheck
                                        #   in Loop: Header=BB0_236 Depth=1
	addi	a2, a1, -1
	slli	a2, a2, 32
	srli	a2, a2, 32
	sub	a2, a2, a1
	bltu	a2, t4, .LBB0_238
# %bb.248:                              # %vector.ph5589
                                        #   in Loop: Header=BB0_236 Depth=1
	andi	s5, a1, 15
	andi	t6, a1, 240
	sub	t5, a1, t6
	add	s1, a6, a1
	add	a2, a1, s0
	mv	a4, t6
	vsetivli	zero, 16, e8, m1, ta, ma
.LBB0_249:                              # %vector.body5596
                                        #   Parent Loop BB0_236 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	and	a5, a2, s0
	add	a5, a5, a3
	addi	a5, a5, -15
	vl1r.v	v8, (a5)
	vrev.v	v8, v8
	vrev.v	v8, v8
	vs1r.v	v8, (s1)
	sub	a4, a4, t4
	add	s1, s1, t3
	sub	a2, a2, t4
	bnez	a4, .LBB0_249
# %bb.250:                              # %middle.block5586
                                        #   in Loop: Header=BB0_236 Depth=1
	beq	a1, t6, .LBB0_235
	j	.LBB0_239
.LBB0_251:
	mv	a3, s6
	mv	a6, ra
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 120(sp)                     # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	t2, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	j	.LBB0_253
.LBB0_252:
	li	a3, 0
.LBB0_253:                              # %for.end1480
	li	t4, 0
	j	.LBB0_274
.LBB0_254:                              # %vector.scevcheck
	addiw	a2, ra, -1
	andi	a4, a2, 255
	li	a3, 255
	li	a1, 0
	beq	a4, a3, .LBB0_231
# %bb.255:                              # %vector.scevcheck
	bltu	a3, a2, .LBB0_231
# %bb.256:                              # %vector.ph
	li	a2, 0
	andi	a1, ra, -32
	li	a3, 32
	vsetvli	a4, zero, e8, m2, ta, ma
	vid.v	v8
	addi	a4, sp, 242
.LBB0_257:                              # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	andi	a5, a2, 255
	add	a5, a5, a4
	vs2r.v	v8, (a5)
	addw	a2, a2, a3
	vadd.vx	v8, v8, a3
	bne	a1, a2, .LBB0_257
# %bb.258:                              # %middle.block
	bne	ra, a1, .LBB0_231
	j	.LBB0_233
.LBB0_259:                              # %if.then625
	lui	a1, %hi(stderr)
	ld	a3, %lo(stderr)(a1)
	lui	a1, %hi(.L.str)
	addi	a1, a1, %lo(.L.str)
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	a0, 24(sp)                      # 8-byte Folded Spill
	mv	a0, a3
	mv	s1, a6
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	mv	s0, t6
	mv	s3, t3
	mv	s7, s10
	mv	s10, t4
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	mv	s6, t5
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sd	t2, 32(sp)                      # 8-byte Folded Spill
	mv	s8, ra
	sd	t1, 96(sp)                      # 8-byte Folded Spill
	mv	s4, a7
	sd	t0, 128(sp)                     # 8-byte Folded Spill
	call	fprintf
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	mv	a7, s4
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	mv	ra, s8
	ld	t2, 32(sp)                      # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	mv	t5, s6
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	mv	t4, s10
	mv	s10, s7
	mv	t3, s3
	mv	t6, s0
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	mv	a6, s1
	ld	a0, 24(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	j	.LBB0_94
.LBB0_260:                              # %sw.bb1606
	li	a2, 35
	sw	a2, 8(a0)
	blez	a1, .LBB0_263
.LBB0_261:                              # %if.then1613
	lw	a2, 32(a0)
	addi	a1, a1, -1
	sw	a1, 36(a0)
	srlw	a1, a2, a1
	slli	a1, a1, 63
	srai	a1, a1, 63
	ori	a1, a1, 1
	add	s1, s1, a1
	ld	a3, 232(sp)                     # 8-byte Folded Reload
	j	.LBB0_278
.LBB0_262:                              # %if.end1656
                                        #   in Loop: Header=BB0_263 Depth=1
	lw	a1, 36(a0)
	bgtz	a1, .LBB0_261
.LBB0_263:                              # %if.end1623
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_264
	j	.LBB0_23
.LBB0_264:                              # %if.end1629
                                        #   in Loop: Header=BB0_263 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_262
# %bb.265:                              # %if.then1652
                                        #   in Loop: Header=BB0_263 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_262
.LBB0_266:                              # %for.cond
	li	a1, 16
	sd	a3, 232(sp)                     # 8-byte Folded Spill
	bge	a3, a1, .LBB0_273
.LBB0_267:                              # %sw.bb1095
	lw	a1, 36(a0)
	li	a2, 28
	sw	a2, 8(a0)
	blez	a1, .LBB0_270
.LBB0_268:                              # %if.then1102
	lw	a2, 32(a0)
	addi	a1, a1, -1
	sw	a1, 36(a0)
	srlw	a1, a2, a1
	ld	a3, 232(sp)                     # 8-byte Folded Reload
	add	a2, a0, a3
	addi	a2, a2, 2047
	andi	a1, a1, 1
	sb	a1, 1405(a2)
	addiw	a3, a3, 1
	j	.LBB0_266
.LBB0_269:                              # %if.end1145
                                        #   in Loop: Header=BB0_270 Depth=1
	lw	a1, 36(a0)
	bgtz	a1, .LBB0_268
.LBB0_270:                              # %if.end1112
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_271
	j	.LBB0_23
.LBB0_271:                              # %if.end1118
                                        #   in Loop: Header=BB0_270 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_269
# %bb.272:                              # %if.then1141
                                        #   in Loop: Header=BB0_270 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_269
.LBB0_273:                              # %for.cond1157.preheader
	ld	a1, 184(sp)                     # 8-byte Folded Reload
	addi	a1, a1, 1149
	li	a2, 256
	sd	s10, 120(sp)                    # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s11, 104(sp)                    # 8-byte Folded Spill
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	a0, 24(sp)                      # 8-byte Folded Spill
	mv	a0, a1
	li	a1, 0
	mv	s1, a6
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	mv	s0, t6
	mv	s7, t3
	mv	s2, t4
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	mv	s4, t5
	mv	s11, s5
	mv	s5, t2
	mv	s3, ra
	mv	s10, t1
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	mv	s6, a7
	mv	s8, t0
	call	memset
	mv	t0, s8
	mv	a7, s6
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	mv	t1, s10
	mv	ra, s3
	mv	t2, s5
	mv	s5, s11
	mv	t5, s4
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	mv	t4, s2
	mv	t3, s7
	mv	t6, s0
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	mv	a6, s1
	ld	a0, 24(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	li	a2, 0
	j	.LBB0_345
.LBB0_274:                              # %for.cond1481
	sd	a3, 232(sp)                     # 8-byte Folded Spill
	bge	t4, ra, .LBB0_292
# %bb.275:
	mv	t0, s6
	mv	s6, s10
	mv	s10, s1
	mv	s1, s8
.LBB0_276:                              # %sw.bb1485
	lw	a1, 36(a0)
	li	a3, 33
	li	a2, 4
	sw	a3, 8(a0)
	bge	a2, a1, .LBB0_285
.LBB0_277:                              # %if.then1492
	lw	a2, 32(a0)
	li	a3, 0
	addi	a1, a1, -5
	srlw	a2, a2, a1
	andi	s1, a2, 31
	sw	a1, 36(a0)
	blez	a6, .LBB0_283
.LBB0_278:                              # %while.cond1540
	addiw	a1, s1, -21
	li	a2, -20
	bltu	a1, a2, .LBB0_304
# %bb.279:
	sd	a3, 232(sp)                     # 8-byte Folded Spill
.LBB0_280:                              # %sw.bb1549
	lw	a1, 36(a0)
	li	a2, 34
	sw	a2, 8(a0)
	blez	a1, .LBB0_289
.LBB0_281:                              # %if.then1556
	lw	a2, 32(a0)
	addiw	a1, a1, -1
	srlw	a2, a2, a1
	andi	a2, a2, 1
	sw	a1, 36(a0)
	bnez	a2, .LBB0_260
# %bb.282:                              # %while.end1666
	li	a1, 258
	mul	a1, t4, a1
	ld	a4, 232(sp)                     # 8-byte Folded Reload
	add	a2, a0, a4
	lui	a3, 11
	add	a2, a2, a3
	add	a1, a1, a2
	sb	s1, -1168(a1)
	addiw	a3, a4, 1
	blt	a3, a6, .LBB0_278
.LBB0_283:                              # %for.inc1675
	mv	s8, s1
	mv	s1, s10
	mv	s10, s6
	addiw	t4, t4, 1
	mv	s6, t0
	j	.LBB0_274
.LBB0_284:                              # %if.end1534
                                        #   in Loop: Header=BB0_285 Depth=1
	lw	a1, 36(a0)
	blt	a2, a1, .LBB0_277
.LBB0_285:                              # %if.end1501
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	bnez	a4, .LBB0_286
	j	.LBB0_23
.LBB0_286:                              # %if.end1507
                                        #   in Loop: Header=BB0_285 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a3)
	addi	a1, a1, 1
	sd	a1, 0(a3)
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	addi	a3, a3, -1
	sw	a3, 8(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	addi	a3, a3, 1
	sw	a3, 12(a1)
	ld	a1, 0(a0)
	lw	a3, 12(a1)
	bnez	a3, .LBB0_284
# %bb.287:                              # %if.then1530
                                        #   in Loop: Header=BB0_285 Depth=1
	lw	a3, 16(a1)
	addi	a3, a3, 1
	sw	a3, 16(a1)
	j	.LBB0_284
.LBB0_288:                              # %if.end1599
                                        #   in Loop: Header=BB0_289 Depth=1
	lw	a1, 36(a0)
	bgtz	a1, .LBB0_281
.LBB0_289:                              # %if.end1566
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_290
	j	.LBB0_23
.LBB0_290:                              # %if.end1572
                                        #   in Loop: Header=BB0_289 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_288
# %bb.291:                              # %if.then1595
                                        #   in Loop: Header=BB0_289 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_288
.LBB0_292:                              # %for.cond1678.preheader
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	a6, 56(sp)                      # 8-byte Folded Spill
	sd	t6, 80(sp)                      # 8-byte Folded Spill
	sd	s11, 104(sp)                    # 8-byte Folded Spill
	sd	t3, 88(sp)                      # 8-byte Folded Spill
	sd	s1, 120(sp)                     # 8-byte Folded Spill
	sd	ra, 144(sp)                     # 8-byte Folded Spill
	sd	a7, 112(sp)                     # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	blez	ra, .LBB0_306
# %bb.293:                              # %for.cond1682.preheader.lr.ph
	sd	s8, 72(sp)                      # 8-byte Folded Spill
	li	s3, 0
	lui	a1, 11
	addiw	a2, a1, 380
	add	a2, a2, a0
	sd	a2, 232(sp)                     # 8-byte Folded Spill
	lui	a2, 13
	addiw	a2, a2, -1620
	add	a2, a2, a0
	sd	a2, 128(sp)                     # 8-byte Folded Spill
	lui	a2, 14
	addiw	s5, a2, 476
	add	s5, s5, a0
	sd	s5, 96(sp)                      # 8-byte Folded Spill
	lui	a2, 16
	addiw	s0, a2, -1524
	add	s5, a0, s0
	slli	a2, a6, 32
	srli	s4, a2, 32
	li	s8, 8
	addiw	a1, a1, -1168
	add	a1, a1, s4
	sd	a1, 64(sp)                      # 8-byte Folded Spill
	li	a1, 32
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.x	v8, a1
	addi	a1, sp, 288
	vs2r.v	v8, (a1)                        # Unknown-size Folded Spill
	andi	s7, s4, -8
	vmv.v.i	v8, 0
	addi	a1, sp, 256
	vs2r.v	v8, (a1)                        # Unknown-size Folded Spill
	ld	s0, 176(sp)                     # 8-byte Folded Reload
	mv	s10, s0
	j	.LBB0_296
.LBB0_294:                              #   in Loop: Header=BB0_296 Depth=1
	li	a5, 0
	li	s1, 32
.LBB0_295:                              # %for.end1720
                                        #   in Loop: Header=BB0_296 Depth=1
	li	a1, 1032
	mul	a3, s3, a1
	ld	a4, 232(sp)                     # 8-byte Folded Reload
	add	a4, a4, a3
	ld	a1, 128(sp)                     # 8-byte Folded Reload
	add	a1, a1, a3
	ld	a2, 96(sp)                      # 8-byte Folded Reload
	add	a2, a2, a3
	add	a3, s0, a7
	mv	s11, a0
	mv	a0, a4
	mv	a4, s1
	call	BZ2_hbCreateDecodeTables
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	mv	a0, s11
	slli	a1, s3, 2
	add	a1, a1, s5
	sw	s1, 0(a1)
	addi	s3, s3, 1
	addi	s10, s10, 258
	ld	a1, 144(sp)                     # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	beq	s3, a1, .LBB0_305
.LBB0_296:                              # %for.cond1682.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_300 Depth 2
                                        #     Child Loop BB0_303 Depth 2
	li	a1, 258
	mul	a7, s3, a1
	blez	a6, .LBB0_294
# %bb.297:                              # %for.body1685.preheader
                                        #   in Loop: Header=BB0_296 Depth=1
	bgeu	s4, s8, .LBB0_299
# %bb.298:                              #   in Loop: Header=BB0_296 Depth=1
	li	a2, 0
	li	a5, 0
	li	s1, 32
	j	.LBB0_302
.LBB0_299:                              # %vector.ph5605
                                        #   in Loop: Header=BB0_296 Depth=1
	mv	a1, s10
	mv	a2, s7
	addi	a3, sp, 288
	vl2r.v	v10, (a3)                       # Unknown-size Folded Reload
	addi	a3, sp, 256
	vl2r.v	v8, (a3)                        # Unknown-size Folded Reload
	vsetivli	zero, 8, e32, m2, ta, ma
.LBB0_300:                              # %vector.body5609
                                        #   Parent Loop BB0_296 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vle8.v	v12, (a1)
	vzext.vf4	v14, v12
	vmax.vv	v8, v8, v14
	vmin.vv	v10, v10, v14
	sub	a2, a2, s8
	add	a1, a1, s8
	bnez	a2, .LBB0_300
# %bb.301:                              # %middle.block5602
                                        #   in Loop: Header=BB0_296 Depth=1
	vredmin.vs	v10, v10, v10
	vmv.x.s	s1, v10
	vredmax.vs	v8, v8, v8
	vmv.x.s	a5, v8
	mv	a2, s7
	beq	s4, s7, .LBB0_295
.LBB0_302:                              # %scalar.ph5603
                                        #   in Loop: Header=BB0_296 Depth=1
	ld	a1, 64(sp)                      # 8-byte Folded Reload
	add	a1, a1, a7
	add	a1, a1, a0
	add	a2, a2, s10
.LBB0_303:                              # %for.body1685
                                        #   Parent Loop BB0_296 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lbu	a4, 0(a2)
	max	a5, a5, a4
	addi	a2, a2, 1
	min	s1, s1, a4
	bne	a2, a1, .LBB0_303
	j	.LBB0_295
.LBB0_304:
	sd	a3, 232(sp)                     # 8-byte Folded Spill
	li	a1, -4
	j	.LBB0_24
.LBB0_305:
	ld	a1, 144(sp)                     # 8-byte Folded Reload
	sd	a1, 64(sp)                      # 8-byte Folded Spill
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s8, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	j	.LBB0_307
.LBB0_306:
	sd	zero, 64(sp)                    # 8-byte Folded Spill
	mv	s10, s1
.LBB0_307:                              # %for.end1738
	lui	s1, 2
	addiw	s5, s1, -372
	ld	a1, 200(sp)                     # 8-byte Folded Reload
	lw	a1, 40(a1)
	sd	a1, 232(sp)                     # 8-byte Folded Spill
	lw	a1, 40(a0)
	sd	a1, 176(sp)                     # 8-byte Folded Spill
	lui	a1, 1
	addiw	s3, a1, -372
	sd	a0, 24(sp)                      # 8-byte Folded Spill
	addi	a0, a0, 68
	li	a2, 1024
	li	a1, 0
	call	memset
	lui	a0, 24
	addi	a6, a0, 1696
	sd	s5, 128(sp)                     # 8-byte Folded Spill
	sd	s3, 96(sp)                      # 8-byte Folded Spill
	beqz	zero, .LBB0_309
# %bb.308:
	li	s1, 15
	lui	a4, 1
	addiw	a4, a4, -1
	ld	a0, 24(sp)                      # 8-byte Folded Reload
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	j	.LBB0_312
.LBB0_309:                              # %vector.ph5619
	sd	a6, 72(sp)                      # 8-byte Folded Spill
	ld	s10, 144(sp)                    # 8-byte Folded Reload
	li	s4, 8
	li	a0, -1
	addi	a1, s3, 115
	sd	a1, 40(sp)                      # 8-byte Folded Spill
	vsetivli	zero, 8, e64, m4, ta, ma
	vmv.v.i	v8, 15
	vid.v	v16
	vmacc.vx	v8, a0, v16
	lui	s3, 1
	addiw	s3, s3, -1
	vmv.v.x	v12, s3
	li	a1, -16
	vmacc.vx	v12, a1, v16
	addi	t6, s5, 32
	li	a5, 128
	addiw	ra, s1, -373
	addiw	s5, s1, -374
	addiw	a3, s1, -375
	addiw	a2, s1, -376
	addiw	a4, s1, -377
	addiw	a6, s1, -378
	addiw	s7, s1, -379
	addiw	a7, s1, -380
	addiw	s11, s1, -381
	addiw	s3, s1, -382
	addiw	t0, s1, -383
	addiw	t1, s1, -384
	addiw	t2, s1, -385
	addiw	t3, s1, -386
	addiw	t4, s1, -387
	addiw	t5, s1, -388
	li	s1, 16
	ld	a0, 24(sp)                      # 8-byte Folded Reload
.LBB0_310:                              # %vector.body5626
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, zero, e32, m2, ta, ma
	vnsrl.wi	v16, v8, 0
	vsetvli	zero, zero, e16, m1, ta, ma
	vnsrl.wi	v18, v16, 0
	vsetvli	zero, zero, e8, mf2, ta, ma
	vnsrl.wi	v16, v18, 0
	vsll.vi	v16, v16, 4
	vor.vi	v17, v16, 15
	add	s0, a0, ra
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 14
	add	s0, a0, s5
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 13
	add	s0, a0, a3
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 12
	add	s0, a0, a2
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 11
	add	s0, a0, a4
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 10
	add	s0, a0, a6
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 9
	add	s0, a0, s7
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 8
	add	s0, a0, a7
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 7
	add	s0, a0, s11
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 6
	add	s0, a0, s3
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 5
	add	s0, a0, t0
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 4
	add	s0, a0, t1
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 3
	add	s0, a0, t2
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 2
	add	s0, a0, t3
	vsse8.v	v17, (s0), a1
	vor.vi	v17, v16, 1
	add	s0, a0, t4
	vsse8.v	v17, (s0), a1
	add	s0, a0, t5
	vsse8.v	v16, (s0), a1
	vsetvli	zero, zero, e32, m2, ta, ma
	vnsrl.wi	v16, v12, 0
	vadd.vi	v16, v16, -15
	add	s0, a0, t6
	vrev.v	v16, v16
	vs2r.v	v16, (s0)
	vsetvli	zero, zero, e64, m4, ta, ma
	li	s0, -8
	vadd.vx	v8, v8, s0
	li	s0, -128
	vadd.vx	v12, v12, s0
	sub	s1, s1, s4
	li	s0, 32
	sub	t6, t6, s0
	sub	ra, ra, a5
	sub	s5, s5, a5
	sub	a3, a3, a5
	sub	a2, a2, a5
	sub	a4, a4, a5
	sub	a6, a6, a5
	sub	s7, s7, a5
	sub	a7, a7, a5
	sub	s11, s11, a5
	sub	s3, s3, a5
	sub	t0, t0, a5
	sub	t1, t1, a5
	sub	t2, t2, a5
	sub	t3, t3, a5
	sub	t4, t4, a5
	sub	t5, t5, a5
	bnez	s1, .LBB0_310
# %bb.311:                              # %middle.block5616
	mv	ra, s10
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	a6, 72(sp)                      # 8-byte Folded Reload
	li	s1, -1
	ld	a4, 40(sp)                      # 8-byte Folded Reload
	li	a1, 16
	beq	a1, a1, .LBB0_314
.LBB0_312:                              # %scalar.ph5617
	slli	a1, s1, 2
	ld	a2, 128(sp)                     # 8-byte Folded Reload
	add	a1, a1, a2
	add	a1, a1, a0
	slli	s1, s1, 4
	addi	a3, a4, -15
	ld	a5, 96(sp)                      # 8-byte Folded Reload
	add	a5, a5, a4
	add	a4, a0, a5
	sub	a2, s1, a0
	sub	a5, a5, a2
	addi	a5, a5, -16
.LBB0_313:                              # %for.cond1756.preheader
                                        # =>This Inner Loop Header: Depth=1
	ori	a2, s1, 15
	sb	a2, 0(a4)
	ori	a2, s1, 14
	sb	a2, -1(a4)
	ori	a2, s1, 13
	sb	a2, -2(a4)
	ori	a2, s1, 12
	sb	a2, -3(a4)
	ori	a2, s1, 11
	sb	a2, -4(a4)
	ori	a2, s1, 10
	sb	a2, -5(a4)
	ori	a2, s1, 9
	sb	a2, -6(a4)
	ori	a2, s1, 8
	sb	a2, -7(a4)
	ori	a2, s1, 7
	sb	a2, -8(a4)
	ori	a2, s1, 6
	sb	a2, -9(a4)
	ori	a2, s1, 5
	sb	a2, -10(a4)
	ori	a2, s1, 4
	sb	a2, -11(a4)
	ori	a2, s1, 3
	sb	a2, -12(a4)
	ori	a2, s1, 2
	sb	a2, -13(a4)
	ori	a2, s1, 1
	sb	a2, -14(a4)
	sb	s1, -15(a4)
	sw	a3, 0(a1)
	addi	a1, a1, -4
	addi	s1, s1, -16
	addi	a4, a4, -16
	addi	a3, a3, -16
	bne	a4, a5, .LBB0_313
.LBB0_314:                              # %if.then1777
	ld	a1, 176(sp)                     # 8-byte Folded Reload
	mulw	t5, a1, a6
	ld	a5, 232(sp)                     # 8-byte Folded Reload
	addiw	a5, a5, 1
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	blez	s6, .LBB0_322
# %bb.315:                              # %if.end1802
	ld	a1, 192(sp)                     # 8-byte Folded Reload
	lbu	a7, 65(a1)
	li	s5, 0
	li	t2, 0
	li	a1, 1032
	mul	a1, a7, a1
	add	a1, a1, a0
	lui	a2, 13
	addiw	a2, a2, -1620
	add	a2, a2, a1
	sd	a2, 208(sp)                     # 8-byte Folded Spill
	lui	a2, 14
	addiw	a2, a2, 476
	add	s4, a1, a2
	lui	a2, 11
	slli	a3, a7, 2
	lui	a4, 16
	add	a4, a4, a0
	add	a3, a3, a4
	lw	s3, -1524(a3)
	addiw	a2, a2, 380
	add	s7, a1, a2
	li	a1, 256
	sd	a1, 232(sp)                     # 8-byte Folded Spill
	li	t1, 49
	mv	s2, s3
	mv	t0, s6
	mv	s6, a5
	mv	s1, s8
.LBB0_316:                              # %sw.bb1804
	lw	a1, 36(a0)
	li	a2, 36
	sw	a2, 8(a0)
	blt	a1, s2, .LBB0_319
.LBB0_317:                              # %if.then1811
	lw	a3, 32(a0)
	subw	a2, a1, s2
	srlw	a1, a3, a2
	li	a3, -1
	sllw	a3, a3, s2
	andn	t6, a1, a3
	sw	a2, 36(a0)
	j	.LBB0_325
.LBB0_318:                              # %if.end1855
                                        #   in Loop: Header=BB0_319 Depth=1
	lw	a1, 36(a0)
	bge	a1, s2, .LBB0_317
.LBB0_319:                              # %if.end1822
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_320
	j	.LBB0_23
.LBB0_320:                              # %if.end1828
                                        #   in Loop: Header=BB0_319 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_318
# %bb.321:                              # %if.then1851
                                        #   in Loop: Header=BB0_319 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_318
.LBB0_322:
	li	s5, 0
	li	t1, 0
	li	t2, 0
	li	a1, -4
	li	a0, 256
	sd	a0, 232(sp)                     # 8-byte Folded Spill
	mv	t0, s6
	mv	s6, a5
	mv	s1, s8
	j	.LBB0_24
.LBB0_323:                              # %sw.bb1870
	li	a1, 37
	sw	a1, 8(a0)
	blez	a2, .LBB0_329
.LBB0_324:                              # %if.then1877
	lw	a1, 32(a0)
	addiw	a2, a2, -1
	srlw	a1, a1, a2
	andi	a3, a1, 1
	sw	a2, 36(a0)
	slliw	a1, t6, 1
	sd	a3, 224(sp)                     # 8-byte Folded Spill
	or	t6, a3, a1
.LBB0_325:                              # %while.cond1857
	li	a3, 20
	li	a1, -4
	bge	a3, s2, .LBB0_326
	j	.LBB0_24
.LBB0_326:                              # %if.end1862
	slli	a3, s2, 2
	add	a4, s7, a3
	lw	a4, 0(a4)
	bge	a4, t6, .LBB0_367
# %bb.327:                              # %if.end1868
	addiw	s2, s2, 1
	j	.LBB0_323
.LBB0_328:                              # %if.end1919
                                        #   in Loop: Header=BB0_329 Depth=1
	lw	a2, 36(a0)
	bgtz	a2, .LBB0_324
.LBB0_329:                              # %if.end1886
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	bnez	a3, .LBB0_330
	j	.LBB0_23
.LBB0_330:                              # %if.end1892
                                        #   in Loop: Header=BB0_329 Depth=1
	ld	a3, 0(a1)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a1)
	addi	a2, a2, 1
	sd	a2, 0(a1)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_328
# %bb.331:                              # %if.then1915
                                        #   in Loop: Header=BB0_329 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_328
.LBB0_332:                              # %sw.bb2063
	li	a1, 39
	sw	a1, 8(a0)
	blez	a2, .LBB0_335
.LBB0_333:                              # %if.then2070
	lw	a1, 32(a0)
	addiw	a2, a2, -1
	srlw	a1, a1, a2
	andi	a3, a1, 1
	sw	a2, 36(a0)
	slliw	a1, t6, 1
	sd	a3, 224(sp)                     # 8-byte Folded Spill
	or	t6, a3, a1
	j	.LBB0_471
.LBB0_334:                              # %if.end2112
                                        #   in Loop: Header=BB0_335 Depth=1
	lw	a2, 36(a0)
	bgtz	a2, .LBB0_333
.LBB0_335:                              # %if.end2079
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	bnez	a3, .LBB0_336
	j	.LBB0_23
.LBB0_336:                              # %if.end2085
                                        #   in Loop: Header=BB0_335 Depth=1
	ld	a3, 0(a1)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a1)
	addi	a2, a2, 1
	sd	a2, 0(a1)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_334
# %bb.337:                              # %if.then2108
                                        #   in Loop: Header=BB0_335 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_334
.LBB0_338:                              # %sw.bb2479
	li	a1, 41
	sw	a1, 8(a0)
	blez	a2, .LBB0_341
.LBB0_339:                              # %if.then2486
	lw	a1, 32(a0)
	addiw	a2, a2, -1
	srlw	a1, a1, a2
	andi	a3, a1, 1
	sw	a2, 36(a0)
	slliw	a1, t6, 1
	sd	a3, 224(sp)                     # 8-byte Folded Spill
	or	t6, a3, a1
	j	.LBB0_439
.LBB0_340:                              # %if.end2528
                                        #   in Loop: Header=BB0_341 Depth=1
	lw	a2, 36(a0)
	bgtz	a2, .LBB0_339
.LBB0_341:                              # %if.end2495
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 0(a0)
	lw	a3, 8(a1)
	bnez	a3, .LBB0_342
	j	.LBB0_23
.LBB0_342:                              # %if.end2501
                                        #   in Loop: Header=BB0_341 Depth=1
	ld	a3, 0(a1)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a1)
	addi	a2, a2, 1
	sd	a2, 0(a1)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_340
# %bb.343:                              # %if.then2524
                                        #   in Loop: Header=BB0_341 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_340
.LBB0_344:                              # %for.inc1245
	ld	a2, 232(sp)                     # 8-byte Folded Reload
	addiw	a2, a2, 1
.LBB0_345:                              # %for.cond1166
	li	a1, 15
	sd	a2, 232(sp)                     # 8-byte Folded Spill
	blt	a1, a2, .LBB0_348
# %bb.346:                              # %for.body1169
	add	a1, a0, a2
	addi	a1, a1, 2047
	lbu	a1, 1405(a1)
	beqz	a1, .LBB0_344
# %bb.347:
	li	t3, 0
	j	.LBB0_358
.LBB0_348:                              # %for.end1247
	mv	s8, s1
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s10, 120(sp)                    # 8-byte Folded Spill
	mv	s10, s3
	mv	s3, s6
	sd	t0, 128(sp)                     # 8-byte Folded Spill
	sd	a7, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	sd	t1, 96(sp)                      # 8-byte Folded Spill
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sd	ra, 144(sp)                     # 8-byte Folded Spill
	mv	s4, t2
	sd	t5, 104(sp)                     # 8-byte Folded Spill
	sd	t4, 64(sp)                      # 8-byte Folded Spill
	sd	t3, 88(sp)                      # 8-byte Folded Spill
	sd	t6, 80(sp)                      # 8-byte Folded Spill
	mv	s0, a6
	mv	s1, a0
	call	makeMaps_d
	ld	a0, 200(sp)                     # 8-byte Folded Reload
	lw	a0, 40(a0)
	beqz	a0, .LBB0_357
# %bb.349:                              # %if.end1251
	addiw	a6, a0, 2
	mv	a0, s1
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	mv	t2, s4
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	mv	s6, s3
	mv	s3, s10
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	mv	s1, s8
.LBB0_350:                              # %sw.bb1254
	lw	a2, 36(a0)
	li	a3, 30
	li	a1, 2
	sw	a3, 8(a0)
	bge	a1, a2, .LBB0_354
.LBB0_351:                              # %if.then1261
	lw	a1, 32(a0)
	addiw	a2, a2, -3
	srlw	a1, a1, a2
	andi	ra, a1, 7
	li	a1, 7
	sw	a2, 36(a0)
	bgeu	a1, ra, .LBB0_352
	j	.LBB0_62
.LBB0_352:                              # %if.then1261
	li	a1, 131
	srl	a1, a1, ra
	andi	a3, a1, 1
	li	a1, -4
	beqz	a3, .LBB0_544
	j	.LBB0_24
.LBB0_544:                              # %if.then1261
	j	.LBB0_62
.LBB0_353:                              # %if.end1303
                                        #   in Loop: Header=BB0_354 Depth=1
	lw	a2, 36(a0)
	blt	a1, a2, .LBB0_351
.LBB0_354:                              # %if.end1270
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(a0)
	lw	a4, 8(a3)
	bnez	a4, .LBB0_355
	j	.LBB0_23
.LBB0_355:                              # %if.end1276
                                        #   in Loop: Header=BB0_354 Depth=1
	ld	a4, 0(a3)
	lw	a5, 32(a0)
	lbu	a4, 0(a4)
	slli	a5, a5, 8
	or	a4, a4, a5
	sw	a4, 32(a0)
	addi	a2, a2, 8
	sw	a2, 36(a0)
	ld	a2, 0(a3)
	addi	a2, a2, 1
	sd	a2, 0(a3)
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	addi	a3, a3, -1
	sw	a3, 8(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	addi	a3, a3, 1
	sw	a3, 12(a2)
	ld	a2, 0(a0)
	lw	a3, 12(a2)
	bnez	a3, .LBB0_353
# %bb.356:                              # %if.then1299
                                        #   in Loop: Header=BB0_354 Depth=1
	lw	a3, 16(a2)
	addi	a3, a3, 1
	sw	a3, 16(a2)
	j	.LBB0_353
.LBB0_357:
	li	a1, -4
	mv	a6, s0
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	mv	t2, s4
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	mv	s6, s3
	mv	s3, s10
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	mv	s1, s8
	j	.LBB0_24
.LBB0_358:                              # %for.cond1175
	li	a1, 15
	blt	a1, t3, .LBB0_344
.LBB0_359:                              # %sw.bb1179
	lw	a1, 36(a0)
	li	a2, 29
	sw	a2, 8(a0)
	blez	a1, .LBB0_364
.LBB0_360:                              # %if.then1186
	lw	a2, 32(a0)
	addi	a1, a1, -1
	srlw	a2, a2, a1
	andi	a2, a2, 1
	sw	a1, 36(a0)
	beqz	a2, .LBB0_362
# %bb.361:                              # %if.then1234
	ld	a1, 232(sp)                     # 8-byte Folded Reload
	slli	a1, a1, 4
	addw	a1, a1, t3
	add	a1, a1, a0
	addi	a1, a1, 2047
	li	a2, 1
	sb	a2, 1149(a1)
.LBB0_362:                              # %for.inc1241
	addiw	t3, t3, 1
	j	.LBB0_358
.LBB0_363:                              # %if.end1229
                                        #   in Loop: Header=BB0_364 Depth=1
	lw	a1, 36(a0)
	bgtz	a1, .LBB0_360
.LBB0_364:                              # %if.end1196
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_365
	j	.LBB0_23
.LBB0_365:                              # %if.end1202
                                        #   in Loop: Header=BB0_364 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_363
# %bb.366:                              # %if.then1225
                                        #   in Loop: Header=BB0_364 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_363
.LBB0_367:                              # %while.end1923
	ld	a2, 208(sp)                     # 8-byte Folded Reload
	add	a3, a3, a2
	lw	a2, 0(a3)
	subw	a2, t6, a2
	li	a3, 257
	bgeu	a3, a2, .LBB0_368
	j	.LBB0_24
.LBB0_368:                              # %if.end1936
	slli	a2, a2, 2
	add	a2, a2, s4
	lw	a3, 0(a2)
	beq	a3, s6, .LBB0_493
.LBB0_369:                              # %if.end1947
	li	a1, 1
	li	a2, -1
	bgeu	a1, a3, .LBB0_463
# %bb.370:                              # %if.else2186
	sext.w	a4, s5
	li	a1, -4
	sd	a3, 216(sp)                     # 8-byte Folded Spill
	blt	a4, t5, .LBB0_371
	j	.LBB0_24
.LBB0_371:                              # %if.end2190
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	t0, 128(sp)                     # 8-byte Folded Spill
	mv	t0, a7
	li	a2, 16
	addiw	s1, a3, -1
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	a4, 176(sp)                     # 8-byte Folded Spill
	bltu	a2, a3, .LBB0_407
# %bb.372:                              # %if.then2197
	sd	ra, 144(sp)                     # 8-byte Folded Spill
	ld	s7, 192(sp)                     # 8-byte Folded Reload
	lw	ra, 1(s7)
	ld	a2, 184(sp)                     # 8-byte Folded Reload
	addi	a7, a2, 1677
	add	a2, ra, s1
	slli	a2, a2, 32
	srli	a2, a2, 32
	add	a2, a2, a7
	lbu	a2, 0(a2)
	sd	a2, 120(sp)                     # 8-byte Folded Spill
	li	a2, 4
	sd	t2, 32(sp)                      # 8-byte Folded Spill
	sd	t1, 96(sp)                      # 8-byte Folded Spill
	bltu	s1, a2, .LBB0_424
# %bb.373:                              # %while.body2207.preheader
	mv	s6, s10
	addi	a2, a3, -5
	srliw	s10, a2, 2
	addi	a5, s10, 1
	li	s0, 112
	bltu	a5, s0, .LBB0_420
# %bb.374:                              # %vector.scevcheck5642
	add	t1, a3, ra
	addiw	t2, t1, -1
	andi	a2, a2, -4
	subw	s0, t2, a2
	blt	t2, s0, .LBB0_420
# %bb.375:                              # %vector.scevcheck5642
	sd	t5, 104(sp)                     # 8-byte Folded Spill
	bnez	zero, .LBB0_419
# %bb.376:                              # %vector.scevcheck5642
	addiw	t5, t1, -2
	subw	s0, t5, a2
	blt	t5, s0, .LBB0_419
# %bb.377:                              # %vector.scevcheck5642
	sd	t4, 64(sp)                      # 8-byte Folded Spill
	bnez	zero, .LBB0_418
# %bb.378:                              # %vector.scevcheck5642
	addiw	t4, t1, -3
	subw	s0, t4, a2
	blt	t4, s0, .LBB0_418
# %bb.379:                              # %vector.scevcheck5642
	sd	t3, 88(sp)                      # 8-byte Folded Spill
	bnez	zero, .LBB0_417
# %bb.380:                              # %vector.scevcheck5642
	addiw	t3, t1, -4
	subw	s0, t3, a2
	blt	t3, s0, .LBB0_417
# %bb.381:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.382:                              # %vector.scevcheck5642
	addiw	t1, t1, -5
	subw	a2, t1, a2
	blt	t1, a2, .LBB0_417
# %bb.383:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.384:                              # %vector.scevcheck5642
	lui	a2, 1
	addiw	a3, a2, -372
	add	s0, t1, a0
	add	a2, s0, a3
	slli	s10, s10, 2
	sub	s0, a2, s10
	bltu	a2, s0, .LBB0_417
# %bb.385:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.386:                              # %vector.scevcheck5642
	add	a2, t3, a0
	add	a2, a2, a3
	sub	s0, a2, s10
	bltu	a2, s0, .LBB0_417
# %bb.387:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.388:                              # %vector.scevcheck5642
	add	a2, t4, a0
	add	a2, a2, a3
	sub	s0, a2, s10
	bltu	a2, s0, .LBB0_417
# %bb.389:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.390:                              # %vector.scevcheck5642
	add	a2, t5, a0
	add	a2, a2, a3
	sub	s0, a2, s10
	bltu	a2, s0, .LBB0_417
# %bb.391:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.392:                              # %vector.scevcheck5642
	add	a2, t2, a0
	add	a2, a2, a3
	sub	s0, a2, s10
	bltu	a2, s0, .LBB0_417
# %bb.393:                              # %vector.scevcheck5642
	bnez	zero, .LBB0_417
# %bb.394:                              # %vector.memcheck5678
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	t6, 80(sp)                      # 8-byte Folded Spill
	sd	a6, 56(sp)                      # 8-byte Folded Spill
	mv	a6, s6
	add	s5, t2, a3
	sub	a2, a0, s10
	add	s5, s5, a2
	addi	s8, a3, 1
	add	s6, a0, s8
	add	s6, s6, t2
	add	t2, t5, a3
	sub	a2, a0, s10
	add	t2, t2, a2
	add	t6, a0, s8
	add	t6, t6, t5
	sltu	a2, s5, t6
	sltu	s0, t2, s6
	and	a2, a2, s0
	bnez	a2, .LBB0_462
# %bb.395:                              # %vector.memcheck5678
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	add	t5, t4, a3
	sub	a2, a0, s10
	add	t5, t5, a2
	add	t4, t4, s8
	add	t4, t4, a0
	sltu	a2, s5, t4
	sltu	s0, t5, s6
	and	a2, a2, s0
	bnez	a2, .LBB0_461
# %bb.396:                              # %vector.memcheck5678
	add	s4, t3, a3
	sub	a2, a0, s10
	add	s4, s4, a2
	add	t3, t3, s8
	add	t3, t3, a0
	sltu	a2, s5, t3
	sltu	s0, s4, s6
	and	a2, a2, s0
	bnez	a2, .LBB0_461
# %bb.397:                              # %vector.memcheck5678
	add	a2, t1, a3
	sub	a3, a0, s10
	add	a2, a2, a3
	add	a3, t1, s8
	add	a3, a3, a0
	sltu	t1, s5, a3
	sltu	s0, a2, s6
	and	s0, t1, s0
	bnez	s0, .LBB0_461
# %bb.398:                              # %vector.memcheck5678
	sltu	t1, t2, t4
	sltu	s0, t5, t6
	and	s0, t1, s0
	mv	s10, a6
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	bnez	s0, .LBB0_459
# %bb.399:                              # %vector.memcheck5678
	sltu	t1, t2, t3
	sltu	s0, s4, t6
	and	s0, t1, s0
	bnez	s0, .LBB0_459
# %bb.400:                              # %vector.memcheck5678
	sltu	t1, t2, a3
	sltu	s0, a2, t6
	and	s0, t1, s0
	bnez	s0, .LBB0_459
# %bb.401:                              # %vector.memcheck5678
	sltu	t1, t5, t3
	sltu	s0, s4, t4
	and	s0, t1, s0
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	bnez	s0, .LBB0_460
# %bb.402:                              # %vector.memcheck5678
	sltu	t1, t5, a3
	sltu	s0, a2, t4
	and	s0, t1, s0
	bnez	s0, .LBB0_460
# %bb.403:                              # %vector.memcheck5678
	sltu	a3, s4, a3
	sltu	a2, a2, t3
	and	a2, a2, a3
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	bnez	a2, .LBB0_421
# %bb.404:                              # %vector.ph5727
	mv	a4, a5
	li	a3, 16
	andi	t2, a5, -16
	slli	a2, t2, 2
	sub	t1, s1, a2
	vsetivli	zero, 16, e64, m8, ta, ma
	vmv.v.x	v16, s1
	vid.v	v8
	li	s0, -4
	vmadd.vx	v8, s0, v16
	li	a2, -64
	vsetvli	zero, zero, e32, m4, ta, ma
	vmv.v.x	v20, s1
	vid.v	v16
	vmadd.vx	v16, s0, v20
	mv	s1, t2
.LBB0_405:                              # %vector.body5732
                                        # =>This Inner Loop Header: Depth=1
	addi	a5, sp, 288
	vs8r.v	v8, (a5)                        # Unknown-size Folded Spill
	vadd.vx	v20, v16, ra
	vadd.vi	v24, v20, -1
	vsetvli	zero, zero, e64, m8, ta, ma
	vsext.vf2	v0, v24
	vsetvli	zero, zero, e8, m1, ta, ma
	vluxei64.v	v24, (a7), v0
	vsetvli	zero, zero, e64, m8, ta, ma
	vsext.vf2	v8, v20
	vsetvli	zero, zero, e8, m1, ta, ma
	vsoxei64.v	v24, (a7), v8
	vsetvli	zero, zero, e32, m4, ta, ma
	vadd.vi	v8, v20, -2
	vsetvli	zero, zero, e64, m8, ta, ma
	vsext.vf2	v24, v8
	vsetvli	zero, zero, e8, m1, ta, ma
	vluxei64.v	v8, (a7), v24
	vsoxei64.v	v8, (a7), v0
	vsetvli	zero, zero, e32, m4, ta, ma
	vadd.vi	v8, v20, -3
	vsetvli	zero, zero, e64, m8, ta, ma
	vsext.vf2	v0, v8
	vsetvli	zero, zero, e8, m1, ta, ma
	vluxei64.v	v8, (a7), v0
	vsoxei64.v	v8, (a7), v24
	vsetvli	zero, zero, e32, m4, ta, ma
	vadd.vi	v8, v20, -4
	vsetvli	zero, zero, e64, m8, ta, ma
	vsext.vf2	v24, v8
	vsetvli	zero, zero, e8, m1, ta, ma
	vluxei64.v	v8, (a7), v24
	vsoxei64.v	v8, (a7), v0
	vl8r.v	v24, (a5)                       # Unknown-size Folded Reload
	vsetvli	zero, zero, e64, m8, ta, ma
	vadd.vx	v8, v24, a2
	sub	s1, s1, a3
	vsetvli	zero, zero, e32, m4, ta, ma
	vadd.vx	v16, v16, a2
	bnez	s1, .LBB0_405
# %bb.406:                              # %middle.block5724
	vnsrl.wi	v8, v24, 0
	vadd.vi	v8, v8, -4
	vsetivli	zero, 1, e32, m1, ta, ma
	vslidedown.vi	v8, v11, 3
	vmv.x.s	a2, v8
	mv	s1, t1
	bne	a4, t2, .LBB0_421
	j	.LBB0_423
.LBB0_407:                              # %if.else2260
	mv	s6, t1
	srliw	a3, s1, 4
	ld	s7, 192(sp)                     # 8-byte Folded Reload
	addi	a7, s7, 1
	slli	t1, a3, 2
	add	a2, a7, t1
	lw	a5, 0(a2)
	andi	s1, s1, 15
	addw	s0, a5, s1
	ld	a4, 184(sp)                     # 8-byte Folded Reload
	addi	a4, a4, 1677
	add	s0, s0, a4
	lbu	s8, 0(s0)
	beqz	s1, .LBB0_410
# %bb.408:                              # %while.body2274.preheader
	ld	s1, 216(sp)                     # 8-byte Folded Reload
	addi	s1, s1, -1
	andi	s0, s1, 15
	add	s0, s0, a5
	add	a5, s0, a0
	addi	a5, a5, 2047
	addi	s1, a5, 1677
.LBB0_409:                              # %while.body2274
                                        # =>This Inner Loop Header: Depth=1
	lbu	a5, -1(s1)
	sb	a5, 0(s1)
	lw	a5, 0(a2)
	addi	s0, s0, -1
	addi	s1, s1, -1
	blt	a5, s0, .LBB0_409
.LBB0_410:                              # %while.body2291.preheader
	addi	a5, a5, 1
	sw	a5, 0(a2)
	add	a2, t1, a0
	lui	a5, 2
	addiw	a5, a5, -372
	add	a2, a2, a5
	li	s1, 1
	min	s1, a3, s1
	slli	s1, s1, 2
	add	a5, a5, a0
	add	a5, a5, s1
	addi	a5, a5, -4
.LBB0_411:                              # %while.body2291
                                        # =>This Inner Loop Header: Depth=1
	lw	s1, 0(a2)
	lw	s0, -4(a2)
	addiw	s1, s1, -1
	sw	s1, 0(a2)
	addiw	s0, s0, 15
	add	s0, s0, a4
	lbu	s0, 0(s0)
	addi	a3, a2, -4
	add	s1, s1, a4
	sb	s0, 0(s1)
	mv	a2, a3
	bne	a3, a5, .LBB0_411
# %bb.412:                              # %while.end2312
	lw	a2, 0(a7)
	addiw	a2, a2, -1
	sw	a2, 0(a7)
	add	a2, a2, a4
	sb	s8, 0(a2)
	lw	a2, 0(a7)
	mv	t1, s6
	beqz	a2, .LBB0_414
# %bb.413:
	mv	a3, s8
	j	.LBB0_429
.LBB0_414:                              # %for.cond2330.preheader.preheader
	addi	a5, s7, 61
	lui	a2, 2
	addiw	s1, a2, -376
	add	s1, s1, a0
	lui	a2, 1
	addi	a2, a2, -16
	mv	a3, s7
	mv	a7, t0
	ld	s6, 112(sp)                     # 8-byte Folded Reload
.LBB0_415:                              # %for.cond2330.preheader
                                        # =>This Inner Loop Header: Depth=1
	lw	s0, 0(a5)
	addiw	s0, s0, 15
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, 0(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 14
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -1(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 13
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -2(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 12
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -3(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 11
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -4(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 10
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -5(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 9
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -6(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 8
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -7(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 7
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -8(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 6
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -9(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 5
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -10(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 4
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -11(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 3
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -12(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 2
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -13(a3)
	lw	s0, 0(a5)
	addiw	s0, s0, 1
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -14(a3)
	lw	s0, 0(a5)
	add	s0, s0, a4
	lbu	s0, 0(s0)
	sb	s0, -15(a3)
	sw	a2, 0(a5)
	addi	a5, a5, -4
	addi	a2, a2, -16
	addi	a3, a3, -16
	bne	a5, s1, .LBB0_415
# %bb.416:
	mv	a3, s8
	j	.LBB0_430
.LBB0_417:
	ld	t3, 88(sp)                      # 8-byte Folded Reload
.LBB0_418:
	ld	t4, 64(sp)                      # 8-byte Folded Reload
.LBB0_419:
	ld	t5, 104(sp)                     # 8-byte Folded Reload
.LBB0_420:                              # %scalar.ph5725
	mv	s10, s6
.LBB0_421:                              # %scalar.ph5725
	li	a3, 3
	mv	a2, s1
	vsetivli	zero, 2, e8, mf8, ta, ma
.LBB0_422:                              # %while.body2207
                                        # =>This Inner Loop Header: Depth=1
	addw	s1, ra, a2
	addiw	a4, s1, -1
	add	a4, a4, a7
	lbu	s0, 0(a4)
	add	a5, a7, s1
	sb	s0, 0(a5)
	addiw	a5, s1, -2
	add	a5, a5, a7
	lbu	a5, 0(a5)
	sb	a5, 0(a4)
	addiw	a4, s1, -4
	add	a4, a4, a7
	vle8.v	v8, (a4)
	addiw	s1, s1, -3
	add	s1, s1, a7
	addiw	a2, a2, -4
	vse8.v	v8, (s1)
	bltu	a3, a2, .LBB0_422
.LBB0_423:                              # %while.cond2242.preheader
	mv	s1, a2
	beqz	a2, .LBB0_428
.LBB0_424:                              # %while.body2245.preheader
	addi	s0, s1, -1
	slli	a2, s0, 32
	srli	a2, a2, 32
	addi	a5, a2, 1
	li	a3, 96
	bgeu	a5, a3, .LBB0_446
.LBB0_425:
	mv	t2, s1
.LBB0_426:                              # %scalar.ph5771
	add	t2, t2, ra
.LBB0_427:                              # %while.body2245
                                        # =>This Inner Loop Header: Depth=1
	slli	a2, t2, 32
	addi	t2, t2, -1
	slli	a3, t2, 32
	srli	a3, a3, 32
	add	a3, a3, a7
	lbu	a3, 0(a3)
	srli	a2, a2, 32
	add	a2, a2, a7
	addiw	s1, s1, -1
	sb	a3, 0(a2)
	bnez	s1, .LBB0_427
.LBB0_428:                              # %while.end2256
	add	a7, a7, ra
	ld	a3, 120(sp)                     # 8-byte Folded Reload
	sb	a3, 0(a7)
	ld	t2, 32(sp)                      # 8-byte Folded Reload
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
.LBB0_429:                              # %if.end2356
	mv	a7, t0
	ld	s6, 112(sp)                     # 8-byte Folded Reload
.LBB0_430:                              # %if.end2356
	sd	s7, 192(sp)                     # 8-byte Folded Spill
	add	t0, a0, a3
	addi	a2, t0, 2047
	lbu	a2, 1421(a2)
	slli	a3, a2, 2
	add	a3, a3, a0
	lw	a4, 68(a3)
	lbu	a5, 44(a0)
	addi	a4, a4, 1
	sw	a4, 68(a3)
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	beqz	a5, .LBB0_432
# %bb.431:                              # %if.then2366
	ld	a3, 200(sp)                     # 8-byte Folded Reload
	ld	a3, 8(a3)
	ld	a4, 176(sp)                     # 8-byte Folded Reload
	slli	a4, a4, 1
	add	a3, a3, a4
	sh	a2, 0(a3)
	j	.LBB0_433
.LBB0_432:                              # %if.else2374
	ld	a3, 200(sp)                     # 8-byte Folded Reload
	ld	a3, 0(a3)
	ld	a4, 176(sp)                     # 8-byte Folded Reload
	slli	a4, a4, 2
	add	a3, a3, a4
	sw	a2, 0(a3)
.LBB0_433:                              # %if.end2382
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	addi	s5, s5, 1
	bnez	t1, .LBB0_436
# %bb.434:                              # %if.then2386
	addiw	t2, t2, 1
	bge	t2, t0, .LBB0_458
# %bb.435:                              # %if.end2391
	add	a1, a0, t2
	lui	a2, 2
	add	a1, a1, a2
	lbu	a7, -308(a1)
	slli	a1, a7, 2
	lui	a2, 16
	add	a2, a2, a0
	add	a1, a1, a2
	lw	s3, -1524(a1)
	li	a1, 1032
	mul	a1, a7, a1
	add	a1, a1, a0
	lui	a2, 11
	addiw	a2, a2, 380
	add	s7, a1, a2
	lui	a2, 14
	addiw	a2, a2, 476
	add	s4, a1, a2
	lui	a2, 13
	addiw	a2, a2, -1620
	add	a1, a1, a2
	sd	a1, 208(sp)                     # 8-byte Folded Spill
	li	t1, 50
.LBB0_436:                              # %if.end2411
	addiw	t1, t1, -1
	mv	s2, s3
.LBB0_437:                              # %sw.bb2413
	lw	a1, 36(a0)
	li	a2, 40
	sw	a2, 8(a0)
	blt	a1, s2, .LBB0_443
.LBB0_438:                              # %if.then2420
	lw	a3, 32(a0)
	subw	a2, a1, s2
	srlw	a1, a3, a2
	li	a3, -1
	sllw	a3, a3, s2
	andn	t6, a1, a3
	sw	a2, 36(a0)
.LBB0_439:                              # %while.cond2466
	li	a3, 20
	li	a1, -4
	bge	a3, s2, .LBB0_440
	j	.LBB0_24
.LBB0_440:                              # %if.end2471
	slli	a3, s2, 2
	add	a4, s7, a3
	lw	a4, 0(a4)
	bge	a4, t6, .LBB0_367
# %bb.441:                              # %if.end2477
	addiw	s2, s2, 1
	j	.LBB0_338
.LBB0_442:                              # %if.end2464
                                        #   in Loop: Header=BB0_443 Depth=1
	lw	a1, 36(a0)
	bge	a1, s2, .LBB0_438
.LBB0_443:                              # %if.end2431
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_444
	j	.LBB0_23
.LBB0_444:                              # %if.end2437
                                        #   in Loop: Header=BB0_443 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_442
# %bb.445:                              # %if.then2460
                                        #   in Loop: Header=BB0_443 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_442
.LBB0_446:                              # %vector.scevcheck5753
	addw	a4, s1, ra
	subw	a3, a4, s0
	bltu	a4, a3, .LBB0_425
# %bb.447:                              # %vector.scevcheck5753
	bnez	zero, .LBB0_425
# %bb.448:                              # %vector.scevcheck5753
	addiw	t1, a4, -1
	subw	a3, t1, s0
	bltu	t1, a3, .LBB0_425
# %bb.449:                              # %vector.scevcheck5753
	bnez	zero, .LBB0_425
# %bb.450:                              # %vector.scevcheck5753
	slli	a3, a4, 32
	srli	t2, a3, 32
	lui	s0, 1
	addiw	a3, s0, -372
	add	s0, a0, a3
	add	t2, t2, s0
	sub	s0, t2, a2
	bltu	t2, s0, .LBB0_425
# %bb.451:                              # %vector.scevcheck5753
	bnez	zero, .LBB0_425
# %bb.452:                              # %vector.scevcheck5753
	slli	t1, t1, 32
	srli	s0, t1, 32
	add	a3, a3, a0
	add	a3, a3, s0
	sub	a2, a3, a2
	bltu	a3, a2, .LBB0_425
# %bb.453:                              # %vector.scevcheck5753
	bnez	zero, .LBB0_425
# %bb.454:                              # %vector.memcheck5768
	add	a2, s1, ra
	addi	a3, a2, -1
	slli	a3, a3, 32
	srli	a3, a3, 32
	slli	a2, a2, 32
	srli	a2, a2, 32
	sub	a3, a3, a2
	li	a2, 32
	bltu	a3, a2, .LBB0_425
# %bb.455:                              # %vector.ph5773
	andi	t1, a5, -32
	sub	t2, s1, t1
	subw	s1, s1, t1
	mv	s0, t1
	vsetvli	a3, zero, e8, m2, ta, ma
.LBB0_456:                              # %vector.body5781
                                        # =>This Inner Loop Header: Depth=1
	addi	a3, a4, -1
	slli	a3, a3, 32
	srli	a3, a3, 32
	add	a3, a3, a7
	addi	a3, a3, -31
	vl2r.v	v8, (a3)
	vrev.v	v8, v8
	slli	a3, a4, 32
	srli	a3, a3, 32
	add	a3, a3, a7
	addi	a3, a3, -31
	vrev.v	v8, v8
	vs2r.v	v8, (a3)
	sub	s0, s0, a2
	subw	a4, a4, a2
	bnez	s0, .LBB0_456
# %bb.457:                              # %middle.block5770
	bne	a5, t1, .LBB0_426
	j	.LBB0_428
.LBB0_458:
	li	t1, 0
	j	.LBB0_24
.LBB0_459:
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	ld	t6, 80(sp)                      # 8-byte Folded Reload
.LBB0_460:
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	j	.LBB0_421
.LBB0_461:
	mv	s10, a6
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	j	.LBB0_421
.LBB0_462:
	mv	s10, a6
	ld	a6, 56(sp)                      # 8-byte Folded Reload
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	j	.LBB0_421
.LBB0_463:                              # %do.body
	slli	s0, a1, 1
	sd	a3, 216(sp)                     # 8-byte Folded Spill
	beqz	a3, .LBB0_465
# %bb.464:                              # %do.body
	mv	a1, s0
.LBB0_465:                              # %do.body
	addw	s11, a1, a2
	bnez	t1, .LBB0_468
# %bb.466:                              # %if.then1970
	addiw	t2, t2, 1
	bge	t2, t0, .LBB0_523
# %bb.467:                              # %if.end1975
	add	a1, a0, t2
	lui	a2, 2
	add	a1, a1, a2
	lbu	a7, -308(a1)
	slli	a1, a7, 2
	lui	a2, 16
	add	a2, a2, a0
	add	a1, a1, a2
	lw	s3, -1524(a1)
	li	a1, 1032
	mul	a1, a7, a1
	add	a1, a1, a0
	lui	a2, 11
	addiw	a2, a2, 380
	add	s7, a1, a2
	lui	a2, 14
	addiw	a2, a2, 476
	add	s4, a1, a2
	lui	a2, 13
	addiw	a2, a2, -1620
	add	a1, a1, a2
	sd	a1, 208(sp)                     # 8-byte Folded Spill
	li	t1, 50
.LBB0_468:                              # %if.end1995
	addiw	t1, t1, -1
	mv	s2, s3
.LBB0_469:                              # %sw.bb1997
	lw	a1, 36(a0)
	li	a2, 38
	sw	a2, 8(a0)
	blt	a1, s2, .LBB0_475
.LBB0_470:                              # %if.then2004
	lw	a3, 32(a0)
	subw	a2, a1, s2
	srlw	a1, a3, a2
	li	a3, -1
	sllw	a3, a3, s2
	andn	t6, a1, a3
	sw	a2, 36(a0)
.LBB0_471:                              # %while.cond2050
	li	a3, 20
	li	a1, -4
	bge	a3, s2, .LBB0_472
	j	.LBB0_24
.LBB0_472:                              # %if.end2055
	slli	a3, s2, 2
	add	a4, s7, a3
	lw	a4, 0(a4)
	bge	a4, t6, .LBB0_478
# %bb.473:                              # %if.end2061
	addiw	s2, s2, 1
	j	.LBB0_332
.LBB0_474:                              # %if.end2048
                                        #   in Loop: Header=BB0_475 Depth=1
	lw	a1, 36(a0)
	bge	a1, s2, .LBB0_470
.LBB0_475:                              # %if.end2015
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 0(a0)
	lw	a3, 8(a2)
	bnez	a3, .LBB0_476
	j	.LBB0_23
.LBB0_476:                              # %if.end2021
                                        #   in Loop: Header=BB0_475 Depth=1
	ld	a3, 0(a2)
	lw	a4, 32(a0)
	lbu	a3, 0(a3)
	slli	a4, a4, 8
	or	a3, a3, a4
	sw	a3, 32(a0)
	addi	a1, a1, 8
	sw	a1, 36(a0)
	ld	a1, 0(a2)
	addi	a1, a1, 1
	sd	a1, 0(a2)
	ld	a1, 0(a0)
	lw	a2, 8(a1)
	addi	a2, a2, -1
	sw	a2, 8(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	addi	a2, a2, 1
	sw	a2, 12(a1)
	ld	a1, 0(a0)
	lw	a2, 12(a1)
	bnez	a2, .LBB0_474
# %bb.477:                              # %if.then2044
                                        #   in Loop: Header=BB0_475 Depth=1
	lw	a2, 16(a1)
	addi	a2, a2, 1
	sw	a2, 16(a1)
	j	.LBB0_474
.LBB0_478:                              # %while.end2116
	ld	a2, 208(sp)                     # 8-byte Folded Reload
	add	a3, a3, a2
	lw	a2, 0(a3)
	subw	a2, t6, a2
	li	a3, 257
	bgeu	a3, a2, .LBB0_479
	j	.LBB0_24
.LBB0_479:                              # %if.end2129
	slli	a2, a2, 2
	add	a2, a2, s4
	lw	a3, 0(a2)
	li	a2, 2
	bgeu	a3, a2, .LBB0_481
# %bb.480:
	mv	a1, s0
	mv	a2, s11
	j	.LBB0_463
.LBB0_481:                              # %do.end
	mv	s8, s1
	sd	a3, 216(sp)                     # 8-byte Folded Spill
	ld	a2, 192(sp)                     # 8-byte Folded Reload
	lw	a2, 1(a2)
	add	a2, a2, a0
	addi	a2, a2, 2047
	lbu	a2, 1677(a2)
	add	a2, a2, a0
	addi	a2, a2, 2047
	lbu	a3, 1421(a2)
	slli	a2, a3, 2
	add	a4, a0, a2
	lw	a5, 68(a4)
	lbu	s1, 44(a0)
	addiw	a2, s11, 1
	add	a5, a5, a2
	sw	a5, 68(a4)
	beqz	s1, .LBB0_486
# %bb.482:                              # %while.cond2154.preheader
	bltz	s11, .LBB0_491
# %bb.483:                              # %while.body2157.lr.ph
	sext.w	a4, s5
	max	s5, a4, t5
	slli	a5, a4, 1
	li	s1, 1
.LBB0_484:                              # %while.body2157
                                        # =>This Inner Loop Header: Depth=1
	mv	s11, a2
	beq	s5, a4, .LBB0_517
# %bb.485:                              # %if.end2161
                                        #   in Loop: Header=BB0_484 Depth=1
	ld	a2, 200(sp)                     # 8-byte Folded Reload
	ld	a2, 8(a2)
	add	a2, a2, a5
	sh	a3, 0(a2)
	addi	a4, a4, 1
	addiw	a2, s11, -1
	addi	a5, a5, 2
	blt	s1, s11, .LBB0_484
	j	.LBB0_490
.LBB0_486:                              # %while.cond2170.preheader
	bltz	s11, .LBB0_491
# %bb.487:                              # %while.body2173.lr.ph
	sext.w	a4, s5
	max	s5, a4, t5
	slli	a5, a4, 2
	li	s1, 1
.LBB0_488:                              # %while.body2173
                                        # =>This Inner Loop Header: Depth=1
	mv	s11, a2
	beq	s5, a4, .LBB0_517
# %bb.489:                              # %if.end2177
                                        #   in Loop: Header=BB0_488 Depth=1
	ld	a2, 200(sp)                     # 8-byte Folded Reload
	ld	a2, 0(a2)
	add	a2, a2, a5
	sw	a3, 0(a2)
	addi	a4, a4, 1
	addiw	a2, s11, -1
	addi	a5, a5, 4
	blt	s1, s11, .LBB0_488
.LBB0_490:                              # %if.end2185.loopexit5193
	mv	s11, a2
	mv	s5, a4
	j	.LBB0_492
.LBB0_491:
	mv	s11, a2
.LBB0_492:                              # %while.cond1942
	ld	a3, 216(sp)                     # 8-byte Folded Reload
	mv	s1, s8
	bne	a3, s6, .LBB0_369
.LBB0_493:                              # %while.end2551
	lw	a2, 56(a0)
	li	a1, -4
	sd	a3, 216(sp)                     # 8-byte Folded Spill
	bltz	a2, .LBB0_524
# %bb.494:                              # %while.end2551
	sd	s4, 136(sp)                     # 8-byte Folded Spill
	sext.w	s4, s5
	bge	a2, s4, .LBB0_522
# %bb.495:                              # %if.end2560
	sd	t0, 128(sp)                     # 8-byte Folded Spill
	sd	a7, 112(sp)                     # 8-byte Folded Spill
	sw	zero, 1096(a0)
	li	a7, 1
	ld	a5, 184(sp)                     # 8-byte Folded Reload
	bnez	zero, .LBB0_499
# %bb.496:                              # %vector.ph5792
	mv	s8, s1
	mv	s1, a5
	mv	t0, s0
	li	a4, 8
	li	a7, 257
	li	s0, 32
	ld	a5, 168(sp)                     # 8-byte Folded Reload
	li	a3, 256
.LBB0_497:                              # %vector.body5797
                                        # =>This Inner Loop Header: Depth=1
	addi	a2, a5, -1032
	vl2re32.v	v8, (a2)
	vs2r.v	v8, (a5)
	sub	a3, a3, a4
	add	a5, a5, s0
	bnez	a3, .LBB0_497
# %bb.498:                              # %middle.block5789
	mv	s0, t0
	mv	a5, s1
	mv	s1, s8
	li	a2, 256
	beq	a2, a2, .LBB0_501
.LBB0_499:                              # %scalar.ph5790
	slli	a7, a7, 2
	add	a7, a7, a0
	addi	a2, a7, 1096
	addi	a3, a5, 77
.LBB0_500:                              # %for.body2565
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, -1032(a2)
	sw	a4, 0(a2)
	addi	a2, a2, 4
	bne	a2, a3, .LBB0_500
.LBB0_501:                              # %for.body2579.preheader
	li	a2, 0
	addi	s8, a0, 1096
	addi	a3, a0, 1100
	addi	a4, a5, 77
.LBB0_502:                              # %for.body2579
                                        # =>This Inner Loop Header: Depth=1
	lw	a5, 0(a3)
	add	a2, a2, a5
	sw	a2, 0(a3)
	addi	a3, a3, 4
	bne	a3, a4, .LBB0_502
# %bb.503:                              # %for.body2594.preheader
	sd	zero, 232(sp)                   # 8-byte Folded Spill
	li	a2, 257
	mv	a3, s8
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	ld	s6, 200(sp)                     # 8-byte Folded Reload
.LBB0_504:                              # %for.body2594
                                        # =>This Inner Loop Header: Depth=1
	lw	a4, 0(a3)
	bltz	a4, .LBB0_522
# %bb.505:                              # %for.body2594
                                        #   in Loop: Header=BB0_504 Depth=1
	blt	s4, a4, .LBB0_522
# %bb.506:                              # %for.inc2608
                                        #   in Loop: Header=BB0_504 Depth=1
	ld	a4, 232(sp)                     # 8-byte Folded Reload
	addi	a4, a4, 1
	addi	a3, a3, 4
	sd	a4, 232(sp)                     # 8-byte Folded Spill
	bne	a4, a2, .LBB0_504
# %bb.507:                              # %for.end2610
	sw	zero, 16(a0)
	sb	zero, 12(a0)
	lw	a1, 52(a0)
	li	a2, -1
	sw	a2, 32(s6)
	li	a2, 2
	sw	a2, 8(a0)
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	bge	a1, a2, .LBB0_535
# %bb.508:                              # %if.end2617
	lbu	a1, 44(a0)
	beqz	a1, .LBB0_536
.LBB0_509:                              # %for.cond2621.preheader
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s7, 160(sp)                     # 8-byte Folded Spill
	li	a2, 0
	ld	a1, 168(sp)                     # 8-byte Folded Reload
	addi	a7, a1, 1024
	bnez	zero, .LBB0_513
# %bb.510:                              # %vector.ph5806
	li	a3, 8
	li	a2, 256
	li	a4, 32
	mv	a5, a7
	li	s0, 256
.LBB0_511:                              # %vector.body5810
                                        # =>This Inner Loop Header: Depth=1
	addi	a1, a5, -1028
	vl2re32.v	v8, (a1)
	vs2r.v	v8, (a5)
	sub	s0, s0, a3
	add	a5, a5, a4
	bnez	s0, .LBB0_511
# %bb.512:                              # %middle.block5803
	li	a1, 257
	beq	a2, a1, .LBB0_515
.LBB0_513:                              # %scalar.ph5804
	slli	a2, a2, 2
	add	a2, a2, a0
	addi	a1, a2, 2047
	addi	a1, a1, 1677
	addi	a2, a1, -1600
.LBB0_514:                              # %for.body2624
                                        # =>This Inner Loop Header: Depth=1
	lw	a1, -1028(a2)
	sw	a1, 0(a2)
	addi	a2, a2, 4
	bne	a2, s6, .LBB0_514
.LBB0_515:                              # %for.cond2633.preheader
	blez	s4, .LBB0_525
# %bb.516:                              # %for.body2636.lr.ph
	li	a2, 0
	li	s1, 0
	j	.LBB0_520
.LBB0_517:
	mv	s1, s8
	j	.LBB0_24
.LBB0_518:                              # %if.else2669
                                        #   in Loop: Header=BB0_520 Depth=1
	andi	a1, a1, 15
	srliw	a3, s0, 16
	slli	a3, a3, 4
	or	a1, a1, a3
.LBB0_519:                              # %if.end2687
                                        #   in Loop: Header=BB0_520 Depth=1
	sb	a1, 0(a5)
	lw	a1, 0(a4)
	addi	a1, a1, 1
	sw	a1, 0(a4)
	addi	s1, s1, 1
	addi	a2, a2, 2
	beq	s4, s1, .LBB0_525
.LBB0_520:                              # %for.body2636
                                        # =>This Inner Loop Header: Depth=1
	ld	a1, 8(s6)
	add	a1, a1, a2
	lbu	a4, 0(a1)
	slli	a4, a4, 2
	add	a4, a4, a7
	lh	a5, 0(a4)
	sh	a5, 0(a1)
	ld	a5, 16(s6)
	srliw	a1, s1, 1
	add	a5, a5, a1
	lbu	a1, 0(a5)
	lw	s0, 0(a4)
	andi	a3, s1, 1
	bnez	a3, .LBB0_518
# %bb.521:                              # %if.then2652
                                        #   in Loop: Header=BB0_520 Depth=1
	andi	a1, a1, 240
	srliw	a3, s0, 16
	or	a1, a1, a3
	j	.LBB0_519
.LBB0_522:                              # %save_state_and_return.loopexit5189
	ld	s6, 216(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	j	.LBB0_24
.LBB0_523:
	li	t1, 0
	li	a1, -4
	j	.LBB0_24
.LBB0_524:
	mv	s6, a3
	j	.LBB0_24
.LBB0_525:                              # %for.end2694
	lw	a1, 56(a0)
	ld	a2, 8(s6)
	ld	a3, 16(s6)
	slli	a4, a1, 1
	add	a2, a2, a4
	sraiw	a4, a1, 1
	add	a3, a3, a4
	lbu	a3, 0(a3)
	lhu	a2, 0(a2)
	slli	a4, a1, 2
	andi	a4, a4, 4
	srlw	a3, a3, a4
	slli	a3, a3, 60
	srli	a3, a3, 44
	or	a3, a3, a2
	ld	t0, 224(sp)                     # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	j	.LBB0_528
.LBB0_526:                              # %if.else2750
                                        #   in Loop: Header=BB0_528 Depth=1
	andi	a5, a5, 15
	srliw	a1, a1, 16
	slli	a1, a1, 4
.LBB0_527:                              # %if.end2765
                                        #   in Loop: Header=BB0_528 Depth=1
	or	a1, a1, a5
	ld	a2, 232(sp)                     # 8-byte Folded Reload
	slli	a5, a2, 2
	andi	a5, a5, 4
	sb	a1, 0(a4)
	lw	a4, 56(a0)
	srlw	a1, s0, a5
	slli	a1, a1, 60
	srli	a1, a1, 44
	or	a3, a1, a7
	mv	a1, a2
	beq	a2, a4, .LBB0_530
.LBB0_528:                              # %do.body2711
                                        # =>This Inner Loop Header: Depth=1
	ld	a2, 8(s6)
	slli	a5, a3, 1
	ld	s1, 16(s6)
	add	a5, a5, a2
	lhu	a7, 0(a5)
	srliw	a4, a3, 1
	add	s1, s1, a4
	lbu	s0, 0(s1)
	sh	a1, 0(a5)
	ld	a5, 16(s6)
	add	a4, a4, a5
	lbu	a5, 0(a4)
	sd	a3, 232(sp)                     # 8-byte Folded Spill
	andi	s1, a3, 1
	bnez	s1, .LBB0_526
# %bb.529:                              # %if.then2736
                                        #   in Loop: Header=BB0_528 Depth=1
	andi	a5, a5, 240
	srliw	a1, a1, 16
	j	.LBB0_527
.LBB0_530:                              # %do.end2770
	sd	t1, 96(sp)                      # 8-byte Folded Spill
	sd	ra, 144(sp)                     # 8-byte Folded Spill
	sd	t2, 32(sp)                      # 8-byte Folded Spill
	sd	t5, 104(sp)                     # 8-byte Folded Spill
	sd	t4, 64(sp)                      # 8-byte Folded Spill
	sd	a3, 88(sp)                      # 8-byte Folded Spill
	sd	t6, 80(sp)                      # 8-byte Folded Spill
	mv	s4, a6
	lbu	a1, 20(a0)
	sw	a2, 60(a0)
	sw	zero, 1092(a0)
	beqz	a1, .LBB0_534
# %bb.531:                              # %if.then2774
	sd	zero, 24(a0)
	mv	s0, a0
	mv	a0, a2
	mv	a1, s8
	call	BZ2_indexIntoF
	mv	a2, s0
	lwu	a1, 60(s0)
	ld	a3, 8(s6)
	sw	a0, 64(s0)
	ld	a4, 16(s6)
	slli	a5, a1, 1
	add	a3, a3, a5
	srli	a5, a1, 1
	add	a4, a4, a5
	lbu	a4, 0(a4)
	lhu	a5, 0(a3)
	slli	a1, a1, 2
	andi	a1, a1, 4
	srlw	a1, a4, a1
	slli	a1, a1, 60
	srli	a1, a1, 44
	lw	a4, 1092(s0)
	lw	a3, 24(s0)
	or	a1, a1, a5
	sw	a1, 60(s0)
	addi	a4, a4, 1
	sw	a4, 1092(s0)
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	bnez	a3, .LBB0_533
# %bb.532:                              # %if.then2802
	lw	a1, 28(a2)
	slli	a3, a1, 2
	lui	a4, %hi(BZ2_rNums)
	addi	a4, a4, %lo(BZ2_rNums)
	add	a3, a3, a4
	lw	a3, 0(a3)
	addiw	a1, a1, 1
	addi	a4, a1, -512
	seqz	a4, a4
	addi	a4, a4, -1
	and	a1, a1, a4
	sw	a1, 28(a2)
.LBB0_533:                              # %if.end2815
	li	a1, 0
	addiw	a3, a3, -1
	sw	a3, 24(a2)
	addi	a3, a3, -1
	seqz	a3, a3
	xor	a0, a0, a3
	sw	a0, 64(a2)
	ld	s6, 216(sp)                     # 8-byte Folded Reload
	mv	a6, s4
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	t2, 32(sp)                      # 8-byte Folded Reload
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	s7, 160(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	j	.LBB0_24
.LBB0_534:                              # %if.else2822
	sd	t0, 224(sp)                     # 8-byte Folded Spill
	mv	s1, a0
	mv	a0, a2
	mv	a1, s8
	call	BZ2_indexIntoF
	li	a1, 0
	lwu	a2, 60(s1)
	ld	a3, 8(s6)
	sw	a0, 64(s1)
	ld	a0, 16(s6)
	slli	a4, a2, 1
	add	a3, a3, a4
	srli	a4, a2, 1
	add	a0, a0, a4
	lbu	a0, 0(a0)
	lhu	a3, 0(a3)
	slli	a2, a2, 2
	andi	a2, a2, 4
	srlw	a0, a0, a2
	slli	a0, a0, 60
	lw	a2, 1092(s1)
	srli	a0, a0, 44
	or	a0, a0, a3
	sw	a0, 60(s1)
	addi	a2, a2, 1
	sw	a2, 1092(s1)
	ld	s6, 216(sp)                     # 8-byte Folded Reload
	mv	a6, s4
	ld	t6, 80(sp)                      # 8-byte Folded Reload
	ld	t3, 88(sp)                      # 8-byte Folded Reload
	ld	t4, 64(sp)                      # 8-byte Folded Reload
	ld	t5, 104(sp)                     # 8-byte Folded Reload
	ld	t2, 32(sp)                      # 8-byte Folded Reload
	ld	ra, 144(sp)                     # 8-byte Folded Reload
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	ld	t1, 96(sp)                      # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	j	.LBB0_24
.LBB0_535:                              # %if.then2615
	lui	a1, %hi(stderr)
	ld	a3, %lo(stderr)(a1)
	lui	a4, %hi(.L.str.1)
	addi	a4, a4, %lo(.L.str.1)
	li	a1, 6
	li	a2, 1
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s11, 104(sp)                    # 8-byte Folded Spill
	sd	s3, 48(sp)                      # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	a0, 24(sp)                      # 8-byte Folded Spill
	mv	a0, a4
	mv	s1, a6
	mv	s6, s7
	mv	s0, t6
	mv	s2, t3
	mv	s3, t4
	sd	s10, 120(sp)                    # 8-byte Folded Spill
	mv	s10, t5
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	mv	s5, t2
	mv	s7, ra
	mv	s11, t1
	call	fwrite
	ld	t0, 128(sp)                     # 8-byte Folded Reload
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	mv	t1, s11
	mv	ra, s7
	mv	t2, s5
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	mv	t5, s10
	ld	s10, 120(sp)                    # 8-byte Folded Reload
	mv	t4, s3
	mv	t3, s2
	mv	t6, s0
	mv	s7, s6
	ld	s6, 200(sp)                     # 8-byte Folded Reload
	mv	a6, s1
	ld	a0, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 152(sp)                     # 8-byte Folded Reload
	ld	s3, 48(sp)                      # 8-byte Folded Reload
	ld	s11, 104(sp)                    # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	lbu	a1, 44(a0)
	bnez	a1, .LBB0_509
.LBB0_536:                              # %for.cond2851.preheader
	blez	s4, .LBB0_540
# %bb.537:                              # %for.body2854.lr.ph
	li	a1, 0
	li	a2, 0
	slli	s1, s4, 2
.LBB0_538:                              # %for.body2854
                                        # =>This Inner Loop Header: Depth=1
	ld	a3, 0(s6)
	add	a4, a3, a2
	lbu	a4, 0(a4)
	slli	a4, a4, 2
	add	a4, a4, s8
	lw	a5, 0(a4)
	slli	a5, a5, 2
	add	a3, a3, a5
	lw	a5, 0(a3)
	or	a5, a5, a1
	sw	a5, 0(a3)
	lw	a3, 0(a4)
	addi	a3, a3, 1
	sw	a3, 0(a4)
	addi	a2, a2, 4
	addi	a1, a1, 256
	bne	s1, a2, .LBB0_538
# %bb.539:
	sd	s5, 232(sp)                     # 8-byte Folded Spill
	j	.LBB0_541
.LBB0_540:
	sd	zero, 232(sp)                   # 8-byte Folded Spill
.LBB0_541:                              # %for.end2874
	ld	s4, 136(sp)                     # 8-byte Folded Reload
	lw	a2, 56(a0)
	ld	a1, 0(s6)
	slli	a2, a2, 2
	add	a2, a2, a1
	lwu	a2, 0(a2)
	lbu	a3, 20(a0)
	srli	a2, a2, 8
	sw	a2, 60(a0)
	sw	zero, 1092(a0)
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	beqz	a3, .LBB0_543
# %bb.542:                              # %if.end2917
	sd	zero, 24(a0)
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a2, 0(a1)
	li	a1, 0
	srliw	a3, a2, 8
	sw	a3, 60(a0)
	li	a3, 1
	lui	a4, %hi(BZ2_rNums)
	lw	a4, %lo(BZ2_rNums)(a4)
	sw	a3, 1092(a0)
	sw	a3, 28(a0)
	andi	a2, a2, 255
	addiw	a4, a4, -1
	sw	a4, 24(a0)
	addi	a4, a4, -1
	seqz	a3, a4
	xor	a2, a2, a3
	sw	a2, 64(a0)
	ld	s6, 216(sp)                     # 8-byte Folded Reload
	j	.LBB0_24
.LBB0_543:                              # %if.else2926
	slli	a2, a2, 2
	add	a1, a1, a2
	lw	a2, 0(a1)
	li	a1, 0
	andi	a3, a2, 255
	sw	a3, 64(a0)
	srliw	a2, a2, 8
	sw	a2, 60(a0)
	li	a2, 1
	sw	a2, 1092(a0)
	ld	s6, 216(sp)                     # 8-byte Folded Reload
	j	.LBB0_24
.Lfunc_end0:
	.size	BZ2_decompress, .Lfunc_end0-BZ2_decompress
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI0_0:
	.word	.LBB0_21
	.word	.LBB0_33
	.word	.LBB0_41
	.word	.LBB0_80
	.word	.LBB0_31
	.word	.LBB0_36
	.word	.LBB0_30
	.word	.LBB0_38
	.word	.LBB0_51
	.word	.LBB0_95
	.word	.LBB0_56
	.word	.LBB0_39
	.word	.LBB0_40
	.word	.LBB0_54
	.word	.LBB0_57
	.word	.LBB0_35
	.word	.LBB0_34
	.word	.LBB0_267
	.word	.LBB0_359
	.word	.LBB0_350
	.word	.LBB0_61
	.word	.LBB0_66
	.word	.LBB0_276
	.word	.LBB0_280
	.word	.LBB0_28
	.word	.LBB0_316
	.word	.LBB0_58
	.word	.LBB0_469
	.word	.LBB0_59
	.word	.LBB0_437
	.word	.LBB0_52
	.word	.LBB0_37
	.word	.LBB0_53
	.word	.LBB0_32
	.word	.LBB0_29
	.word	.LBB0_26
	.word	.LBB0_27
	.word	.LBB0_25
	.word	.LBB0_60
	.word	.LBB0_55
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +v, +zbb, +zicsr, +zifencei, +zmmul, +zve32f, +zve32x, +zve64d, +zve64f, +zve64x, +zvl128b, +zvl32b, +zvl64b
	.text
	.p2align	1                               # -- Begin function makeMaps_d
	.type	makeMaps_d,@function
makeMaps_d:                             # @makeMaps_d
	.cfi_startproc
# %bb.0:                                # %entry
	li	a2, 0
	li	a5, 0
	addi	a0, a0, 2047
	sw	zero, 1145(a0)
	addi	a3, a0, 1149
	addi	a4, a0, 1421
	li	a6, 256
	j	.LBB1_2
.LBB1_1:                                # %for.inc
                                        #   in Loop: Header=BB1_2 Depth=1
	addi	a5, a5, 1
	beq	a5, a6, .LBB1_4
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	add	a1, a3, a5
	lbu	a1, 0(a1)
	beqz	a1, .LBB1_1
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB1_2 Depth=1
	add	a2, a2, a4
	sb	a5, 0(a2)
	lw	a2, 1145(a0)
	addiw	a2, a2, 1
	sw	a2, 1145(a0)
	j	.LBB1_1
.LBB1_4:                                # %for.end
	ret
.Lfunc_end1:
	.size	makeMaps_d, .Lfunc_end1-makeMaps_d
	.cfi_endproc
                                        # -- End function
	.option	pop
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\n    [%d: huff+mtf "
	.size	.L.str, 20

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"rt+rld"
	.size	.L.str.1, 7

	.ident	"clang version 19.1.0-rc3 (https://github.com/Tomlord1122/llvm-project.git 144dacd57b63cdc6a7e04b3697c5198231dca347)"
	.section	".note.GNU-stack","",@progbits
