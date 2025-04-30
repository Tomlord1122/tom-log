; *** IR Dump After LoopVectorizePass on Perl_av_extend ***
; ModuleID = 'av.c'
source_filename = "av.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-linux-gnu"

%struct.sv = type { ptr, i32, i32 }

@PL_sv_undef = external global %struct.sv, align 8
@PL_Sv = external local_unnamed_addr global ptr, align 8
@PL_stack_sp = external local_unnamed_addr global ptr, align 8
@PL_tmps_floor = external global i32, align 4
@PL_tmps_ix = external local_unnamed_addr global i32, align 4
@PL_curstackinfo = external local_unnamed_addr global ptr, align 8
@PL_stack_base = external local_unnamed_addr global ptr, align 8
@PL_curstack = external local_unnamed_addr global ptr, align 8
@PL_stack_max = external local_unnamed_addr global ptr, align 8
@PL_markstack_ptr = external local_unnamed_addr global ptr, align 8
@PL_markstack_max = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [7 x i8] c"EXTEND\00", align 1
@PL_stderrgv = external local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [17 x i8] c"panic: POPSTACK\0A\00", align 1
@PL_nice_chunk_size = external local_unnamed_addr global i32, align 4
@PL_nice_chunk = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [17 x i8] c"NEGATIVE_INDICES\00", align 1
@PL_Xpv = external local_unnamed_addr global ptr, align 8
@PL_no_modify = external constant [0 x i8], align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"PUSH\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"POP\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"UNSHIFT\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"SHIFT\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"panic: null array\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"STORESIZE\00", align 1
@PL_curcop = external global ptr, align 8
@PL_dowarn = external local_unnamed_addr global i8, align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"pseudohash\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"Pseudo-hashes are deprecated\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"Can't coerce array into hash\00", align 1
@.str.12 = private unnamed_addr constant [31 x i8] c"No such pseudo-hash field \22%s\22\00", align 1
@.str.13 = private unnamed_addr constant [41 x i8] c"Bad index while coercing array into hash\00", align 1

; Function Attrs: nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable vscale_range(2,2)
define dso_local void @Perl_av_reify(ptr nocapture noundef readonly %av) local_unnamed_addr #0 {
entry:
  %0 = load ptr, ptr %av, align 8
  %xav_flags = getelementptr inbounds i8, ptr %0, i64 72
  %1 = load i8, ptr %xav_flags, align 8
  %2 = and i8 %1, 1
  %tobool.not = icmp eq i8 %2, 0
  br i1 %tobool.not, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %xav_max = getelementptr inbounds i8, ptr %0, i64 16
  %3 = load i64, ptr %xav_max, align 8
  %4 = trunc i64 %3 to i32
  %conv2 = add i32 %4, 1
  %conv361 = sext i32 %conv2 to i64
  %xav_fill62 = getelementptr inbounds i8, ptr %0, i64 8
  %5 = load i64, ptr %xav_fill62, align 8
  %add563 = add nsw i64 %5, 1
  %cmp64 = icmp slt i64 %add563, %conv361
  br i1 %cmp64, label %while.body, label %while.cond8.preheader

while.cond8.preheader.loopexit:                   ; preds = %while.body
  %6 = trunc nsw i64 %indvars.iv.next to i32
  br label %while.cond8.preheader

while.cond8.preheader:                            ; preds = %while.cond8.preheader.loopexit, %if.end
  %7 = phi ptr [ %0, %if.end ], [ %11, %while.cond8.preheader.loopexit ]
  %key.0.lcssa = phi i32 [ %conv2, %if.end ], [ %6, %while.cond8.preheader.loopexit ]
  %tobool9.not66 = icmp eq i32 %key.0.lcssa, 0
  br i1 %tobool9.not66, label %while.end22, label %while.body10.preheader

while.body10.preheader:                           ; preds = %while.cond8.preheader
  %8 = sext i32 %key.0.lcssa to i64
  br label %while.body10

while.body:                                       ; preds = %if.end, %while.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.body ], [ %conv361, %if.end ]
  %9 = phi ptr [ %11, %while.body ], [ %0, %if.end ]
  %10 = load ptr, ptr %9, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds ptr, ptr %10, i64 %indvars.iv.next
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  %11 = load ptr, ptr %av, align 8
  %xav_fill = getelementptr inbounds i8, ptr %11, i64 8
  %12 = load i64, ptr %xav_fill, align 8
  %add5 = add nsw i64 %12, 1
  %cmp = icmp slt i64 %add5, %indvars.iv.next
  br i1 %cmp, label %while.body, label %while.cond8.preheader.loopexit

while.body10:                                     ; preds = %while.body10.preheader, %if.end21
  %indvars.iv70 = phi i64 [ %8, %while.body10.preheader ], [ %indvars.iv.next71, %if.end21 ]
  %13 = load ptr, ptr %av, align 8
  %14 = load ptr, ptr %13, align 8
  %indvars.iv.next71 = add nsw i64 %indvars.iv70, -1
  %arrayidx15 = getelementptr inbounds ptr, ptr %14, i64 %indvars.iv.next71
  %15 = load ptr, ptr %arrayidx15, align 8
  %cmp16.not = icmp eq ptr %15, @PL_sv_undef
  br i1 %cmp16.not, label %if.end21, label %if.then18

if.then18:                                        ; preds = %while.body10
  store ptr %15, ptr @PL_Sv, align 8
  %tobool19.not = icmp eq ptr %15, null
  br i1 %tobool19.not, label %if.end21, label %land.rhs

land.rhs:                                         ; preds = %if.then18
  %sv_refcnt = getelementptr inbounds i8, ptr %15, i64 8
  %16 = load i32, ptr %sv_refcnt, align 8
  %inc = add i32 %16, 1
  store i32 %inc, ptr %sv_refcnt, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.then18, %land.rhs, %while.body10
  %tobool9.not = icmp eq i64 %indvars.iv.next71, 0
  br i1 %tobool9.not, label %while.end22.loopexit, label %while.body10

while.end22.loopexit:                             ; preds = %if.end21
  %.pre = load ptr, ptr %av, align 8
  br label %while.end22

while.end22:                                      ; preds = %while.end22.loopexit, %while.cond8.preheader
  %17 = phi ptr [ %.pre, %while.end22.loopexit ], [ %7, %while.cond8.preheader ]
  %18 = load ptr, ptr %17, align 8
  %xav_alloc = getelementptr inbounds i8, ptr %17, i64 56
  %19 = load ptr, ptr %xav_alloc, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %18 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %19 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %20 = and i64 %sub.ptr.sub, 34359738360
  %tobool28.not68 = icmp eq i64 %20, 0
  br i1 %tobool28.not68, label %while.end35, label %while.body29.preheader

while.body29.preheader:                           ; preds = %while.end22
  %sext = shl i64 %sub.ptr.sub, 29
  %21 = ashr i64 %sext, 32
  br label %while.body29

while.body29:                                     ; preds = %while.body29.preheader, %while.body29
  %indvars.iv72 = phi i64 [ %21, %while.body29.preheader ], [ %indvars.iv.next73, %while.body29 ]
  %22 = load ptr, ptr %av, align 8
  %xav_alloc31 = getelementptr inbounds i8, ptr %22, i64 56
  %23 = load ptr, ptr %xav_alloc31, align 8
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, -1
  %arrayidx34 = getelementptr inbounds ptr, ptr %23, i64 %indvars.iv.next73
  store ptr @PL_sv_undef, ptr %arrayidx34, align 8
  %tobool28.not = icmp eq i64 %indvars.iv.next73, 0
  br i1 %tobool28.not, label %while.end35.loopexit, label %while.body29

while.end35.loopexit:                             ; preds = %while.body29
  %.pre74 = load ptr, ptr %av, align 8
  br label %while.end35

while.end35:                                      ; preds = %while.end35.loopexit, %while.end22
  %24 = phi ptr [ %.pre74, %while.end35.loopexit ], [ %17, %while.end22 ]
  %xav_flags37 = getelementptr inbounds i8, ptr %24, i64 72
  %25 = load i8, ptr %xav_flags37, align 8
  %26 = and i8 %25, -3
  store i8 %26, ptr %xav_flags37, align 8
  %27 = load ptr, ptr %av, align 8
  %xav_flags42 = getelementptr inbounds i8, ptr %27, i64 72
  %28 = load i8, ptr %xav_flags42, align 8
  %29 = or i8 %28, 1
  store i8 %29, ptr %xav_flags42, align 8
  br label %cleanup

cleanup:                                          ; preds = %entry, %while.end35
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local void @Perl_av_extend(ptr noundef %av, i32 noundef signext %key) local_unnamed_addr #2 {
entry:
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool.not = icmp eq i32 %and, 0
  br i1 %tobool.not, label %if.end101, label %cond.end

cond.end:                                         ; preds = %entry
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool1.not = icmp eq ptr %call, null
  br i1 %tobool1.not, label %if.end101, label %if.then

if.then:                                          ; preds = %cond.end
  %1 = load ptr, ptr @PL_stack_sp, align 8
  tail call void @Perl_push_scope() #7
  tail call void @Perl_save_int(ptr noundef nonnull @PL_tmps_floor) #7
  %2 = load i32, ptr @PL_tmps_ix, align 4
  store i32 %2, ptr @PL_tmps_floor, align 4
  %3 = load ptr, ptr @PL_curstackinfo, align 8
  %si_next = getelementptr inbounds i8, ptr %3, i64 40
  %4 = load ptr, ptr %si_next, align 8
  %tobool2.not = icmp eq ptr %4, null
  br i1 %tobool2.not, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %call4 = tail call ptr @Perl_new_stackinfo(i32 noundef signext 32, i32 noundef signext 13) #7
  %5 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev = getelementptr inbounds i8, ptr %call4, i64 32
  store ptr %5, ptr %si_prev, align 8
  %si_next5 = getelementptr inbounds i8, ptr %5, i64 40
  store ptr %call4, ptr %si_next5, align 8
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %next.0 = phi ptr [ %4, %if.then ], [ %call4, %if.then3 ]
  %si_type = getelementptr inbounds i8, ptr %next.0, i64 24
  store i32 2, ptr %si_type, align 8
  %si_cxix = getelementptr inbounds i8, ptr %next.0, i64 16
  store i32 -1, ptr %si_cxix, align 8
  %6 = load ptr, ptr %next.0, align 8
  %7 = load ptr, ptr %6, align 8
  %xav_fill = getelementptr inbounds i8, ptr %7, i64 8
  store i64 0, ptr %xav_fill, align 8
  %8 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %9 = load ptr, ptr @PL_curstack, align 8
  %10 = load ptr, ptr %9, align 8
  %xav_fill7 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %sub.ptr.div, ptr %xav_fill7, align 8
  %11 = load ptr, ptr %next.0, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr @PL_stack_base, align 8
  %14 = load ptr, ptr %next.0, align 8
  %15 = load ptr, ptr %14, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  %16 = load i64, ptr %xav_max, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %13, i64 %16
  store ptr %add.ptr, ptr @PL_stack_max, align 8
  %17 = load ptr, ptr %next.0, align 8
  %18 = load ptr, ptr %17, align 8
  %xav_fill14 = getelementptr inbounds i8, ptr %18, i64 8
  %19 = load i64, ptr %xav_fill14, align 8
  %add.ptr15 = getelementptr inbounds ptr, ptr %13, i64 %19
  store ptr %add.ptr15, ptr @PL_stack_sp, align 8
  %20 = load ptr, ptr %next.0, align 8
  store ptr %20, ptr @PL_curstack, align 8
  store ptr %next.0, ptr @PL_curstackinfo, align 8
  %21 = load ptr, ptr @PL_markstack_ptr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %21, i64 4
  store ptr %incdec.ptr, ptr @PL_markstack_ptr, align 8
  %22 = load ptr, ptr @PL_markstack_max, align 8
  %cmp = icmp eq ptr %incdec.ptr, %22
  br i1 %cmp, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end
  tail call void @Perl_markstack_grow() #7
  %.pre = load ptr, ptr @PL_stack_base, align 8
  %.pre400 = load ptr, ptr @PL_markstack_ptr, align 8
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end
  %23 = phi ptr [ %.pre400, %if.then17 ], [ %incdec.ptr, %if.end ]
  %24 = phi ptr [ %.pre, %if.then17 ], [ %13, %if.end ]
  %sub.ptr.lhs.cast20 = ptrtoint ptr %add.ptr15 to i64
  %sub.ptr.rhs.cast21 = ptrtoint ptr %24 to i64
  %sub.ptr.sub22 = sub i64 %sub.ptr.lhs.cast20, %sub.ptr.rhs.cast21
  %sub.ptr.div23 = lshr exact i64 %sub.ptr.sub22, 3
  %conv = trunc i64 %sub.ptr.div23 to i32
  store i32 %conv, ptr %23, align 4
  %25 = load ptr, ptr @PL_stack_max, align 8
  %sub.ptr.lhs.cast24 = ptrtoint ptr %25 to i64
  %sub.ptr.sub26 = sub i64 %sub.ptr.lhs.cast24, %sub.ptr.lhs.cast20
  %cmp28 = icmp slt i64 %sub.ptr.sub26, 9
  br i1 %cmp28, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.end18
  %call31 = tail call ptr @Perl_stack_grow(ptr noundef %add.ptr15, ptr noundef %add.ptr15, i32 noundef signext 2) #7
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.end18
  %sp.0 = phi ptr [ %call31, %if.then30 ], [ %add.ptr15, %if.end18 ]
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %26 = load ptr, ptr %mg_obj, align 8
  %tobool33.not = icmp eq ptr %26, null
  br i1 %tobool33.not, label %cond.false36, label %cond.end39

cond.false36:                                     ; preds = %if.end32
  %call37 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call38 = tail call ptr @Perl_sv_2mortal(ptr noundef %call37) #7
  br label %cond.end39

cond.end39:                                       ; preds = %if.end32, %cond.false36
  %cond40 = phi ptr [ %call38, %cond.false36 ], [ %26, %if.end32 ]
  %incdec.ptr41 = getelementptr inbounds i8, ptr %sp.0, i64 8
  store ptr %cond40, ptr %incdec.ptr41, align 8
  %add = add nsw i32 %key, 1
  %conv42 = sext i32 %add to i64
  %call43 = tail call ptr @Perl_newSViv(i64 noundef %conv42) #7
  %call44 = tail call ptr @Perl_sv_2mortal(ptr noundef %call43) #7
  %incdec.ptr45 = getelementptr inbounds i8, ptr %sp.0, i64 16
  store ptr %call44, ptr %incdec.ptr45, align 8
  store ptr %incdec.ptr45, ptr @PL_stack_sp, align 8
  %call46 = tail call signext i32 @Perl_call_method(ptr noundef nonnull @.str, i32 noundef signext 2) #7
  %27 = load ptr, ptr @PL_stack_sp, align 8
  %28 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev48 = getelementptr inbounds i8, ptr %28, i64 32
  %29 = load ptr, ptr %si_prev48, align 8
  %tobool49.not = icmp eq ptr %29, null
  br i1 %tobool49.not, label %if.then50, label %if.end76

if.then50:                                        ; preds = %cond.end39
  %30 = load ptr, ptr @PL_stderrgv, align 8
  %tobool51.not = icmp eq ptr %30, null
  br i1 %tobool51.not, label %cond.false71, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then50
  %sv_flags52 = getelementptr inbounds i8, ptr %30, i64 12
  %31 = load i32, ptr %sv_flags52, align 4
  %and53 = and i32 %31, 255
  %cmp54 = icmp eq i32 %and53, 13
  br i1 %cmp54, label %land.lhs.true56, label %cond.false71

land.lhs.true56:                                  ; preds = %land.lhs.true
  %32 = load ptr, ptr %30, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %32, i64 56
  %33 = load ptr, ptr %xgv_gp, align 8
  %gp_io = getelementptr inbounds i8, ptr %33, i64 16
  %34 = load ptr, ptr %gp_io, align 8
  %tobool58.not = icmp eq ptr %34, null
  br i1 %tobool58.not, label %cond.false71, label %land.lhs.true59

land.lhs.true59:                                  ; preds = %land.lhs.true56
  %35 = load ptr, ptr %34, align 8
  %xio_ofp = getelementptr inbounds i8, ptr %35, i64 64
  %36 = load ptr, ptr %xio_ofp, align 8
  %tobool64.not = icmp eq ptr %36, null
  br i1 %tobool64.not, label %cond.false71, label %cond.end73

cond.false71:                                     ; preds = %land.lhs.true59, %land.lhs.true56, %land.lhs.true, %if.then50
  %call72 = tail call ptr @Perl_PerlIO_stderr() #7
  br label %cond.end73

cond.end73:                                       ; preds = %land.lhs.true59, %cond.false71
  %cond74 = phi ptr [ %call72, %cond.false71 ], [ %36, %land.lhs.true59 ]
  %call75 = tail call signext i32 (ptr, ptr, ...) @PerlIO_printf(ptr noundef %cond74, ptr noundef nonnull @.str.1) #7
  tail call void @Perl_my_exit(i32 noundef signext 1) #7
  br label %if.end76

if.end76:                                         ; preds = %cond.end73, %cond.end39
  %37 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast77 = ptrtoint ptr %27 to i64
  %sub.ptr.rhs.cast78 = ptrtoint ptr %37 to i64
  %sub.ptr.sub79 = sub i64 %sub.ptr.lhs.cast77, %sub.ptr.rhs.cast78
  %sub.ptr.div80 = ashr exact i64 %sub.ptr.sub79, 3
  %38 = load ptr, ptr @PL_curstack, align 8
  %39 = load ptr, ptr %38, align 8
  %xav_fill82 = getelementptr inbounds i8, ptr %39, i64 8
  store i64 %sub.ptr.div80, ptr %xav_fill82, align 8
  %40 = load ptr, ptr %29, align 8
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr @PL_stack_base, align 8
  %43 = load ptr, ptr %29, align 8
  %44 = load ptr, ptr %43, align 8
  %xav_max88 = getelementptr inbounds i8, ptr %44, i64 16
  %45 = load i64, ptr %xav_max88, align 8
  %add.ptr89 = getelementptr inbounds ptr, ptr %42, i64 %45
  store ptr %add.ptr89, ptr @PL_stack_max, align 8
  %46 = load ptr, ptr %29, align 8
  %47 = load ptr, ptr %46, align 8
  %xav_fill92 = getelementptr inbounds i8, ptr %47, i64 8
  %48 = load i64, ptr %xav_fill92, align 8
  %add.ptr93 = getelementptr inbounds ptr, ptr %42, i64 %48
  store ptr %add.ptr93, ptr @PL_stack_sp, align 8
  %49 = load ptr, ptr %29, align 8
  store ptr %49, ptr @PL_curstack, align 8
  store ptr %29, ptr @PL_curstackinfo, align 8
  %50 = load i32, ptr @PL_tmps_ix, align 4
  %51 = load i32, ptr @PL_tmps_floor, align 4
  %cmp97 = icmp sgt i32 %50, %51
  br i1 %cmp97, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end76
  tail call void @Perl_free_tmps() #7
  br label %if.end100

if.end100:                                        ; preds = %if.then99, %if.end76
  tail call void @Perl_pop_scope() #7
  br label %cleanup

if.end101:                                        ; preds = %entry, %cond.end
  %conv102 = sext i32 %key to i64
  %52 = load ptr, ptr %av, align 8
  %xav_max104 = getelementptr inbounds i8, ptr %52, i64 16
  %53 = load i64, ptr %xav_max104, align 8
  %cmp105 = icmp slt i64 %53, %conv102
  br i1 %cmp105, label %if.then107, label %cleanup

if.then107:                                       ; preds = %if.end101
  %xav_alloc = getelementptr inbounds i8, ptr %52, i64 56
  %54 = load ptr, ptr %xav_alloc, align 8
  %55 = load ptr, ptr %52, align 8
  %cmp112.not = icmp eq ptr %54, %55
  br i1 %cmp112.not, label %if.else, label %if.then114

if.then114:                                       ; preds = %if.then107
  %xav_fill118 = getelementptr inbounds i8, ptr %52, i64 8
  %56 = load i64, ptr %xav_fill118, align 8
  %add.ptr119 = getelementptr inbounds ptr, ptr %54, i64 %56
  %sub.ptr.lhs.cast125 = ptrtoint ptr %55 to i64
  %sub.ptr.rhs.cast126 = ptrtoint ptr %54 to i64
  %sub.ptr.sub127 = sub i64 %sub.ptr.lhs.cast125, %sub.ptr.rhs.cast126
  %add136 = shl i64 %56, 3
  %mul = add i64 %add136, 8
  tail call void @llvm.memmove.p0.p0.i64(ptr align 1 %54, ptr align 1 %55, i64 %mul, i1 false)
  %sext = shl i64 %sub.ptr.sub127, 29
  %conv137 = ashr i64 %sext, 32
  %57 = load ptr, ptr %av, align 8
  %xav_max139 = getelementptr inbounds i8, ptr %57, i64 16
  %58 = load i64, ptr %xav_max139, align 8
  %add140 = add nsw i64 %58, %conv137
  store i64 %add140, ptr %xav_max139, align 8
  %59 = load ptr, ptr %av, align 8
  %xav_alloc142 = getelementptr inbounds i8, ptr %59, i64 56
  %60 = load ptr, ptr %xav_alloc142, align 8
  store ptr %60, ptr %59, align 8
  %61 = load ptr, ptr %av, align 8
  %xav_flags = getelementptr inbounds i8, ptr %61, i64 72
  %62 = load i8, ptr %xav_flags, align 8
  %63 = and i8 %62, 1
  %tobool147 = icmp ne i8 %63, 0
  %64 = and i64 %sub.ptr.sub127, 34359738360
  %tobool149 = icmp ne i64 %64, 0
  %or.cond = and i1 %tobool147, %tobool149
  br i1 %or.cond, label %while.body.preheader, label %if.end150

while.body.preheader:                             ; preds = %if.then114
  %65 = shl i64 %sub.ptr.sub127, 29
  %66 = ashr i64 %65, 32
  %67 = call i64 @llvm.vscale.i64()
  %68 = mul i64 %67, 2
  %min.iters.check = icmp ult i64 %66, %68
  br i1 %min.iters.check, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %while.body.preheader
  %69 = call i64 @llvm.vscale.i64()
  %70 = mul i64 %69, 2
  %n.mod.vf = urem i64 %66, %70
  %n.vec = sub i64 %66, %n.mod.vf
  %ind.end = sub i64 %66, %n.vec
  %71 = call i64 @llvm.vscale.i64()
  %72 = mul i64 %71, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = sub i64 %66, %index
  %73 = add i64 %offset.idx, 0
  %74 = getelementptr ptr, ptr %add.ptr119, i64 %73
  %75 = call i64 @llvm.vscale.i64()
  %76 = mul i64 %75, 2
  %77 = mul i64 0, %76
  %78 = sub i64 1, %76
  %79 = getelementptr ptr, ptr %74, i64 %77
  %80 = getelementptr ptr, ptr %79, i64 %78
  %reverse = call <vscale x 2 x ptr> @llvm.vector.reverse.nxv2p0(<vscale x 2 x ptr> shufflevector (<vscale x 2 x ptr> insertelement (<vscale x 2 x ptr> poison, ptr @PL_sv_undef, i64 0), <vscale x 2 x ptr> poison, <vscale x 2 x i32> zeroinitializer))
  store <vscale x 2 x ptr> %reverse, ptr %80, align 8
  %index.next = add nuw i64 %index, %72
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %66, %n.vec
  br i1 %cmp.n, label %if.end150.loopexit, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %while.body.preheader
  %bc.resume.val = phi i64 [ %ind.end, %middle.block ], [ %66, %while.body.preheader ]
  br label %while.body

while.body:                                       ; preds = %scalar.ph, %while.body
  %indvars.iv = phi i64 [ %bc.resume.val, %scalar.ph ], [ %indvars.iv.next, %while.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr ptr, ptr %add.ptr119, i64 %indvars.iv
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  %tobool149.old.not = icmp eq i64 %indvars.iv.next, 0
  br i1 %tobool149.old.not, label %if.end150.loopexit, label %while.body, !llvm.loop !12

if.end150.loopexit:                               ; preds = %middle.block, %while.body
  %.pre401 = load ptr, ptr %av, align 8
  br label %if.end150

if.end150:                                        ; preds = %if.end150.loopexit, %if.then114
  %82 = phi ptr [ %.pre401, %if.end150.loopexit ], [ %61, %if.then114 ]
  %xav_max153 = getelementptr inbounds i8, ptr %82, i64 16
  %83 = load i64, ptr %xav_max153, align 8
  %sub = add nsw i64 %83, -10
  %cmp154 = icmp slt i64 %sub, %conv102
  br i1 %cmp154, label %resize, label %cleanup

if.else:                                          ; preds = %if.then107
  %tobool165.not = icmp eq ptr %54, null
  br i1 %tobool165.not, label %if.else249, label %if.then166

if.then166:                                       ; preds = %if.else
  %div = sdiv i64 %53, 5
  br label %resize

resize:                                           ; preds = %if.end150, %if.then166
  %.pn.in = phi i64 [ %div, %if.then166 ], [ %83, %if.end150 ]
  %.pn = trunc i64 %.pn.in to i32
  %newmax.0 = add i32 %key, 1
  %add172 = add i32 %newmax.0, %.pn
  %conv173 = sext i32 %add172 to i64
  %mul174 = shl nsw i64 %conv173, 3
  br label %while.cond175

while.cond175:                                    ; preds = %while.cond175, %resize
  %itmp.0 = phi i64 [ 16, %resize ], [ %add180, %while.cond175 ]
  %sub176 = add nsw i64 %itmp.0, -16
  %cmp177 = icmp ult i64 %sub176, %mul174
  %add180 = shl nsw i64 %itmp.0, 1
  br i1 %cmp177, label %while.cond175, label %while.end181

while.end181:                                     ; preds = %while.cond175
  %sub176.lcssa = phi i64 [ %sub176, %while.cond175 ]
  %div183394 = lshr exact i64 %sub176.lcssa, 3
  %84 = trunc i64 %div183394 to i32
  %conv185 = add i32 %84, -1
  %sext395 = shl i64 %sub176.lcssa, 29
  %mul188 = ashr exact i64 %sext395, 29
  %call189 = tail call ptr @Perl_safesysmalloc(i64 noundef %mul188) #7
  %85 = load ptr, ptr %av, align 8
  %xav_alloc191 = getelementptr inbounds i8, ptr %85, i64 56
  %86 = load ptr, ptr %xav_alloc191, align 8
  %xav_max193 = getelementptr inbounds i8, ptr %85, i64 16
  %87 = load i64, ptr %xav_max193, align 8
  %add194 = shl i64 %87, 3
  %mul195 = add i64 %add194, 8
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %call189, ptr align 1 %86, i64 %mul195, i1 false)
  %88 = load ptr, ptr %av, align 8
  %xav_max197 = getelementptr inbounds i8, ptr %88, i64 16
  %89 = load i64, ptr %xav_max197, align 8
  %cmp198 = icmp sgt i64 %89, 64
  %xav_alloc202 = getelementptr inbounds i8, ptr %88, i64 56
  %90 = load ptr, ptr %xav_alloc202, align 8
  br i1 %cmp198, label %if.then200, label %if.else218

if.then200:                                       ; preds = %while.end181
  %.tr = trunc i64 %89 to i32
  %91 = shl i32 %.tr, 3
  %conv207 = add i32 %91, 8
  %92 = load i32, ptr @PL_nice_chunk_size, align 4
  %cmp208 = icmp ugt i32 %conv207, %92
  br i1 %cmp208, label %if.then210, label %if.else214

if.then210:                                       ; preds = %if.then200
  %93 = load ptr, ptr @PL_nice_chunk, align 8
  %tobool211.not = icmp eq ptr %93, null
  br i1 %tobool211.not, label %if.end213, label %if.then212

if.then212:                                       ; preds = %if.then210
  tail call void @Perl_safesysfree(ptr noundef nonnull %93) #7
  br label %if.end213

if.end213:                                        ; preds = %if.then212, %if.then210
  store ptr %90, ptr @PL_nice_chunk, align 8
  store i32 %conv207, ptr @PL_nice_chunk_size, align 4
  br label %if.end221

if.else214:                                       ; preds = %if.then200
  tail call void @Perl_safesysfree(ptr noundef %90) #7
  br label %if.end221

if.else218:                                       ; preds = %while.end181
  tail call void @Perl_safesysfree(ptr noundef %90) #7
  br label %if.end221

if.end221:                                        ; preds = %if.end213, %if.else214, %if.else218
  %94 = load ptr, ptr %av, align 8
  %xav_alloc223 = getelementptr inbounds i8, ptr %94, i64 56
  store ptr %call189, ptr %xav_alloc223, align 8
  %95 = load ptr, ptr %av, align 8
  %xav_alloc225 = getelementptr inbounds i8, ptr %95, i64 56
  %96 = load ptr, ptr %xav_alloc225, align 8
  %xav_max227 = getelementptr inbounds i8, ptr %95, i64 16
  %97 = load i64, ptr %xav_max227, align 8
  %add.ptr228 = getelementptr inbounds ptr, ptr %96, i64 %97
  %98 = trunc i64 %97 to i32
  %conv234 = sub i32 %conv185, %98
  %99 = load ptr, ptr @PL_curstack, align 8
  %cmp235 = icmp eq ptr %99, %av
  br i1 %cmp235, label %if.then237, label %if.end268

if.then237:                                       ; preds = %if.end221
  %conv230 = sext i32 %conv185 to i64
  %100 = load ptr, ptr @PL_stack_sp, align 8
  %101 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast240 = ptrtoint ptr %100 to i64
  %sub.ptr.rhs.cast241 = ptrtoint ptr %101 to i64
  %sub.ptr.sub242 = sub i64 %sub.ptr.lhs.cast240, %sub.ptr.rhs.cast241
  %add.ptr244 = getelementptr inbounds i8, ptr %96, i64 %sub.ptr.sub242
  store ptr %add.ptr244, ptr @PL_stack_sp, align 8
  %102 = load ptr, ptr %av, align 8
  %xav_alloc246 = getelementptr inbounds i8, ptr %102, i64 56
  %103 = load ptr, ptr %xav_alloc246, align 8
  store ptr %103, ptr @PL_stack_base, align 8
  %add.ptr247 = getelementptr inbounds ptr, ptr %103, i64 %conv230
  store ptr %add.ptr247, ptr @PL_stack_max, align 8
  br label %if.end268

if.else249:                                       ; preds = %if.else
  %cond255 = tail call i32 @llvm.smax.i32(i32 %key, i32 3)
  %add256 = add nuw nsw i32 %cond255, 1
  %conv257 = zext nneg i32 %add256 to i64
  %mul258 = shl nuw nsw i64 %conv257, 3
  %call259 = tail call ptr @Perl_safesysmalloc(i64 noundef %mul258) #7
  %104 = load ptr, ptr %av, align 8
  %xav_alloc261 = getelementptr inbounds i8, ptr %104, i64 56
  store ptr %call259, ptr %xav_alloc261, align 8
  %105 = load ptr, ptr %av, align 8
  %xav_alloc263 = getelementptr inbounds i8, ptr %105, i64 56
  %106 = load ptr, ptr %xav_alloc263, align 8
  store ptr @PL_sv_undef, ptr %106, align 8
  br label %if.end268

if.end268:                                        ; preds = %if.end221, %if.then237, %if.else249
  %add.ptr228.pn = phi ptr [ %add.ptr228, %if.then237 ], [ %add.ptr228, %if.end221 ], [ %106, %if.else249 ]
  %tmp108.1 = phi i32 [ %conv234, %if.then237 ], [ %conv234, %if.end221 ], [ %cond255, %if.else249 ]
  %newmax.1 = phi i32 [ %conv185, %if.then237 ], [ %conv185, %if.end221 ], [ %cond255, %if.else249 ]
  %107 = load ptr, ptr %av, align 8
  %xav_flags270 = getelementptr inbounds i8, ptr %107, i64 72
  %108 = load i8, ptr %xav_flags270, align 8
  %109 = and i8 %108, 1
  %tobool273 = icmp ne i8 %109, 0
  %tobool276 = icmp ne i32 %tmp108.1, 0
  %or.cond293 = select i1 %tobool273, i1 %tobool276, i1 false
  br i1 %or.cond293, label %while.body277.preheader, label %if.end282

while.body277.preheader:                          ; preds = %if.end268
  %110 = sext i32 %tmp108.1 to i64
  %111 = call i64 @llvm.vscale.i64()
  %112 = mul i64 %111, 2
  %min.iters.check406 = icmp ult i64 %110, %112
  br i1 %min.iters.check406, label %scalar.ph405, label %vector.ph407

vector.ph407:                                     ; preds = %while.body277.preheader
  %113 = call i64 @llvm.vscale.i64()
  %114 = mul i64 %113, 2
  %n.mod.vf408 = urem i64 %110, %114
  %n.vec409 = sub i64 %110, %n.mod.vf408
  %ind.end410 = sub i64 %110, %n.vec409
  %115 = call i64 @llvm.vscale.i64()
  %116 = mul i64 %115, 2
  br label %vector.body412

vector.body412:                                   ; preds = %vector.body412, %vector.ph407
  %index413 = phi i64 [ 0, %vector.ph407 ], [ %index.next416, %vector.body412 ]
  %offset.idx414 = sub i64 %110, %index413
  %117 = add i64 %offset.idx414, 0
  %118 = getelementptr ptr, ptr %add.ptr228.pn, i64 %117
  %119 = call i64 @llvm.vscale.i64()
  %120 = mul i64 %119, 2
  %121 = mul i64 0, %120
  %122 = sub i64 1, %120
  %123 = getelementptr ptr, ptr %118, i64 %121
  %124 = getelementptr ptr, ptr %123, i64 %122
  %reverse415 = call <vscale x 2 x ptr> @llvm.vector.reverse.nxv2p0(<vscale x 2 x ptr> shufflevector (<vscale x 2 x ptr> insertelement (<vscale x 2 x ptr> poison, ptr @PL_sv_undef, i64 0), <vscale x 2 x ptr> poison, <vscale x 2 x i32> zeroinitializer))
  store <vscale x 2 x ptr> %reverse415, ptr %124, align 8
  %index.next416 = add nuw i64 %index413, %116
  %125 = icmp eq i64 %index.next416, %n.vec409
  br i1 %125, label %middle.block404, label %vector.body412, !llvm.loop !13

middle.block404:                                  ; preds = %vector.body412
  %cmp.n417 = icmp eq i64 %110, %n.vec409
  br i1 %cmp.n417, label %if.end282.loopexit, label %scalar.ph405

scalar.ph405:                                     ; preds = %middle.block404, %while.body277.preheader
  %bc.resume.val411 = phi i64 [ %ind.end410, %middle.block404 ], [ %110, %while.body277.preheader ]
  br label %while.body277

while.body277:                                    ; preds = %scalar.ph405, %while.body277
  %indvars.iv398 = phi i64 [ %bc.resume.val411, %scalar.ph405 ], [ %indvars.iv.next399, %while.body277 ]
  %indvars.iv.next399 = add nsw i64 %indvars.iv398, -1
  %arrayidx280 = getelementptr ptr, ptr %add.ptr228.pn, i64 %indvars.iv398
  store ptr @PL_sv_undef, ptr %arrayidx280, align 8
  %tobool276.old.not = icmp eq i64 %indvars.iv.next399, 0
  br i1 %tobool276.old.not, label %if.end282.loopexit, label %while.body277, !llvm.loop !14

if.end282.loopexit:                               ; preds = %middle.block404, %while.body277
  %.pre402 = load ptr, ptr %av, align 8
  br label %if.end282

if.end282:                                        ; preds = %if.end282.loopexit, %if.end268
  %126 = phi ptr [ %.pre402, %if.end282.loopexit ], [ %107, %if.end268 ]
  %xav_alloc284 = getelementptr inbounds i8, ptr %126, i64 56
  %127 = load ptr, ptr %xav_alloc284, align 8
  store ptr %127, ptr %126, align 8
  %conv287 = sext i32 %newmax.1 to i64
  %128 = load ptr, ptr %av, align 8
  %xav_max289 = getelementptr inbounds i8, ptr %128, i64 16
  store i64 %conv287, ptr %xav_max289, align 8
  br label %cleanup

cleanup:                                          ; preds = %if.end101, %if.end150, %if.end282, %if.end100
  ret void
}

declare ptr @Perl_mg_find(ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare void @Perl_push_scope() local_unnamed_addr #3

declare void @Perl_save_int(ptr noundef) local_unnamed_addr #3

declare ptr @Perl_new_stackinfo(i32 noundef signext, i32 noundef signext) local_unnamed_addr #3

declare void @Perl_markstack_grow() local_unnamed_addr #3

declare ptr @Perl_stack_grow(ptr noundef, ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare ptr @Perl_sv_2mortal(ptr noundef) local_unnamed_addr #3

declare ptr @Perl_newRV(ptr noundef) local_unnamed_addr #3

declare ptr @Perl_newSViv(i64 noundef) local_unnamed_addr #3

declare signext i32 @Perl_call_method(ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare signext i32 @PerlIO_printf(ptr noundef, ptr noundef, ...) local_unnamed_addr #3

declare ptr @Perl_PerlIO_stderr() local_unnamed_addr #3

declare void @Perl_my_exit(i32 noundef signext) local_unnamed_addr #3

declare void @Perl_free_tmps() local_unnamed_addr #3

declare void @Perl_pop_scope() local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #4

declare ptr @Perl_safesysmalloc(i64 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare void @Perl_safesysfree(ptr noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_av_fetch(ptr noundef %av, i32 noundef signext %key, i32 noundef signext %lval) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup188, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end113, label %if.then2

if.then2:                                         ; preds = %if.end
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool3.not = icmp eq ptr %call, null
  br i1 %tobool3.not, label %lor.lhs.false, label %if.then6

lor.lhs.false:                                    ; preds = %if.then2
  %call4 = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 68) #7
  %tobool5.not = icmp eq ptr %call4, null
  br i1 %tobool5.not, label %if.end113, label %if.end80

if.then6:                                         ; preds = %if.then2
  %cmp = icmp slt i32 %key, 0
  br i1 %cmp, label %if.then8, label %if.end103

if.then8:                                         ; preds = %if.then6
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %1 = load ptr, ptr %mg_obj, align 8
  %tobool9.not = icmp eq ptr %1, null
  br i1 %tobool9.not, label %cond.false, label %cond.end

cond.false:                                       ; preds = %if.then8
  %call11 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call12 = tail call ptr @Perl_sv_2mortal(ptr noundef %call11) #7
  br label %cond.end

cond.end:                                         ; preds = %if.then8, %cond.false
  %cond = phi ptr [ %call12, %cond.false ], [ %1, %if.then8 ]
  %2 = load ptr, ptr %cond, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %xmg_stash = getelementptr inbounds i8, ptr %4, i64 48
  %5 = load ptr, ptr %xmg_stash, align 8
  %call14 = tail call ptr @Perl_hv_fetch(ptr noundef %5, ptr noundef nonnull @.str.2, i32 noundef signext 16, i32 noundef signext 0) #7
  %tobool15.not = icmp eq ptr %call14, null
  br i1 %tobool15.not, label %if.then85, label %land.lhs.true16

land.lhs.true16:                                  ; preds = %cond.end
  %6 = load ptr, ptr %call14, align 8
  %7 = load ptr, ptr %6, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %7, i64 56
  %8 = load ptr, ptr %xgv_gp, align 8
  %9 = load ptr, ptr %8, align 8
  %tobool18.not = icmp eq ptr %9, null
  br i1 %tobool18.not, label %if.then85, label %cond.false20

cond.false20:                                     ; preds = %land.lhs.true16
  %sv_flags24 = getelementptr inbounds i8, ptr %9, i64 12
  %10 = load i32, ptr %sv_flags24, align 4
  %and25 = and i32 %10, 262144
  %tobool26.not = icmp eq i32 %and25, 0
  br i1 %tobool26.not, label %cond.false43, label %cond.true27

cond.true27:                                      ; preds = %cond.false20
  %11 = load ptr, ptr %9, align 8
  store ptr %11, ptr @PL_Xpv, align 8
  %tobool32.not = icmp eq ptr %11, null
  br i1 %tobool32.not, label %if.then85, label %land.lhs.true33

land.lhs.true33:                                  ; preds = %cond.true27
  %xpv_cur = getelementptr inbounds i8, ptr %11, i64 8
  %12 = load i64, ptr %xpv_cur, align 8
  %cmp34 = icmp ugt i64 %12, 1
  br i1 %cmp34, label %if.end103, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %land.lhs.true33
  %tobool37.not = icmp eq i64 %12, 0
  br i1 %tobool37.not, label %if.then85, label %land.lhs.true38

land.lhs.true38:                                  ; preds = %lor.lhs.false35
  %13 = load ptr, ptr %11, align 8
  %14 = load i8, ptr %13, align 1
  %cmp39.not = icmp eq i8 %14, 48
  br i1 %cmp39.not, label %if.then85, label %if.end103

cond.false43:                                     ; preds = %cond.false20
  %and48 = and i32 %10, 65536
  %tobool49.not = icmp eq i32 %and48, 0
  br i1 %tobool49.not, label %cond.false57, label %cond.true50

cond.true50:                                      ; preds = %cond.false43
  %15 = load ptr, ptr %9, align 8
  %xiv_iv = getelementptr inbounds i8, ptr %15, i64 24
  %16 = load i64, ptr %xiv_iv, align 8
  %cmp55.not = icmp eq i64 %16, 0
  br i1 %cmp55.not, label %if.then85, label %if.end103

cond.false57:                                     ; preds = %cond.false43
  %and62 = and i32 %10, 131072
  %tobool63.not = icmp eq i32 %and62, 0
  br i1 %tobool63.not, label %cond.false71, label %cond.true64

cond.true64:                                      ; preds = %cond.false57
  %17 = load ptr, ptr %9, align 8
  %xnv_nv = getelementptr inbounds i8, ptr %17, i64 32
  %18 = load double, ptr %xnv_nv, align 8
  %cmp69 = fcmp une double %18, 0.000000e+00
  br i1 %cmp69, label %if.end103, label %if.then85

cond.false71:                                     ; preds = %cond.false57
  %call75 = tail call zeroext i8 @Perl_sv_2bool(ptr noundef nonnull %9) #7
  %tobool77.not = icmp eq i8 %call75, 0
  br i1 %tobool77.not, label %if.then85, label %if.end103

if.end80:                                         ; preds = %lor.lhs.false
  %cmp249 = icmp slt i32 %key, 0
  br i1 %cmp249, label %if.then85, label %if.end103

if.then85:                                        ; preds = %land.lhs.true38, %lor.lhs.false35, %cond.true27, %cond.true50, %cond.true64, %cond.false71, %land.lhs.true16, %cond.end, %if.end80
  %19 = load i32, ptr %sv_flags, align 4
  %and87 = and i32 %19, 32768
  %tobool88.not = icmp eq i32 %and87, 0
  br i1 %tobool88.not, label %cond.false92, label %cond.true89

cond.true89:                                      ; preds = %if.then85
  %call90 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cond.end94

cond.false92:                                     ; preds = %if.then85
  %20 = load ptr, ptr %av, align 8
  %xav_fill = getelementptr inbounds i8, ptr %20, i64 8
  %21 = load i64, ptr %xav_fill, align 8
  %22 = trunc i64 %21 to i32
  br label %cond.end94

cond.end94:                                       ; preds = %cond.false92, %cond.true89
  %cond95 = phi i32 [ %call90, %cond.true89 ], [ %22, %cond.false92 ]
  %23 = add nsw i32 %key, 1
  %conv98 = add i32 %23, %cond95
  %cmp99 = icmp slt i32 %conv98, 0
  br i1 %cmp99, label %cleanup188, label %if.end103

if.end103:                                        ; preds = %if.then6, %land.lhs.true33, %land.lhs.true38, %cond.false71, %cond.true64, %cond.true50, %cond.end94, %if.end80
  %key.addr.0 = phi i32 [ %conv98, %cond.end94 ], [ %key, %if.end80 ], [ %key, %cond.true50 ], [ %key, %cond.true64 ], [ %key, %cond.false71 ], [ %key, %land.lhs.true38 ], [ %key, %land.lhs.true33 ], [ %key, %if.then6 ]
  %call104 = tail call ptr @Perl_sv_newmortal() #7
  %call105 = tail call zeroext i8 @Perl_sv_upgrade(ptr noundef %call104, i32 noundef signext 9) #7
  %call106 = tail call signext i32 @Perl_mg_copy(ptr noundef nonnull %av, ptr noundef %call104, ptr noundef null, i32 noundef signext %key.addr.0) #7
  %24 = load ptr, ptr %call104, align 8
  %xlv_type = getelementptr inbounds i8, ptr %24, i64 80
  store i8 116, ptr %xlv_type, align 8
  %25 = load ptr, ptr %call104, align 8
  %xlv_targ = getelementptr inbounds i8, ptr %25, i64 72
  store ptr %call104, ptr %xlv_targ, align 8
  %26 = load ptr, ptr %call104, align 8
  %xlv_targ110 = getelementptr inbounds i8, ptr %26, i64 72
  br label %cleanup188

if.end113:                                        ; preds = %lor.lhs.false, %if.end
  %cmp114 = icmp slt i32 %key, 0
  br i1 %cmp114, label %if.then116, label %if.end136

if.then116:                                       ; preds = %if.end113
  %27 = load i32, ptr %sv_flags, align 4
  %and118 = and i32 %27, 32768
  %tobool119.not = icmp eq i32 %and118, 0
  br i1 %tobool119.not, label %cond.false123, label %cond.true120

cond.true120:                                     ; preds = %if.then116
  %call121 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cond.end126

cond.false123:                                    ; preds = %if.then116
  %28 = load ptr, ptr %av, align 8
  %xav_fill125 = getelementptr inbounds i8, ptr %28, i64 8
  %29 = load i64, ptr %xav_fill125, align 8
  %30 = trunc i64 %29 to i32
  br label %cond.end126

cond.end126:                                      ; preds = %cond.false123, %cond.true120
  %cond127 = phi i32 [ %call121, %cond.true120 ], [ %30, %cond.false123 ]
  %31 = add nsw i32 %key, 1
  %conv131 = add i32 %31, %cond127
  %cmp132 = icmp slt i32 %conv131, 0
  br i1 %cmp132, label %cleanup188, label %if.end136

if.end136:                                        ; preds = %cond.end126, %if.end113
  %key.addr.4 = phi i32 [ %conv131, %cond.end126 ], [ %key, %if.end113 ]
  %conv137 = zext nneg i32 %key.addr.4 to i64
  %32 = load ptr, ptr %av, align 8
  %xav_fill139 = getelementptr inbounds i8, ptr %32, i64 8
  %33 = load i64, ptr %xav_fill139, align 8
  %cmp140 = icmp slt i64 %33, %conv137
  br i1 %cmp140, label %if.then142, label %if.end148

if.then142:                                       ; preds = %if.end136
  %tobool143.not = icmp eq i32 %lval, 0
  br i1 %tobool143.not, label %cleanup188, label %if.end145

if.end145:                                        ; preds = %if.then142
  %call146 = tail call ptr @Perl_newSV(i64 noundef 0) #7
  %call147 = tail call ptr @Perl_av_store(ptr noundef nonnull %av, i32 noundef signext %key.addr.4, ptr noundef %call146)
  br label %cleanup188

if.end148:                                        ; preds = %if.end136
  %34 = load ptr, ptr %32, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %34, i64 %conv137
  %35 = load ptr, ptr %arrayidx, align 8
  %cmp150 = icmp eq ptr %35, @PL_sv_undef
  br i1 %cmp150, label %emptyness, label %if.else

emptyness:                                        ; preds = %if.end148, %if.then177
  %tobool153.not = icmp eq i32 %lval, 0
  br i1 %tobool153.not, label %cleanup188, label %if.then154

if.then154:                                       ; preds = %emptyness
  %call155 = tail call ptr @Perl_newSV(i64 noundef 0) #7
  %call156 = tail call ptr @Perl_av_store(ptr noundef nonnull %av, i32 noundef signext %key.addr.4, ptr noundef %call155)
  br label %cleanup188

if.else:                                          ; preds = %if.end148
  %xav_flags = getelementptr inbounds i8, ptr %32, i64 72
  %36 = load i8, ptr %xav_flags, align 8
  %37 = and i8 %36, 2
  %tobool161.not = icmp eq i8 %37, 0
  br i1 %tobool161.not, label %cleanup188, label %land.lhs.true162

land.lhs.true162:                                 ; preds = %if.else
  %tobool167.not = icmp eq ptr %35, null
  br i1 %tobool167.not, label %if.then177, label %lor.lhs.false168

lor.lhs.false168:                                 ; preds = %land.lhs.true162
  %sv_flags173 = getelementptr inbounds i8, ptr %35, i64 12
  %38 = load i32, ptr %sv_flags173, align 4
  %and174 = and i32 %38, 255
  %cmp175 = icmp eq i32 %and174, 255
  br i1 %cmp175, label %if.then177, label %cleanup188

if.then177:                                       ; preds = %lor.lhs.false168, %land.lhs.true162
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  br label %emptyness

cleanup188:                                       ; preds = %if.end103, %cond.end94, %lor.lhs.false168, %if.else, %emptyness, %if.then142, %cond.end126, %entry, %if.then154, %if.end145
  %retval.2 = phi ptr [ %call147, %if.end145 ], [ %call156, %if.then154 ], [ null, %entry ], [ null, %cond.end126 ], [ null, %if.then142 ], [ null, %emptyness ], [ %arrayidx, %if.else ], [ %arrayidx, %lor.lhs.false168 ], [ null, %cond.end94 ], [ %xlv_targ110, %if.end103 ]
  ret ptr %retval.2
}

declare ptr @Perl_hv_fetch(ptr noundef, ptr noundef, i32 noundef signext, i32 noundef signext) local_unnamed_addr #3

declare zeroext i8 @Perl_sv_2bool(ptr noundef) local_unnamed_addr #3

declare signext i32 @Perl_mg_size(ptr noundef) local_unnamed_addr #3

declare ptr @Perl_sv_newmortal() local_unnamed_addr #3

declare zeroext i8 @Perl_sv_upgrade(ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare signext i32 @Perl_mg_copy(ptr noundef, ptr noundef, ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare ptr @Perl_newSV(i64 noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local noundef ptr @Perl_av_store(ptr noundef %av, i32 noundef signext %key, ptr noundef %val) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup244, label %if.end

if.end:                                           ; preds = %entry
  %tobool1.not = icmp eq ptr %val, null
  %spec.store.select = select i1 %tobool1.not, ptr @PL_sv_undef, ptr %val
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool4.not = icmp eq i32 %and, 0
  br i1 %tobool4.not, label %if.end109, label %if.then5

if.then5:                                         ; preds = %if.end
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool6.not = icmp eq ptr %call, null
  br i1 %tobool6.not, label %if.then5.if.end109_crit_edge, label %if.then7

if.then5.if.end109_crit_edge:                     ; preds = %if.then5
  %.pre326.pre = load i32, ptr %sv_flags, align 4
  br label %if.end109

if.then7:                                         ; preds = %if.then5
  %cmp = icmp slt i32 %key, 0
  br i1 %cmp, label %if.then8, label %if.end99

if.then8:                                         ; preds = %if.then7
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %1 = load ptr, ptr %mg_obj, align 8
  %tobool9.not = icmp eq ptr %1, null
  br i1 %tobool9.not, label %cond.false, label %cond.end

cond.false:                                       ; preds = %if.then8
  %call11 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call12 = tail call ptr @Perl_sv_2mortal(ptr noundef %call11) #7
  br label %cond.end

cond.end:                                         ; preds = %if.then8, %cond.false
  %cond = phi ptr [ %call12, %cond.false ], [ %1, %if.then8 ]
  %2 = load ptr, ptr %cond, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %xmg_stash = getelementptr inbounds i8, ptr %4, i64 48
  %5 = load ptr, ptr %xmg_stash, align 8
  %call14 = tail call ptr @Perl_hv_fetch(ptr noundef %5, ptr noundef nonnull @.str.2, i32 noundef signext 16, i32 noundef signext 0) #7
  %tobool15.not = icmp eq ptr %call14, null
  br i1 %tobool15.not, label %if.then79, label %land.lhs.true

land.lhs.true:                                    ; preds = %cond.end
  %6 = load ptr, ptr %call14, align 8
  %7 = load ptr, ptr %6, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %7, i64 56
  %8 = load ptr, ptr %xgv_gp, align 8
  %9 = load ptr, ptr %8, align 8
  %tobool17.not = icmp eq ptr %9, null
  br i1 %tobool17.not, label %if.then79, label %cond.false19

cond.false19:                                     ; preds = %land.lhs.true
  %sv_flags23 = getelementptr inbounds i8, ptr %9, i64 12
  %10 = load i32, ptr %sv_flags23, align 4
  %and24 = and i32 %10, 262144
  %tobool25.not = icmp eq i32 %and24, 0
  br i1 %tobool25.not, label %cond.false41, label %cond.true26

cond.true26:                                      ; preds = %cond.false19
  %11 = load ptr, ptr %9, align 8
  store ptr %11, ptr @PL_Xpv, align 8
  %tobool31.not = icmp eq ptr %11, null
  br i1 %tobool31.not, label %if.then79, label %land.lhs.true32

land.lhs.true32:                                  ; preds = %cond.true26
  %xpv_cur = getelementptr inbounds i8, ptr %11, i64 8
  %12 = load i64, ptr %xpv_cur, align 8
  %cmp33 = icmp ugt i64 %12, 1
  br i1 %cmp33, label %if.end99, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true32
  %tobool35.not = icmp eq i64 %12, 0
  br i1 %tobool35.not, label %if.then79, label %land.lhs.true36

land.lhs.true36:                                  ; preds = %lor.lhs.false
  %13 = load ptr, ptr %11, align 8
  %14 = load i8, ptr %13, align 1
  %cmp37.not = icmp eq i8 %14, 48
  br i1 %cmp37.not, label %if.then79, label %if.end99

cond.false41:                                     ; preds = %cond.false19
  %and46 = and i32 %10, 65536
  %tobool47.not = icmp eq i32 %and46, 0
  br i1 %tobool47.not, label %cond.false55, label %cond.true48

cond.true48:                                      ; preds = %cond.false41
  %15 = load ptr, ptr %9, align 8
  %xiv_iv = getelementptr inbounds i8, ptr %15, i64 24
  %16 = load i64, ptr %xiv_iv, align 8
  %cmp53.not = icmp eq i64 %16, 0
  br i1 %cmp53.not, label %if.then79, label %if.end99

cond.false55:                                     ; preds = %cond.false41
  %and60 = and i32 %10, 131072
  %tobool61.not = icmp eq i32 %and60, 0
  br i1 %tobool61.not, label %cond.false69, label %cond.true62

cond.true62:                                      ; preds = %cond.false55
  %17 = load ptr, ptr %9, align 8
  %xnv_nv = getelementptr inbounds i8, ptr %17, i64 32
  %18 = load double, ptr %xnv_nv, align 8
  %cmp67 = fcmp une double %18, 0.000000e+00
  br i1 %cmp67, label %if.end99, label %if.then79

cond.false69:                                     ; preds = %cond.false55
  %call73 = tail call zeroext i8 @Perl_sv_2bool(ptr noundef nonnull %9) #7
  %tobool75.not = icmp eq i8 %call73, 0
  br i1 %tobool75.not, label %if.then79, label %if.end99

if.then79:                                        ; preds = %cond.end, %cond.true48, %cond.true62, %cond.false69, %land.lhs.true, %land.lhs.true36, %lor.lhs.false, %cond.true26
  %19 = load i32, ptr %sv_flags, align 4
  %and81 = and i32 %19, 32768
  %tobool82.not = icmp eq i32 %and81, 0
  br i1 %tobool82.not, label %cond.false86, label %cond.true83

cond.true83:                                      ; preds = %if.then79
  %call84 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cleanup

cond.false86:                                     ; preds = %if.then79
  %20 = load ptr, ptr %av, align 8
  %xav_fill = getelementptr inbounds i8, ptr %20, i64 8
  %21 = load i64, ptr %xav_fill, align 8
  %22 = trunc i64 %21 to i32
  br label %cleanup

cleanup:                                          ; preds = %cond.true83, %cond.false86
  %cond89 = phi i32 [ %call84, %cond.true83 ], [ %22, %cond.false86 ]
  %23 = add nsw i32 %key, 1
  %conv92 = add i32 %23, %cond89
  %cmp93 = icmp sgt i32 %conv92, -1
  br i1 %cmp93, label %if.end99, label %cleanup244

if.end99:                                         ; preds = %cond.true48, %cond.true62, %cond.false69, %land.lhs.true36, %land.lhs.true32, %cleanup, %if.then7
  %key.addr.2 = phi i32 [ %conv92, %cleanup ], [ %key, %if.then7 ], [ %key, %land.lhs.true32 ], [ %key, %land.lhs.true36 ], [ %key, %cond.false69 ], [ %key, %cond.true62 ], [ %key, %cond.true48 ]
  %cmp100.not = icmp eq ptr %spec.store.select, @PL_sv_undef
  br i1 %cmp100.not, label %cleanup244, label %if.then102

if.then102:                                       ; preds = %if.end99
  %call103 = tail call signext i32 @Perl_mg_copy(ptr noundef nonnull %av, ptr noundef nonnull %spec.store.select, ptr noundef null, i32 noundef signext %key.addr.2) #7
  br label %cleanup244

if.end109:                                        ; preds = %if.then5.if.end109_crit_edge, %if.end
  %.pre326 = phi i32 [ %.pre326.pre, %if.then5.if.end109_crit_edge ], [ %0, %if.end ]
  %cmp110 = icmp slt i32 %key, 0
  br i1 %cmp110, label %if.then112, label %if.end132

if.then112:                                       ; preds = %if.end109
  %and114 = and i32 %.pre326, 32768
  %tobool115.not = icmp eq i32 %and114, 0
  br i1 %tobool115.not, label %cond.false119, label %cond.true116

cond.true116:                                     ; preds = %if.then112
  %call117 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cond.end122

cond.false119:                                    ; preds = %if.then112
  %24 = load ptr, ptr %av, align 8
  %xav_fill121 = getelementptr inbounds i8, ptr %24, i64 8
  %25 = load i64, ptr %xav_fill121, align 8
  %26 = trunc i64 %25 to i32
  br label %cond.end122

cond.end122:                                      ; preds = %cond.false119, %cond.true116
  %cond123 = phi i32 [ %call117, %cond.true116 ], [ %26, %cond.false119 ]
  %27 = add nsw i32 %key, 1
  %conv127 = add i32 %27, %cond123
  %cmp128 = icmp slt i32 %conv127, 0
  br i1 %cmp128, label %cleanup244, label %cond.end122.if.end132_crit_edge

cond.end122.if.end132_crit_edge:                  ; preds = %cond.end122
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end132

if.end132:                                        ; preds = %cond.end122.if.end132_crit_edge, %if.end109
  %28 = phi i32 [ %.pre, %cond.end122.if.end132_crit_edge ], [ %.pre326, %if.end109 ]
  %key.addr.5 = phi i32 [ %conv127, %cond.end122.if.end132_crit_edge ], [ %key, %if.end109 ]
  %and134 = and i32 %28, 8388608
  %tobool135.not = icmp eq i32 %and134, 0
  br i1 %tobool135.not, label %if.end152, label %land.lhs.true136

land.lhs.true136:                                 ; preds = %if.end132
  %conv137 = zext nneg i32 %key.addr.5 to i64
  %and139 = and i32 %28, 32768
  %tobool140.not = icmp eq i32 %and139, 0
  br i1 %tobool140.not, label %cond.false144, label %cond.true141

cond.true141:                                     ; preds = %land.lhs.true136
  %call142 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  %conv143 = sext i32 %call142 to i64
  br label %cond.end147

cond.false144:                                    ; preds = %land.lhs.true136
  %29 = load ptr, ptr %av, align 8
  %xav_fill146 = getelementptr inbounds i8, ptr %29, i64 8
  %30 = load i64, ptr %xav_fill146, align 8
  br label %cond.end147

cond.end147:                                      ; preds = %cond.false144, %cond.true141
  %cond148 = phi i64 [ %conv143, %cond.true141 ], [ %30, %cond.false144 ]
  %cmp149.not = icmp sgt i64 %cond148, %conv137
  br i1 %cmp149.not, label %if.end152, label %if.then151

if.then151:                                       ; preds = %cond.end147
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  br label %if.end152

if.end152:                                        ; preds = %if.then151, %cond.end147, %if.end132
  %31 = load ptr, ptr %av, align 8
  %xav_flags = getelementptr inbounds i8, ptr %31, i64 72
  %32 = load i8, ptr %xav_flags, align 8
  %33 = and i8 %32, 3
  %or.cond.not = icmp eq i8 %33, 2
  br i1 %or.cond.not, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end152
  tail call void @Perl_av_reify(ptr noundef nonnull %av)
  %.pre327 = load ptr, ptr %av, align 8
  br label %if.end164

if.end164:                                        ; preds = %if.then163, %if.end152
  %34 = phi ptr [ %.pre327, %if.then163 ], [ %31, %if.end152 ]
  %conv165 = zext nneg i32 %key.addr.5 to i64
  %xav_max = getelementptr inbounds i8, ptr %34, i64 16
  %35 = load i64, ptr %xav_max, align 8
  %cmp167 = icmp slt i64 %35, %conv165
  br i1 %cmp167, label %if.then169, label %if.end170

if.then169:                                       ; preds = %if.end164
  tail call void @Perl_av_extend(ptr noundef nonnull %av, i32 noundef signext %key.addr.5)
  %.pre328 = load ptr, ptr %av, align 8
  br label %if.end170

if.end170:                                        ; preds = %if.then169, %if.end164
  %36 = phi ptr [ %.pre328, %if.then169 ], [ %34, %if.end164 ]
  %37 = load ptr, ptr %36, align 8
  %xav_fill173 = getelementptr inbounds i8, ptr %36, i64 8
  %38 = load i64, ptr %xav_fill173, align 8
  %cmp175 = icmp slt i64 %38, %conv165
  %xav_flags179 = getelementptr inbounds i8, ptr %36, i64 72
  %39 = load i8, ptr %xav_flags179, align 8
  %40 = and i8 %39, 1
  %tobool182.not = icmp eq i8 %40, 0
  br i1 %cmp175, label %if.then177, label %if.else

if.then177:                                       ; preds = %if.end170
  br i1 %tobool182.not, label %if.then183, label %if.end199

if.then183:                                       ; preds = %if.then177
  %41 = load ptr, ptr @PL_curstack, align 8
  %cmp184 = icmp eq ptr %41, %av
  br i1 %cmp184, label %land.lhs.true186, label %if.end191

land.lhs.true186:                                 ; preds = %if.then183
  %42 = load ptr, ptr @PL_stack_sp, align 8
  %43 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %42 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %43 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %cmp188 = icmp slt i64 %sub.ptr.div, %conv165
  br i1 %cmp188, label %if.then190, label %if.end191

if.then190:                                       ; preds = %land.lhs.true186
  %add.ptr = getelementptr inbounds ptr, ptr %43, i64 %conv165
  store ptr %add.ptr, ptr @PL_stack_sp, align 8
  %.pre329.pre = load ptr, ptr %av, align 8
  %xav_fill193.phi.trans.insert.phi.trans.insert = getelementptr inbounds i8, ptr %.pre329.pre, i64 8
  %.pre330.pre = load i64, ptr %xav_fill193.phi.trans.insert.phi.trans.insert, align 8
  br label %if.end191

if.end191:                                        ; preds = %if.then190, %land.lhs.true186, %if.then183
  %.pre330 = phi i64 [ %.pre330.pre, %if.then190 ], [ %38, %land.lhs.true186 ], [ %38, %if.then183 ]
  %.pre329 = phi ptr [ %.pre329.pre, %if.then190 ], [ %36, %land.lhs.true186 ], [ %36, %if.then183 ]
  br label %do.body

do.body:                                          ; preds = %do.body, %if.end191
  %44 = phi i64 [ %47, %do.body ], [ %.pre330, %if.end191 ]
  %45 = phi ptr [ %46, %do.body ], [ %.pre329, %if.end191 ]
  %xav_fill193 = getelementptr inbounds i8, ptr %45, i64 8
  %inc = add nsw i64 %44, 1
  store i64 %inc, ptr %xav_fill193, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %37, i64 %inc
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  %46 = load ptr, ptr %av, align 8
  %xav_fill195 = getelementptr inbounds i8, ptr %46, i64 8
  %47 = load i64, ptr %xav_fill195, align 8
  %cmp197 = icmp slt i64 %47, %conv165
  br i1 %cmp197, label %do.body, label %if.end199

if.end199:                                        ; preds = %do.body, %if.then177
  %48 = phi ptr [ %36, %if.then177 ], [ %46, %do.body ]
  %xav_fill202 = getelementptr inbounds i8, ptr %48, i64 8
  store i64 %conv165, ptr %xav_fill202, align 8
  br label %if.end211

if.else:                                          ; preds = %if.end170
  br i1 %tobool182.not, label %if.end211, label %if.then208

if.then208:                                       ; preds = %if.else
  %arrayidx209 = getelementptr inbounds ptr, ptr %37, i64 %conv165
  %49 = load ptr, ptr %arrayidx209, align 8
  tail call void @Perl_sv_free(ptr noundef %49) #7
  br label %if.end211

if.end211:                                        ; preds = %if.else, %if.then208, %if.end199
  %arrayidx213 = getelementptr inbounds ptr, ptr %37, i64 %conv165
  store ptr %spec.store.select, ptr %arrayidx213, align 8
  %50 = load i32, ptr %sv_flags, align 4
  %and215 = and i32 %50, 16384
  %tobool216.not = icmp eq i32 %and215, 0
  br i1 %tobool216.not, label %cleanup244, label %if.then217

if.then217:                                       ; preds = %if.end211
  %cmp218.not = icmp eq ptr %spec.store.select, @PL_sv_undef
  br i1 %cmp218.not, label %if.end239, label %if.then220

if.then220:                                       ; preds = %if.then217
  %51 = load ptr, ptr %av, align 8
  %xmg_magic = getelementptr inbounds i8, ptr %51, i64 40
  %52 = load ptr, ptr %xmg_magic, align 8
  %mg_type = getelementptr inbounds i8, ptr %52, i64 18
  %53 = load i8, ptr %mg_type, align 2
  %54 = add i8 %53, -65
  %or.cond321 = icmp ult i8 %54, 26
  %narrow = add nuw nsw i8 %53, 32
  %spec.select325 = select i1 %or.cond321, i8 %narrow, i8 %53
  %cond238 = zext i8 %spec.select325 to i32
  tail call void @Perl_sv_magic(ptr noundef nonnull %spec.store.select, ptr noundef nonnull %av, i32 noundef signext %cond238, ptr noundef null, i32 noundef signext %key.addr.5) #7
  br label %if.end239

if.end239:                                        ; preds = %if.then220, %if.then217
  %call240 = tail call signext i32 @Perl_mg_set(ptr noundef nonnull %av) #7
  br label %cleanup244

cleanup244:                                       ; preds = %cleanup, %if.then102, %if.end99, %if.end211, %if.end239, %cond.end122, %entry
  %retval.2 = phi ptr [ null, %entry ], [ null, %cond.end122 ], [ %arrayidx213, %if.end239 ], [ %arrayidx213, %if.end211 ], [ null, %if.end99 ], [ null, %if.then102 ], [ null, %cleanup ]
  ret ptr %retval.2
}

declare void @Perl_croak(ptr noundef, ...) local_unnamed_addr #3

declare void @Perl_sv_free(ptr noundef) local_unnamed_addr #3

declare void @Perl_sv_magic(ptr noundef, ptr noundef, i32 noundef signext, ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare signext i32 @Perl_mg_set(ptr noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local noundef ptr @Perl_newAV() local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_newSV(i64 noundef 0) #7
  %call1 = tail call zeroext i8 @Perl_sv_upgrade(ptr noundef %call, i32 noundef signext 10) #7
  %0 = load ptr, ptr %call, align 8
  %xav_flags = getelementptr inbounds i8, ptr %0, i64 72
  %1 = load i8, ptr %xav_flags, align 8
  %2 = or i8 %1, 1
  store i8 %2, ptr %xav_flags, align 8
  %3 = load ptr, ptr %call, align 8
  %xav_alloc = getelementptr inbounds i8, ptr %3, i64 56
  store ptr null, ptr %xav_alloc, align 8
  %4 = load ptr, ptr %call, align 8
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %call, align 8
  %xav_fill = getelementptr inbounds i8, ptr %5, i64 8
  store i64 -1, ptr %xav_fill, align 8
  %6 = load ptr, ptr %call, align 8
  %xav_max = getelementptr inbounds i8, ptr %6, i64 16
  store i64 -1, ptr %xav_max, align 8
  ret ptr %call
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local noundef ptr @Perl_av_make(i32 noundef signext %size, ptr nocapture noundef readonly %strp) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_newSV(i64 noundef 0) #7
  %call1 = tail call zeroext i8 @Perl_sv_upgrade(ptr noundef %call, i32 noundef signext 10) #7
  %0 = load ptr, ptr %call, align 8
  %xav_flags = getelementptr inbounds i8, ptr %0, i64 72
  store i8 1, ptr %xav_flags, align 8
  %tobool.not = icmp eq i32 %size, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %conv = sext i32 %size to i64
  %mul = shl nsw i64 %conv, 3
  %call2 = tail call ptr @Perl_safesysmalloc(i64 noundef %mul) #7
  %1 = load ptr, ptr %call, align 8
  %xav_alloc = getelementptr inbounds i8, ptr %1, i64 56
  store ptr %call2, ptr %xav_alloc, align 8
  %2 = load ptr, ptr %call, align 8
  store ptr %call2, ptr %2, align 8
  %sub = add nsw i32 %size, -1
  %conv5 = sext i32 %sub to i64
  %3 = load ptr, ptr %call, align 8
  %xav_fill = getelementptr inbounds i8, ptr %3, i64 8
  store i64 %conv5, ptr %xav_fill, align 8
  %4 = load ptr, ptr %call, align 8
  %xav_max = getelementptr inbounds i8, ptr %4, i64 16
  store i64 %conv5, ptr %xav_max, align 8
  %cmp31 = icmp sgt i32 %size, 0
  br i1 %cmp31, label %for.body.preheader, label %if.end

for.body.preheader:                               ; preds = %if.then
  %wide.trip.count = zext nneg i32 %size to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %strp.addr.033 = phi ptr [ %strp, %for.body.preheader ], [ %incdec.ptr, %for.body ]
  %call11 = tail call ptr @Perl_newSV(i64 noundef 0) #7
  %arrayidx = getelementptr inbounds ptr, ptr %call2, i64 %indvars.iv
  store ptr %call11, ptr %arrayidx, align 8
  %5 = load ptr, ptr %strp.addr.033, align 8
  tail call void @Perl_sv_setsv_flags(ptr noundef %call11, ptr noundef %5, i32 noundef signext 2) #7
  %incdec.ptr = getelementptr inbounds i8, ptr %strp.addr.033, i64 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %if.end, label %for.body

if.end:                                           ; preds = %for.body, %if.then, %entry
  ret ptr %call
}

declare void @Perl_sv_setsv_flags(ptr noundef, ptr noundef, i32 noundef signext) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local noundef ptr @Perl_av_fake(i32 noundef signext %size, ptr nocapture noundef readonly %strp) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_newSV(i64 noundef 0) #7
  %call1 = tail call zeroext i8 @Perl_sv_upgrade(ptr noundef %call, i32 noundef signext 10) #7
  %add = add nsw i32 %size, 1
  %conv = sext i32 %add to i64
  %mul = shl nsw i64 %conv, 3
  %call2 = tail call ptr @Perl_safesysmalloc(i64 noundef %mul) #7
  %0 = load ptr, ptr %call, align 8
  %xav_alloc = getelementptr inbounds i8, ptr %0, i64 56
  store ptr %call2, ptr %xav_alloc, align 8
  %conv3 = sext i32 %size to i64
  %mul4 = shl nsw i64 %conv3, 3
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 1 %call2, ptr align 1 %strp, i64 %mul4, i1 false)
  %1 = load ptr, ptr %call, align 8
  %xav_flags = getelementptr inbounds i8, ptr %1, i64 72
  store i8 2, ptr %xav_flags, align 8
  %2 = load ptr, ptr %call, align 8
  store ptr %call2, ptr %2, align 8
  %sub = add nsw i32 %size, -1
  %conv7 = sext i32 %sub to i64
  %3 = load ptr, ptr %call, align 8
  %xav_fill = getelementptr inbounds i8, ptr %3, i64 8
  store i64 %conv7, ptr %xav_fill, align 8
  %4 = load ptr, ptr %call, align 8
  %xav_max = getelementptr inbounds i8, ptr %4, i64 16
  store i64 %conv7, ptr %xav_max, align 8
  %tobool.not26 = icmp eq i32 %size, 0
  br i1 %tobool.not26, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %size.addr.028 = phi i32 [ %dec, %while.body ], [ %size, %entry ]
  %strp.addr.027 = phi ptr [ %incdec.ptr, %while.body ], [ %strp, %entry ]
  %dec = add nsw i32 %size.addr.028, -1
  %5 = load ptr, ptr %strp.addr.027, align 8
  %sv_flags = getelementptr inbounds i8, ptr %5, i64 12
  %6 = load i32, ptr %sv_flags, align 4
  %and = and i32 %6, -2049
  store i32 %and, ptr %sv_flags, align 4
  %incdec.ptr = getelementptr inbounds i8, ptr %strp.addr.027, i64 8
  %tobool.not = icmp eq i32 %dec, 0
  br i1 %tobool.not, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret ptr %call
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local void @Perl_av_clear(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 8388608
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %1 = phi i32 [ %.pre, %if.then2 ], [ %0, %if.end ]
  %and5 = and i32 %1, 32768
  %tobool6.not = icmp eq i32 %and5, 0
  br i1 %tobool6.not, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end3
  %call = tail call signext i32 @Perl_mg_clear(ptr noundef nonnull %av) #7
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end3
  %2 = load ptr, ptr %av, align 8
  %xav_max = getelementptr inbounds i8, ptr %2, i64 16
  %3 = load i64, ptr %xav_max, align 8
  %cmp = icmp slt i64 %3, 0
  br i1 %cmp, label %cleanup, label %if.end10

if.end10:                                         ; preds = %if.end8
  %xav_flags = getelementptr inbounds i8, ptr %2, i64 72
  %4 = load i8, ptr %xav_flags, align 8
  %5 = and i8 %4, 1
  %tobool13.not = icmp eq i8 %5, 0
  br i1 %tobool13.not, label %if.end21, label %if.then14

if.then14:                                        ; preds = %if.end10
  %6 = load ptr, ptr %2, align 8
  %xav_fill = getelementptr inbounds i8, ptr %2, i64 8
  %7 = load i64, ptr %xav_fill, align 8
  %8 = trunc i64 %7 to i32
  %conv17 = add i32 %8, 1
  %tobool18.not56 = icmp eq i32 %conv17, 0
  br i1 %tobool18.not56, label %if.end21, label %while.body.preheader

while.body.preheader:                             ; preds = %if.then14
  %9 = sext i32 %conv17 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %indvars.iv = phi i64 [ %9, %while.body.preheader ], [ %indvars.iv.next, %while.body ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds ptr, ptr %6, i64 %indvars.iv.next
  %10 = load ptr, ptr %arrayidx, align 8
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  tail call void @Perl_sv_free(ptr noundef %10) #7
  %tobool18.not = icmp eq i64 %indvars.iv.next, 0
  br i1 %tobool18.not, label %if.end21.loopexit, label %while.body

if.end21.loopexit:                                ; preds = %while.body
  %.pre58 = load ptr, ptr %av, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.end21.loopexit, %if.then14, %if.end10
  %11 = phi ptr [ %.pre58, %if.end21.loopexit ], [ %2, %if.then14 ], [ %2, %if.end10 ]
  %12 = load ptr, ptr %11, align 8
  %xav_alloc = getelementptr inbounds i8, ptr %11, i64 56
  %13 = load ptr, ptr %xav_alloc, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %12 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %13 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %14 = and i64 %sub.ptr.sub, 34359738360
  %tobool26.not = icmp eq i64 %14, 0
  br i1 %tobool26.not, label %if.end35, label %if.then27

if.then27:                                        ; preds = %if.end21
  %sext = shl i64 %sub.ptr.sub, 29
  %conv28 = ashr i64 %sext, 32
  %xav_max30 = getelementptr inbounds i8, ptr %11, i64 16
  %15 = load i64, ptr %xav_max30, align 8
  %add31 = add nsw i64 %15, %conv28
  store i64 %add31, ptr %xav_max30, align 8
  %16 = load ptr, ptr %av, align 8
  %xav_alloc33 = getelementptr inbounds i8, ptr %16, i64 56
  %17 = load ptr, ptr %xav_alloc33, align 8
  store ptr %17, ptr %16, align 8
  %.pre59 = load ptr, ptr %av, align 8
  br label %if.end35

if.end35:                                         ; preds = %if.then27, %if.end21
  %18 = phi ptr [ %.pre59, %if.then27 ], [ %11, %if.end21 ]
  %xav_fill37 = getelementptr inbounds i8, ptr %18, i64 8
  store i64 -1, ptr %xav_fill37, align 8
  br label %cleanup

cleanup:                                          ; preds = %if.end8, %entry, %if.end35
  ret void
}

declare signext i32 @Perl_mg_clear(ptr noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local void @Perl_av_undef(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end4, label %cond.true

cond.true:                                        ; preds = %if.end
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool2.not = icmp eq ptr %call, null
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %cond.true
  tail call void @Perl_av_fill(ptr noundef nonnull %av, i32 noundef signext -1)
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then3, %cond.true
  %1 = load ptr, ptr %av, align 8
  %xav_flags = getelementptr inbounds i8, ptr %1, i64 72
  %2 = load i8, ptr %xav_flags, align 8
  %3 = and i8 %2, 1
  %tobool6.not = icmp eq i8 %3, 0
  br i1 %tobool6.not, label %if.end12, label %if.then7

if.then7:                                         ; preds = %if.end4
  %xav_fill = getelementptr inbounds i8, ptr %1, i64 8
  %4 = load i64, ptr %xav_fill, align 8
  %5 = trunc i64 %4 to i32
  %conv9 = add i32 %5, 1
  %tobool10.not43 = icmp eq i32 %conv9, 0
  br i1 %tobool10.not43, label %if.end12, label %while.body.preheader

while.body.preheader:                             ; preds = %if.then7
  %6 = sext i32 %conv9 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %indvars.iv = phi i64 [ %6, %while.body.preheader ], [ %indvars.iv.next, %while.body ]
  %7 = load ptr, ptr %av, align 8
  %8 = load ptr, ptr %7, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds ptr, ptr %8, i64 %indvars.iv.next
  %9 = load ptr, ptr %arrayidx, align 8
  tail call void @Perl_sv_free(ptr noundef %9) #7
  %tobool10.not = icmp eq i64 %indvars.iv.next, 0
  br i1 %tobool10.not, label %if.end12.loopexit, label %while.body

if.end12.loopexit:                                ; preds = %while.body
  %.pre = load ptr, ptr %av, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.end12.loopexit, %if.then7, %if.end4
  %10 = phi ptr [ %.pre, %if.end12.loopexit ], [ %1, %if.then7 ], [ %1, %if.end4 ]
  %xav_alloc = getelementptr inbounds i8, ptr %10, i64 56
  %11 = load ptr, ptr %xav_alloc, align 8
  tail call void @Perl_safesysfree(ptr noundef %11) #7
  %12 = load ptr, ptr %av, align 8
  %xav_alloc15 = getelementptr inbounds i8, ptr %12, i64 56
  store ptr null, ptr %xav_alloc15, align 8
  %13 = load ptr, ptr %av, align 8
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %av, align 8
  %xav_fill18 = getelementptr inbounds i8, ptr %14, i64 8
  store i64 -1, ptr %xav_fill18, align 8
  %15 = load ptr, ptr %av, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  store i64 -1, ptr %xav_max, align 8
  %16 = load ptr, ptr %av, align 8
  %xav_arylen = getelementptr inbounds i8, ptr %16, i64 64
  %17 = load ptr, ptr %xav_arylen, align 8
  %tobool21.not = icmp eq ptr %17, null
  br i1 %tobool21.not, label %cleanup, label %if.then22

if.then22:                                        ; preds = %if.end12
  tail call void @Perl_sv_free(ptr noundef nonnull %17) #7
  %18 = load ptr, ptr %av, align 8
  %xav_arylen26 = getelementptr inbounds i8, ptr %18, i64 64
  store ptr null, ptr %xav_arylen26, align 8
  br label %cleanup

cleanup:                                          ; preds = %if.end12, %if.then22, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local void @Perl_av_fill(ptr noundef %av, i32 noundef signext %fill) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @.str.7) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %spec.store.select = tail call i32 @llvm.smax.i32(i32 %fill, i32 -1)
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool3.not = icmp eq i32 %and, 0
  br i1 %tobool3.not, label %if.end107, label %cond.end

cond.end:                                         ; preds = %if.end
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool4.not = icmp eq ptr %call, null
  br i1 %tobool4.not, label %if.end107, label %if.then5

if.then5:                                         ; preds = %cond.end
  %1 = load ptr, ptr @PL_stack_sp, align 8
  tail call void @Perl_push_scope() #7
  tail call void @Perl_save_int(ptr noundef nonnull @PL_tmps_floor) #7
  %2 = load i32, ptr @PL_tmps_ix, align 4
  store i32 %2, ptr @PL_tmps_floor, align 4
  %3 = load ptr, ptr @PL_curstackinfo, align 8
  %si_next = getelementptr inbounds i8, ptr %3, i64 40
  %4 = load ptr, ptr %si_next, align 8
  %tobool6.not = icmp eq ptr %4, null
  br i1 %tobool6.not, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.then5
  %call8 = tail call ptr @Perl_new_stackinfo(i32 noundef signext 32, i32 noundef signext 13) #7
  %5 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev = getelementptr inbounds i8, ptr %call8, i64 32
  store ptr %5, ptr %si_prev, align 8
  %si_next9 = getelementptr inbounds i8, ptr %5, i64 40
  store ptr %call8, ptr %si_next9, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.then5
  %next.0 = phi ptr [ %4, %if.then5 ], [ %call8, %if.then7 ]
  %si_type = getelementptr inbounds i8, ptr %next.0, i64 24
  store i32 2, ptr %si_type, align 8
  %si_cxix = getelementptr inbounds i8, ptr %next.0, i64 16
  store i32 -1, ptr %si_cxix, align 8
  %6 = load ptr, ptr %next.0, align 8
  %7 = load ptr, ptr %6, align 8
  %xav_fill = getelementptr inbounds i8, ptr %7, i64 8
  store i64 0, ptr %xav_fill, align 8
  %8 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %1 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %9 = load ptr, ptr @PL_curstack, align 8
  %10 = load ptr, ptr %9, align 8
  %xav_fill12 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %sub.ptr.div, ptr %xav_fill12, align 8
  %11 = load ptr, ptr %next.0, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr @PL_stack_base, align 8
  %14 = load ptr, ptr %next.0, align 8
  %15 = load ptr, ptr %14, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  %16 = load i64, ptr %xav_max, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %13, i64 %16
  store ptr %add.ptr, ptr @PL_stack_max, align 8
  %17 = load ptr, ptr %next.0, align 8
  %18 = load ptr, ptr %17, align 8
  %xav_fill19 = getelementptr inbounds i8, ptr %18, i64 8
  %19 = load i64, ptr %xav_fill19, align 8
  %add.ptr20 = getelementptr inbounds ptr, ptr %13, i64 %19
  store ptr %add.ptr20, ptr @PL_stack_sp, align 8
  %20 = load ptr, ptr %next.0, align 8
  store ptr %20, ptr @PL_curstack, align 8
  store ptr %next.0, ptr @PL_curstackinfo, align 8
  %21 = load ptr, ptr @PL_markstack_ptr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %21, i64 4
  store ptr %incdec.ptr, ptr @PL_markstack_ptr, align 8
  %22 = load ptr, ptr @PL_markstack_max, align 8
  %cmp22 = icmp eq ptr %incdec.ptr, %22
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end10
  tail call void @Perl_markstack_grow() #7
  %.pre = load ptr, ptr @PL_stack_base, align 8
  %.pre208 = load ptr, ptr @PL_markstack_ptr, align 8
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end10
  %23 = phi ptr [ %.pre208, %if.then23 ], [ %incdec.ptr, %if.end10 ]
  %24 = phi ptr [ %.pre, %if.then23 ], [ %13, %if.end10 ]
  %sub.ptr.lhs.cast26 = ptrtoint ptr %add.ptr20 to i64
  %sub.ptr.rhs.cast27 = ptrtoint ptr %24 to i64
  %sub.ptr.sub28 = sub i64 %sub.ptr.lhs.cast26, %sub.ptr.rhs.cast27
  %sub.ptr.div29 = lshr exact i64 %sub.ptr.sub28, 3
  %conv = trunc i64 %sub.ptr.div29 to i32
  store i32 %conv, ptr %23, align 4
  %25 = load ptr, ptr @PL_stack_max, align 8
  %sub.ptr.lhs.cast30 = ptrtoint ptr %25 to i64
  %sub.ptr.sub32 = sub i64 %sub.ptr.lhs.cast30, %sub.ptr.lhs.cast26
  %cmp34 = icmp slt i64 %sub.ptr.sub32, 9
  br i1 %cmp34, label %if.then36, label %if.end38

if.then36:                                        ; preds = %if.end24
  %call37 = tail call ptr @Perl_stack_grow(ptr noundef %add.ptr20, ptr noundef %add.ptr20, i32 noundef signext 2) #7
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %if.end24
  %sp.0 = phi ptr [ %call37, %if.then36 ], [ %add.ptr20, %if.end24 ]
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %26 = load ptr, ptr %mg_obj, align 8
  %tobool39.not = icmp eq ptr %26, null
  br i1 %tobool39.not, label %cond.false42, label %cond.end45

cond.false42:                                     ; preds = %if.end38
  %call43 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call44 = tail call ptr @Perl_sv_2mortal(ptr noundef %call43) #7
  br label %cond.end45

cond.end45:                                       ; preds = %if.end38, %cond.false42
  %cond46 = phi ptr [ %call44, %cond.false42 ], [ %26, %if.end38 ]
  %incdec.ptr47 = getelementptr inbounds i8, ptr %sp.0, i64 8
  store ptr %cond46, ptr %incdec.ptr47, align 8
  %add = add nsw i32 %spec.store.select, 1
  %conv48 = zext nneg i32 %add to i64
  %call49 = tail call ptr @Perl_newSViv(i64 noundef %conv48) #7
  %call50 = tail call ptr @Perl_sv_2mortal(ptr noundef %call49) #7
  %incdec.ptr51 = getelementptr inbounds i8, ptr %sp.0, i64 16
  store ptr %call50, ptr %incdec.ptr51, align 8
  store ptr %incdec.ptr51, ptr @PL_stack_sp, align 8
  %call52 = tail call signext i32 @Perl_call_method(ptr noundef nonnull @.str.8, i32 noundef signext 2) #7
  %27 = load ptr, ptr @PL_stack_sp, align 8
  %28 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev54 = getelementptr inbounds i8, ptr %28, i64 32
  %29 = load ptr, ptr %si_prev54, align 8
  %tobool55.not = icmp eq ptr %29, null
  br i1 %tobool55.not, label %if.then56, label %if.end82

if.then56:                                        ; preds = %cond.end45
  %30 = load ptr, ptr @PL_stderrgv, align 8
  %tobool57.not = icmp eq ptr %30, null
  br i1 %tobool57.not, label %cond.false77, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then56
  %sv_flags58 = getelementptr inbounds i8, ptr %30, i64 12
  %31 = load i32, ptr %sv_flags58, align 4
  %and59 = and i32 %31, 255
  %cmp60 = icmp eq i32 %and59, 13
  br i1 %cmp60, label %land.lhs.true62, label %cond.false77

land.lhs.true62:                                  ; preds = %land.lhs.true
  %32 = load ptr, ptr %30, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %32, i64 56
  %33 = load ptr, ptr %xgv_gp, align 8
  %gp_io = getelementptr inbounds i8, ptr %33, i64 16
  %34 = load ptr, ptr %gp_io, align 8
  %tobool64.not = icmp eq ptr %34, null
  br i1 %tobool64.not, label %cond.false77, label %land.lhs.true65

land.lhs.true65:                                  ; preds = %land.lhs.true62
  %35 = load ptr, ptr %34, align 8
  %xio_ofp = getelementptr inbounds i8, ptr %35, i64 64
  %36 = load ptr, ptr %xio_ofp, align 8
  %tobool70.not = icmp eq ptr %36, null
  br i1 %tobool70.not, label %cond.false77, label %cond.end79

cond.false77:                                     ; preds = %land.lhs.true65, %land.lhs.true62, %land.lhs.true, %if.then56
  %call78 = tail call ptr @Perl_PerlIO_stderr() #7
  br label %cond.end79

cond.end79:                                       ; preds = %land.lhs.true65, %cond.false77
  %cond80 = phi ptr [ %call78, %cond.false77 ], [ %36, %land.lhs.true65 ]
  %call81 = tail call signext i32 (ptr, ptr, ...) @PerlIO_printf(ptr noundef %cond80, ptr noundef nonnull @.str.1) #7
  tail call void @Perl_my_exit(i32 noundef signext 1) #7
  br label %if.end82

if.end82:                                         ; preds = %cond.end79, %cond.end45
  %37 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast83 = ptrtoint ptr %27 to i64
  %sub.ptr.rhs.cast84 = ptrtoint ptr %37 to i64
  %sub.ptr.sub85 = sub i64 %sub.ptr.lhs.cast83, %sub.ptr.rhs.cast84
  %sub.ptr.div86 = ashr exact i64 %sub.ptr.sub85, 3
  %38 = load ptr, ptr @PL_curstack, align 8
  %39 = load ptr, ptr %38, align 8
  %xav_fill88 = getelementptr inbounds i8, ptr %39, i64 8
  store i64 %sub.ptr.div86, ptr %xav_fill88, align 8
  %40 = load ptr, ptr %29, align 8
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr @PL_stack_base, align 8
  %43 = load ptr, ptr %29, align 8
  %44 = load ptr, ptr %43, align 8
  %xav_max94 = getelementptr inbounds i8, ptr %44, i64 16
  %45 = load i64, ptr %xav_max94, align 8
  %add.ptr95 = getelementptr inbounds ptr, ptr %42, i64 %45
  store ptr %add.ptr95, ptr @PL_stack_max, align 8
  %46 = load ptr, ptr %29, align 8
  %47 = load ptr, ptr %46, align 8
  %xav_fill98 = getelementptr inbounds i8, ptr %47, i64 8
  %48 = load i64, ptr %xav_fill98, align 8
  %add.ptr99 = getelementptr inbounds ptr, ptr %42, i64 %48
  store ptr %add.ptr99, ptr @PL_stack_sp, align 8
  %49 = load ptr, ptr %29, align 8
  store ptr %49, ptr @PL_curstack, align 8
  store ptr %29, ptr @PL_curstackinfo, align 8
  %50 = load i32, ptr @PL_tmps_ix, align 4
  %51 = load i32, ptr @PL_tmps_floor, align 4
  %cmp103 = icmp sgt i32 %50, %51
  br i1 %cmp103, label %if.then105, label %if.end106

if.then105:                                       ; preds = %if.end82
  tail call void @Perl_free_tmps() #7
  br label %if.end106

if.end106:                                        ; preds = %if.then105, %if.end82
  tail call void @Perl_pop_scope() #7
  br label %cleanup

if.end107:                                        ; preds = %if.end, %cond.end
  %conv108 = sext i32 %spec.store.select to i64
  %52 = load ptr, ptr %av, align 8
  %xav_max110 = getelementptr inbounds i8, ptr %52, i64 16
  %53 = load i64, ptr %xav_max110, align 8
  %cmp111.not = icmp slt i64 %53, %conv108
  br i1 %cmp111.not, label %if.else145, label %if.then113

if.then113:                                       ; preds = %if.end107
  %xav_fill115 = getelementptr inbounds i8, ptr %52, i64 8
  %54 = load i64, ptr %xav_fill115, align 8
  %conv116 = trunc i64 %54 to i32
  %55 = load ptr, ptr %52, align 8
  %xav_flags = getelementptr inbounds i8, ptr %52, i64 72
  %56 = load i8, ptr %xav_flags, align 8
  %57 = and i8 %56, 1
  %tobool122.not = icmp eq i8 %57, 0
  br i1 %tobool122.not, label %while.cond128.preheader, label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.then113
  %cmp124201 = icmp slt i32 %spec.store.select, %conv116
  br i1 %cmp124201, label %while.body.preheader, label %if.end135

while.body.preheader:                             ; preds = %while.cond.preheader
  %sext = shl i64 %54, 32
  %58 = ashr exact i64 %sext, 32
  br label %while.body

while.cond128.preheader:                          ; preds = %if.then113
  %cmp129203 = icmp sgt i32 %spec.store.select, %conv116
  br i1 %cmp129203, label %while.body131.preheader, label %if.end135

while.body131.preheader:                          ; preds = %while.cond128.preheader
  %sext209 = shl i64 %54, 32
  %59 = ashr exact i64 %sext209, 32
  br label %while.body131

while.body:                                       ; preds = %while.body.preheader, %while.body
  %indvars.iv = phi i64 [ %58, %while.body.preheader ], [ %indvars.iv.next, %while.body ]
  %arrayidx = getelementptr inbounds ptr, ptr %55, i64 %indvars.iv
  %60 = load ptr, ptr %arrayidx, align 8
  tail call void @Perl_sv_free(ptr noundef %60) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  %cmp124 = icmp sgt i64 %indvars.iv.next, %conv108
  br i1 %cmp124, label %while.body, label %if.end135

while.body131:                                    ; preds = %while.body131.preheader, %while.body131
  %indvars.iv206 = phi i64 [ %59, %while.body131.preheader ], [ %indvars.iv.next207, %while.body131 ]
  %indvars.iv.next207 = add nsw i64 %indvars.iv206, 1
  %arrayidx133 = getelementptr inbounds ptr, ptr %55, i64 %indvars.iv.next207
  store ptr @PL_sv_undef, ptr %arrayidx133, align 8
  %exitcond.not = icmp eq i64 %indvars.iv.next207, %conv108
  br i1 %exitcond.not, label %if.end135, label %while.body131

if.end135:                                        ; preds = %while.body, %while.body131, %while.cond.preheader, %while.cond128.preheader
  %61 = load ptr, ptr %av, align 8
  %xav_fill138 = getelementptr inbounds i8, ptr %61, i64 8
  store i64 %conv108, ptr %xav_fill138, align 8
  %62 = load i32, ptr %sv_flags, align 4
  %and140 = and i32 %62, 16384
  %tobool141.not = icmp eq i32 %and140, 0
  br i1 %tobool141.not, label %cleanup, label %if.then142

if.then142:                                       ; preds = %if.end135
  %call143 = tail call signext i32 @Perl_mg_set(ptr noundef nonnull %av) #7
  br label %cleanup

if.else145:                                       ; preds = %if.end107
  %call146 = tail call ptr @Perl_av_store(ptr noundef nonnull %av, i32 noundef signext %spec.store.select, ptr noundef nonnull @PL_sv_undef)
  br label %cleanup

cleanup:                                          ; preds = %if.else145, %if.then142, %if.end135, %if.end106
  ret void
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local void @Perl_av_push(ptr noundef %av, ptr noundef %val) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 8388608
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %1 = phi i32 [ %.pre, %if.then2 ], [ %0, %if.end ]
  %and5 = and i32 %1, 32768
  %tobool6.not = icmp eq i32 %and5, 0
  br i1 %tobool6.not, label %if.end102, label %cond.end

cond.end:                                         ; preds = %if.end3
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool7.not = icmp eq ptr %call, null
  br i1 %tobool7.not, label %if.end102, label %if.then8

if.then8:                                         ; preds = %cond.end
  %2 = load ptr, ptr @PL_stack_sp, align 8
  %3 = load ptr, ptr @PL_curstackinfo, align 8
  %si_next = getelementptr inbounds i8, ptr %3, i64 40
  %4 = load ptr, ptr %si_next, align 8
  %tobool9.not = icmp eq ptr %4, null
  br i1 %tobool9.not, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.then8
  %call11 = tail call ptr @Perl_new_stackinfo(i32 noundef signext 32, i32 noundef signext 13) #7
  %5 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev = getelementptr inbounds i8, ptr %call11, i64 32
  store ptr %5, ptr %si_prev, align 8
  %si_next12 = getelementptr inbounds i8, ptr %5, i64 40
  store ptr %call11, ptr %si_next12, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.then8
  %next.0 = phi ptr [ %4, %if.then8 ], [ %call11, %if.then10 ]
  %si_type = getelementptr inbounds i8, ptr %next.0, i64 24
  store i32 2, ptr %si_type, align 8
  %si_cxix = getelementptr inbounds i8, ptr %next.0, i64 16
  store i32 -1, ptr %si_cxix, align 8
  %6 = load ptr, ptr %next.0, align 8
  %7 = load ptr, ptr %6, align 8
  %xav_fill = getelementptr inbounds i8, ptr %7, i64 8
  store i64 0, ptr %xav_fill, align 8
  %8 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %9 = load ptr, ptr @PL_curstack, align 8
  %10 = load ptr, ptr %9, align 8
  %xav_fill15 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %sub.ptr.div, ptr %xav_fill15, align 8
  %11 = load ptr, ptr %next.0, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr @PL_stack_base, align 8
  %14 = load ptr, ptr %next.0, align 8
  %15 = load ptr, ptr %14, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  %16 = load i64, ptr %xav_max, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %13, i64 %16
  store ptr %add.ptr, ptr @PL_stack_max, align 8
  %17 = load ptr, ptr %next.0, align 8
  %18 = load ptr, ptr %17, align 8
  %xav_fill22 = getelementptr inbounds i8, ptr %18, i64 8
  %19 = load i64, ptr %xav_fill22, align 8
  %add.ptr23 = getelementptr inbounds ptr, ptr %13, i64 %19
  store ptr %add.ptr23, ptr @PL_stack_sp, align 8
  %20 = load ptr, ptr %next.0, align 8
  store ptr %20, ptr @PL_curstack, align 8
  store ptr %next.0, ptr @PL_curstackinfo, align 8
  %21 = load ptr, ptr @PL_markstack_ptr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %21, i64 4
  store ptr %incdec.ptr, ptr @PL_markstack_ptr, align 8
  %22 = load ptr, ptr @PL_markstack_max, align 8
  %cmp = icmp eq ptr %incdec.ptr, %22
  br i1 %cmp, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end13
  tail call void @Perl_markstack_grow() #7
  %.pre143 = load ptr, ptr @PL_stack_base, align 8
  %.pre144 = load ptr, ptr @PL_markstack_ptr, align 8
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end13
  %23 = phi ptr [ %.pre144, %if.then25 ], [ %incdec.ptr, %if.end13 ]
  %24 = phi ptr [ %.pre143, %if.then25 ], [ %13, %if.end13 ]
  %sub.ptr.lhs.cast28 = ptrtoint ptr %add.ptr23 to i64
  %sub.ptr.rhs.cast29 = ptrtoint ptr %24 to i64
  %sub.ptr.sub30 = sub i64 %sub.ptr.lhs.cast28, %sub.ptr.rhs.cast29
  %sub.ptr.div31 = lshr exact i64 %sub.ptr.sub30, 3
  %conv = trunc i64 %sub.ptr.div31 to i32
  store i32 %conv, ptr %23, align 4
  %25 = load ptr, ptr @PL_stack_max, align 8
  %sub.ptr.lhs.cast32 = ptrtoint ptr %25 to i64
  %sub.ptr.sub34 = sub i64 %sub.ptr.lhs.cast32, %sub.ptr.lhs.cast28
  %cmp36 = icmp slt i64 %sub.ptr.sub34, 9
  br i1 %cmp36, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.end26
  %call39 = tail call ptr @Perl_stack_grow(ptr noundef %add.ptr23, ptr noundef %add.ptr23, i32 noundef signext 2) #7
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.end26
  %sp.0 = phi ptr [ %call39, %if.then38 ], [ %add.ptr23, %if.end26 ]
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %26 = load ptr, ptr %mg_obj, align 8
  %tobool41.not = icmp eq ptr %26, null
  br i1 %tobool41.not, label %cond.false44, label %cond.end47

cond.false44:                                     ; preds = %if.end40
  %call45 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call46 = tail call ptr @Perl_sv_2mortal(ptr noundef %call45) #7
  br label %cond.end47

cond.end47:                                       ; preds = %if.end40, %cond.false44
  %cond48 = phi ptr [ %call46, %cond.false44 ], [ %26, %if.end40 ]
  %incdec.ptr49 = getelementptr inbounds i8, ptr %sp.0, i64 8
  store ptr %cond48, ptr %incdec.ptr49, align 8
  %incdec.ptr50 = getelementptr inbounds i8, ptr %sp.0, i64 16
  store ptr %val, ptr %incdec.ptr50, align 8
  store ptr %incdec.ptr50, ptr @PL_stack_sp, align 8
  tail call void @Perl_push_scope() #7
  %call51 = tail call signext i32 @Perl_call_method(ptr noundef nonnull @.str.3, i32 noundef signext 2) #7
  tail call void @Perl_pop_scope() #7
  %27 = load ptr, ptr @PL_stack_sp, align 8
  %28 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev53 = getelementptr inbounds i8, ptr %28, i64 32
  %29 = load ptr, ptr %si_prev53, align 8
  %tobool54.not = icmp eq ptr %29, null
  br i1 %tobool54.not, label %if.then55, label %if.end81

if.then55:                                        ; preds = %cond.end47
  %30 = load ptr, ptr @PL_stderrgv, align 8
  %tobool56.not = icmp eq ptr %30, null
  br i1 %tobool56.not, label %cond.false76, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then55
  %sv_flags57 = getelementptr inbounds i8, ptr %30, i64 12
  %31 = load i32, ptr %sv_flags57, align 4
  %and58 = and i32 %31, 255
  %cmp59 = icmp eq i32 %and58, 13
  br i1 %cmp59, label %land.lhs.true61, label %cond.false76

land.lhs.true61:                                  ; preds = %land.lhs.true
  %32 = load ptr, ptr %30, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %32, i64 56
  %33 = load ptr, ptr %xgv_gp, align 8
  %gp_io = getelementptr inbounds i8, ptr %33, i64 16
  %34 = load ptr, ptr %gp_io, align 8
  %tobool63.not = icmp eq ptr %34, null
  br i1 %tobool63.not, label %cond.false76, label %land.lhs.true64

land.lhs.true64:                                  ; preds = %land.lhs.true61
  %35 = load ptr, ptr %34, align 8
  %xio_ofp = getelementptr inbounds i8, ptr %35, i64 64
  %36 = load ptr, ptr %xio_ofp, align 8
  %tobool69.not = icmp eq ptr %36, null
  br i1 %tobool69.not, label %cond.false76, label %cond.end78

cond.false76:                                     ; preds = %land.lhs.true64, %land.lhs.true61, %land.lhs.true, %if.then55
  %call77 = tail call ptr @Perl_PerlIO_stderr() #7
  br label %cond.end78

cond.end78:                                       ; preds = %land.lhs.true64, %cond.false76
  %cond79 = phi ptr [ %call77, %cond.false76 ], [ %36, %land.lhs.true64 ]
  %call80 = tail call signext i32 (ptr, ptr, ...) @PerlIO_printf(ptr noundef %cond79, ptr noundef nonnull @.str.1) #7
  tail call void @Perl_my_exit(i32 noundef signext 1) #7
  br label %if.end81

if.end81:                                         ; preds = %cond.end78, %cond.end47
  %37 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast82 = ptrtoint ptr %27 to i64
  %sub.ptr.rhs.cast83 = ptrtoint ptr %37 to i64
  %sub.ptr.sub84 = sub i64 %sub.ptr.lhs.cast82, %sub.ptr.rhs.cast83
  %sub.ptr.div85 = ashr exact i64 %sub.ptr.sub84, 3
  %38 = load ptr, ptr @PL_curstack, align 8
  %39 = load ptr, ptr %38, align 8
  %xav_fill87 = getelementptr inbounds i8, ptr %39, i64 8
  store i64 %sub.ptr.div85, ptr %xav_fill87, align 8
  %40 = load ptr, ptr %29, align 8
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr @PL_stack_base, align 8
  %43 = load ptr, ptr %29, align 8
  %44 = load ptr, ptr %43, align 8
  %xav_max93 = getelementptr inbounds i8, ptr %44, i64 16
  %45 = load i64, ptr %xav_max93, align 8
  %add.ptr94 = getelementptr inbounds ptr, ptr %42, i64 %45
  store ptr %add.ptr94, ptr @PL_stack_max, align 8
  %46 = load ptr, ptr %29, align 8
  %47 = load ptr, ptr %46, align 8
  %xav_fill97 = getelementptr inbounds i8, ptr %47, i64 8
  %48 = load i64, ptr %xav_fill97, align 8
  %add.ptr98 = getelementptr inbounds ptr, ptr %42, i64 %48
  store ptr %add.ptr98, ptr @PL_stack_sp, align 8
  %49 = load ptr, ptr %29, align 8
  store ptr %49, ptr @PL_curstack, align 8
  store ptr %29, ptr @PL_curstackinfo, align 8
  br label %cleanup

if.end102:                                        ; preds = %if.end3, %cond.end
  %50 = load ptr, ptr %av, align 8
  %xav_fill104 = getelementptr inbounds i8, ptr %50, i64 8
  %51 = load i64, ptr %xav_fill104, align 8
  %52 = trunc i64 %51 to i32
  %conv105 = add i32 %52, 1
  %call106 = tail call ptr @Perl_av_store(ptr noundef nonnull %av, i32 noundef signext %conv105, ptr noundef %val)
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end102, %if.end81
  ret void
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_av_pop(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 8388608
  %tobool2.not = icmp eq i32 %and, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %1 = phi i32 [ %.pre, %if.then3 ], [ %0, %if.end ]
  %and6 = and i32 %1, 32768
  %tobool7.not = icmp eq i32 %and6, 0
  br i1 %tobool7.not, label %if.end108, label %cond.end

cond.end:                                         ; preds = %if.end4
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool8.not = icmp eq ptr %call, null
  br i1 %tobool8.not, label %cond.end.if.end108_crit_edge, label %if.then9

cond.end.if.end108_crit_edge:                     ; preds = %cond.end
  %.pre184 = load i32, ptr %sv_flags, align 4
  br label %if.end108

if.then9:                                         ; preds = %cond.end
  %2 = load ptr, ptr @PL_stack_sp, align 8
  %3 = load ptr, ptr @PL_curstackinfo, align 8
  %si_next = getelementptr inbounds i8, ptr %3, i64 40
  %4 = load ptr, ptr %si_next, align 8
  %tobool10.not = icmp eq ptr %4, null
  br i1 %tobool10.not, label %if.then11, label %if.end14

if.then11:                                        ; preds = %if.then9
  %call12 = tail call ptr @Perl_new_stackinfo(i32 noundef signext 32, i32 noundef signext 13) #7
  %5 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev = getelementptr inbounds i8, ptr %call12, i64 32
  store ptr %5, ptr %si_prev, align 8
  %si_next13 = getelementptr inbounds i8, ptr %5, i64 40
  store ptr %call12, ptr %si_next13, align 8
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %if.then9
  %next.0 = phi ptr [ %4, %if.then9 ], [ %call12, %if.then11 ]
  %si_type = getelementptr inbounds i8, ptr %next.0, i64 24
  store i32 2, ptr %si_type, align 8
  %si_cxix = getelementptr inbounds i8, ptr %next.0, i64 16
  store i32 -1, ptr %si_cxix, align 8
  %6 = load ptr, ptr %next.0, align 8
  %7 = load ptr, ptr %6, align 8
  %xav_fill = getelementptr inbounds i8, ptr %7, i64 8
  store i64 0, ptr %xav_fill, align 8
  %8 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %9 = load ptr, ptr @PL_curstack, align 8
  %10 = load ptr, ptr %9, align 8
  %xav_fill16 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %sub.ptr.div, ptr %xav_fill16, align 8
  %11 = load ptr, ptr %next.0, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr @PL_stack_base, align 8
  %14 = load ptr, ptr %next.0, align 8
  %15 = load ptr, ptr %14, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  %16 = load i64, ptr %xav_max, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %13, i64 %16
  store ptr %add.ptr, ptr @PL_stack_max, align 8
  %17 = load ptr, ptr %next.0, align 8
  %18 = load ptr, ptr %17, align 8
  %xav_fill23 = getelementptr inbounds i8, ptr %18, i64 8
  %19 = load i64, ptr %xav_fill23, align 8
  %add.ptr24 = getelementptr inbounds ptr, ptr %13, i64 %19
  store ptr %add.ptr24, ptr @PL_stack_sp, align 8
  %20 = load ptr, ptr %next.0, align 8
  store ptr %20, ptr @PL_curstack, align 8
  store ptr %next.0, ptr @PL_curstackinfo, align 8
  %21 = load ptr, ptr @PL_markstack_ptr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %21, i64 4
  store ptr %incdec.ptr, ptr @PL_markstack_ptr, align 8
  %22 = load ptr, ptr @PL_markstack_max, align 8
  %cmp = icmp eq ptr %incdec.ptr, %22
  br i1 %cmp, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end14
  tail call void @Perl_markstack_grow() #7
  %.pre182 = load ptr, ptr @PL_stack_base, align 8
  %.pre183 = load ptr, ptr @PL_markstack_ptr, align 8
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end14
  %23 = phi ptr [ %.pre183, %if.then26 ], [ %incdec.ptr, %if.end14 ]
  %24 = phi ptr [ %.pre182, %if.then26 ], [ %13, %if.end14 ]
  %sub.ptr.lhs.cast29 = ptrtoint ptr %add.ptr24 to i64
  %sub.ptr.rhs.cast30 = ptrtoint ptr %24 to i64
  %sub.ptr.sub31 = sub i64 %sub.ptr.lhs.cast29, %sub.ptr.rhs.cast30
  %sub.ptr.div32 = lshr exact i64 %sub.ptr.sub31, 3
  %conv = trunc i64 %sub.ptr.div32 to i32
  store i32 %conv, ptr %23, align 4
  %25 = load ptr, ptr @PL_stack_max, align 8
  %sub.ptr.lhs.cast33 = ptrtoint ptr %25 to i64
  %sub.ptr.sub35 = sub i64 %sub.ptr.lhs.cast33, %sub.ptr.lhs.cast29
  %cmp37 = icmp slt i64 %sub.ptr.sub35, 8
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.end27
  %call40 = tail call ptr @Perl_stack_grow(ptr noundef %add.ptr24, ptr noundef %add.ptr24, i32 noundef signext 1) #7
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.end27
  %sp.0 = phi ptr [ %call40, %if.then39 ], [ %add.ptr24, %if.end27 ]
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %26 = load ptr, ptr %mg_obj, align 8
  %tobool43.not = icmp eq ptr %26, null
  br i1 %tobool43.not, label %cond.false46, label %cond.end49

cond.false46:                                     ; preds = %if.end41
  %call47 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call48 = tail call ptr @Perl_sv_2mortal(ptr noundef %call47) #7
  br label %cond.end49

cond.end49:                                       ; preds = %if.end41, %cond.false46
  %cond50 = phi ptr [ %call48, %cond.false46 ], [ %26, %if.end41 ]
  %incdec.ptr51 = getelementptr inbounds i8, ptr %sp.0, i64 8
  store ptr %cond50, ptr %incdec.ptr51, align 8
  store ptr %incdec.ptr51, ptr @PL_stack_sp, align 8
  tail call void @Perl_push_scope() #7
  %call52 = tail call signext i32 @Perl_call_method(ptr noundef nonnull @.str.4, i32 noundef signext 0) #7
  %tobool53.not = icmp eq i32 %call52, 0
  br i1 %tobool53.not, label %if.end57, label %if.then54

if.then54:                                        ; preds = %cond.end49
  %27 = load ptr, ptr @PL_stack_sp, align 8
  %incdec.ptr55 = getelementptr inbounds i8, ptr %27, i64 -8
  store ptr %incdec.ptr55, ptr @PL_stack_sp, align 8
  %28 = load ptr, ptr %27, align 8
  %call56 = tail call ptr @Perl_newSVsv(ptr noundef %28) #7
  br label %if.end57

if.end57:                                         ; preds = %cond.end49, %if.then54
  %retval1.0 = phi ptr [ %call56, %if.then54 ], [ @PL_sv_undef, %cond.end49 ]
  tail call void @Perl_pop_scope() #7
  %29 = load ptr, ptr @PL_stack_sp, align 8
  %30 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev59 = getelementptr inbounds i8, ptr %30, i64 32
  %31 = load ptr, ptr %si_prev59, align 8
  %tobool60.not = icmp eq ptr %31, null
  br i1 %tobool60.not, label %if.then61, label %if.end87

if.then61:                                        ; preds = %if.end57
  %32 = load ptr, ptr @PL_stderrgv, align 8
  %tobool62.not = icmp eq ptr %32, null
  br i1 %tobool62.not, label %cond.false82, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then61
  %sv_flags63 = getelementptr inbounds i8, ptr %32, i64 12
  %33 = load i32, ptr %sv_flags63, align 4
  %and64 = and i32 %33, 255
  %cmp65 = icmp eq i32 %and64, 13
  br i1 %cmp65, label %land.lhs.true67, label %cond.false82

land.lhs.true67:                                  ; preds = %land.lhs.true
  %34 = load ptr, ptr %32, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %34, i64 56
  %35 = load ptr, ptr %xgv_gp, align 8
  %gp_io = getelementptr inbounds i8, ptr %35, i64 16
  %36 = load ptr, ptr %gp_io, align 8
  %tobool69.not = icmp eq ptr %36, null
  br i1 %tobool69.not, label %cond.false82, label %land.lhs.true70

land.lhs.true70:                                  ; preds = %land.lhs.true67
  %37 = load ptr, ptr %36, align 8
  %xio_ofp = getelementptr inbounds i8, ptr %37, i64 64
  %38 = load ptr, ptr %xio_ofp, align 8
  %tobool75.not = icmp eq ptr %38, null
  br i1 %tobool75.not, label %cond.false82, label %cond.end84

cond.false82:                                     ; preds = %land.lhs.true70, %land.lhs.true67, %land.lhs.true, %if.then61
  %call83 = tail call ptr @Perl_PerlIO_stderr() #7
  br label %cond.end84

cond.end84:                                       ; preds = %land.lhs.true70, %cond.false82
  %cond85 = phi ptr [ %call83, %cond.false82 ], [ %38, %land.lhs.true70 ]
  %call86 = tail call signext i32 (ptr, ptr, ...) @PerlIO_printf(ptr noundef %cond85, ptr noundef nonnull @.str.1) #7
  tail call void @Perl_my_exit(i32 noundef signext 1) #7
  br label %if.end87

if.end87:                                         ; preds = %cond.end84, %if.end57
  %39 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast88 = ptrtoint ptr %29 to i64
  %sub.ptr.rhs.cast89 = ptrtoint ptr %39 to i64
  %sub.ptr.sub90 = sub i64 %sub.ptr.lhs.cast88, %sub.ptr.rhs.cast89
  %sub.ptr.div91 = ashr exact i64 %sub.ptr.sub90, 3
  %40 = load ptr, ptr @PL_curstack, align 8
  %41 = load ptr, ptr %40, align 8
  %xav_fill93 = getelementptr inbounds i8, ptr %41, i64 8
  store i64 %sub.ptr.div91, ptr %xav_fill93, align 8
  %42 = load ptr, ptr %31, align 8
  %43 = load ptr, ptr %42, align 8
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr @PL_stack_base, align 8
  %45 = load ptr, ptr %31, align 8
  %46 = load ptr, ptr %45, align 8
  %xav_max99 = getelementptr inbounds i8, ptr %46, i64 16
  %47 = load i64, ptr %xav_max99, align 8
  %add.ptr100 = getelementptr inbounds ptr, ptr %44, i64 %47
  store ptr %add.ptr100, ptr @PL_stack_max, align 8
  %48 = load ptr, ptr %31, align 8
  %49 = load ptr, ptr %48, align 8
  %xav_fill103 = getelementptr inbounds i8, ptr %49, i64 8
  %50 = load i64, ptr %xav_fill103, align 8
  %add.ptr104 = getelementptr inbounds ptr, ptr %44, i64 %50
  store ptr %add.ptr104, ptr @PL_stack_sp, align 8
  %51 = load ptr, ptr %31, align 8
  store ptr %51, ptr @PL_curstack, align 8
  store ptr %31, ptr @PL_curstackinfo, align 8
  br label %cleanup

if.end108:                                        ; preds = %cond.end.if.end108_crit_edge, %if.end4
  %52 = phi i32 [ %.pre184, %cond.end.if.end108_crit_edge ], [ %1, %if.end4 ]
  %and110 = and i32 %52, 32768
  %tobool111.not = icmp eq i32 %and110, 0
  br i1 %tobool111.not, label %cond.false115, label %cond.true112

cond.true112:                                     ; preds = %if.end108
  %call113 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  %conv114 = sext i32 %call113 to i64
  br label %cond.end118

cond.false115:                                    ; preds = %if.end108
  %53 = load ptr, ptr %av, align 8
  %xav_fill117 = getelementptr inbounds i8, ptr %53, i64 8
  %54 = load i64, ptr %xav_fill117, align 8
  br label %cond.end118

cond.end118:                                      ; preds = %cond.false115, %cond.true112
  %cond119 = phi i64 [ %conv114, %cond.true112 ], [ %54, %cond.false115 ]
  %cmp120 = icmp slt i64 %cond119, 0
  br i1 %cmp120, label %cleanup, label %if.end123

if.end123:                                        ; preds = %cond.end118
  %55 = load ptr, ptr %av, align 8
  %56 = load ptr, ptr %55, align 8
  %xav_fill127 = getelementptr inbounds i8, ptr %55, i64 8
  %57 = load i64, ptr %xav_fill127, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %56, i64 %57
  %58 = load ptr, ptr %arrayidx, align 8
  %dec = add nsw i64 %57, -1
  store i64 %dec, ptr %xav_fill127, align 8
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  %59 = load i32, ptr %sv_flags, align 4
  %and134 = and i32 %59, 16384
  %tobool135.not = icmp eq i32 %and134, 0
  br i1 %tobool135.not, label %cleanup, label %if.then136

if.then136:                                       ; preds = %if.end123
  %call137 = tail call signext i32 @Perl_mg_set(ptr noundef nonnull %av) #7
  br label %cleanup

cleanup:                                          ; preds = %if.end123, %if.then136, %cond.end118, %entry, %if.end87
  %retval.0 = phi ptr [ %retval1.0, %if.end87 ], [ @PL_sv_undef, %entry ], [ @PL_sv_undef, %cond.end118 ], [ %58, %if.then136 ], [ %58, %if.end123 ]
  ret ptr %retval.0
}

declare ptr @Perl_newSVsv(ptr noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local void @Perl_av_unshift(ptr noundef %av, i32 noundef signext %num) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 8388608
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %1 = phi i32 [ %.pre, %if.then2 ], [ %0, %if.end ]
  %and5 = and i32 %1, 32768
  %tobool6.not = icmp eq i32 %and5, 0
  br i1 %tobool6.not, label %if.end106, label %cond.end

cond.end:                                         ; preds = %if.end3
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool7.not = icmp eq ptr %call, null
  br i1 %tobool7.not, label %if.end106, label %if.then8

if.then8:                                         ; preds = %cond.end
  %2 = load ptr, ptr @PL_stack_sp, align 8
  %3 = load ptr, ptr @PL_curstackinfo, align 8
  %si_next = getelementptr inbounds i8, ptr %3, i64 40
  %4 = load ptr, ptr %si_next, align 8
  %tobool9.not = icmp eq ptr %4, null
  br i1 %tobool9.not, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.then8
  %call11 = tail call ptr @Perl_new_stackinfo(i32 noundef signext 32, i32 noundef signext 13) #7
  %5 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev = getelementptr inbounds i8, ptr %call11, i64 32
  store ptr %5, ptr %si_prev, align 8
  %si_next12 = getelementptr inbounds i8, ptr %5, i64 40
  store ptr %call11, ptr %si_next12, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.then8
  %next.0 = phi ptr [ %4, %if.then8 ], [ %call11, %if.then10 ]
  %si_type = getelementptr inbounds i8, ptr %next.0, i64 24
  store i32 2, ptr %si_type, align 8
  %si_cxix = getelementptr inbounds i8, ptr %next.0, i64 16
  store i32 -1, ptr %si_cxix, align 8
  %6 = load ptr, ptr %next.0, align 8
  %7 = load ptr, ptr %6, align 8
  %xav_fill = getelementptr inbounds i8, ptr %7, i64 8
  store i64 0, ptr %xav_fill, align 8
  %8 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %9 = load ptr, ptr @PL_curstack, align 8
  %10 = load ptr, ptr %9, align 8
  %xav_fill15 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %sub.ptr.div, ptr %xav_fill15, align 8
  %11 = load ptr, ptr %next.0, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr @PL_stack_base, align 8
  %14 = load ptr, ptr %next.0, align 8
  %15 = load ptr, ptr %14, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  %16 = load i64, ptr %xav_max, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %13, i64 %16
  store ptr %add.ptr, ptr @PL_stack_max, align 8
  %17 = load ptr, ptr %next.0, align 8
  %18 = load ptr, ptr %17, align 8
  %xav_fill22 = getelementptr inbounds i8, ptr %18, i64 8
  %19 = load i64, ptr %xav_fill22, align 8
  %add.ptr23 = getelementptr inbounds ptr, ptr %13, i64 %19
  store ptr %add.ptr23, ptr @PL_stack_sp, align 8
  %20 = load ptr, ptr %next.0, align 8
  store ptr %20, ptr @PL_curstack, align 8
  store ptr %next.0, ptr @PL_curstackinfo, align 8
  %21 = load ptr, ptr @PL_markstack_ptr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %21, i64 4
  store ptr %incdec.ptr, ptr @PL_markstack_ptr, align 8
  %22 = load ptr, ptr @PL_markstack_max, align 8
  %cmp = icmp eq ptr %incdec.ptr, %22
  br i1 %cmp, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end13
  tail call void @Perl_markstack_grow() #7
  %.pre276 = load ptr, ptr @PL_stack_base, align 8
  %.pre277 = load ptr, ptr @PL_markstack_ptr, align 8
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end13
  %23 = phi ptr [ %.pre277, %if.then25 ], [ %incdec.ptr, %if.end13 ]
  %24 = phi ptr [ %.pre276, %if.then25 ], [ %13, %if.end13 ]
  %sub.ptr.lhs.cast28 = ptrtoint ptr %add.ptr23 to i64
  %sub.ptr.rhs.cast29 = ptrtoint ptr %24 to i64
  %sub.ptr.sub30 = sub i64 %sub.ptr.lhs.cast28, %sub.ptr.rhs.cast29
  %sub.ptr.div31 = lshr exact i64 %sub.ptr.sub30, 3
  %conv = trunc i64 %sub.ptr.div31 to i32
  store i32 %conv, ptr %23, align 4
  %25 = load ptr, ptr @PL_stack_max, align 8
  %sub.ptr.lhs.cast32 = ptrtoint ptr %25 to i64
  %sub.ptr.sub34 = sub i64 %sub.ptr.lhs.cast32, %sub.ptr.lhs.cast28
  %sub.ptr.div35 = ashr exact i64 %sub.ptr.sub34, 3
  %add = add nsw i32 %num, 1
  %conv36 = sext i32 %add to i64
  %cmp37 = icmp slt i64 %sub.ptr.div35, %conv36
  br i1 %cmp37, label %if.then39, label %if.end42

if.then39:                                        ; preds = %if.end26
  %call41 = tail call ptr @Perl_stack_grow(ptr noundef %add.ptr23, ptr noundef %add.ptr23, i32 noundef signext %add) #7
  br label %if.end42

if.end42:                                         ; preds = %if.then39, %if.end26
  %sp.0 = phi ptr [ %call41, %if.then39 ], [ %add.ptr23, %if.end26 ]
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %26 = load ptr, ptr %mg_obj, align 8
  %tobool43.not = icmp eq ptr %26, null
  br i1 %tobool43.not, label %cond.false46, label %cond.end49

cond.false46:                                     ; preds = %if.end42
  %call47 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call48 = tail call ptr @Perl_sv_2mortal(ptr noundef %call47) #7
  br label %cond.end49

cond.end49:                                       ; preds = %if.end42, %cond.false46
  %cond50 = phi ptr [ %call48, %cond.false46 ], [ %26, %if.end42 ]
  %incdec.ptr51 = getelementptr inbounds i8, ptr %sp.0, i64 8
  store ptr %cond50, ptr %incdec.ptr51, align 8
  %cmp52273 = icmp sgt i32 %num, 0
  br i1 %cmp52273, label %while.body, label %while.end

while.body:                                       ; preds = %cond.end49, %while.body
  %num.addr.0275 = phi i32 [ %dec, %while.body ], [ %num, %cond.end49 ]
  %sp.1274 = phi ptr [ %incdec.ptr54, %while.body ], [ %incdec.ptr51, %cond.end49 ]
  %dec = add nsw i32 %num.addr.0275, -1
  %incdec.ptr54 = getelementptr inbounds i8, ptr %sp.1274, i64 8
  store ptr @PL_sv_undef, ptr %incdec.ptr54, align 8
  %cmp52 = icmp ugt i32 %num.addr.0275, 1
  br i1 %cmp52, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %cond.end49
  %sp.1.lcssa = phi ptr [ %incdec.ptr51, %cond.end49 ], [ %incdec.ptr54, %while.body ]
  store ptr %sp.1.lcssa, ptr @PL_stack_sp, align 8
  tail call void @Perl_push_scope() #7
  %call55 = tail call signext i32 @Perl_call_method(ptr noundef nonnull @.str.5, i32 noundef signext 2) #7
  tail call void @Perl_pop_scope() #7
  %27 = load ptr, ptr @PL_stack_sp, align 8
  %28 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev57 = getelementptr inbounds i8, ptr %28, i64 32
  %29 = load ptr, ptr %si_prev57, align 8
  %tobool58.not = icmp eq ptr %29, null
  br i1 %tobool58.not, label %if.then59, label %if.end85

if.then59:                                        ; preds = %while.end
  %30 = load ptr, ptr @PL_stderrgv, align 8
  %tobool60.not = icmp eq ptr %30, null
  br i1 %tobool60.not, label %cond.false80, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then59
  %sv_flags61 = getelementptr inbounds i8, ptr %30, i64 12
  %31 = load i32, ptr %sv_flags61, align 4
  %and62 = and i32 %31, 255
  %cmp63 = icmp eq i32 %and62, 13
  br i1 %cmp63, label %land.lhs.true65, label %cond.false80

land.lhs.true65:                                  ; preds = %land.lhs.true
  %32 = load ptr, ptr %30, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %32, i64 56
  %33 = load ptr, ptr %xgv_gp, align 8
  %gp_io = getelementptr inbounds i8, ptr %33, i64 16
  %34 = load ptr, ptr %gp_io, align 8
  %tobool67.not = icmp eq ptr %34, null
  br i1 %tobool67.not, label %cond.false80, label %land.lhs.true68

land.lhs.true68:                                  ; preds = %land.lhs.true65
  %35 = load ptr, ptr %34, align 8
  %xio_ofp = getelementptr inbounds i8, ptr %35, i64 64
  %36 = load ptr, ptr %xio_ofp, align 8
  %tobool73.not = icmp eq ptr %36, null
  br i1 %tobool73.not, label %cond.false80, label %cond.end82

cond.false80:                                     ; preds = %land.lhs.true68, %land.lhs.true65, %land.lhs.true, %if.then59
  %call81 = tail call ptr @Perl_PerlIO_stderr() #7
  br label %cond.end82

cond.end82:                                       ; preds = %land.lhs.true68, %cond.false80
  %cond83 = phi ptr [ %call81, %cond.false80 ], [ %36, %land.lhs.true68 ]
  %call84 = tail call signext i32 (ptr, ptr, ...) @PerlIO_printf(ptr noundef %cond83, ptr noundef nonnull @.str.1) #7
  tail call void @Perl_my_exit(i32 noundef signext 1) #7
  br label %if.end85

if.end85:                                         ; preds = %cond.end82, %while.end
  %37 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast86 = ptrtoint ptr %27 to i64
  %sub.ptr.rhs.cast87 = ptrtoint ptr %37 to i64
  %sub.ptr.sub88 = sub i64 %sub.ptr.lhs.cast86, %sub.ptr.rhs.cast87
  %sub.ptr.div89 = ashr exact i64 %sub.ptr.sub88, 3
  %38 = load ptr, ptr @PL_curstack, align 8
  %39 = load ptr, ptr %38, align 8
  %xav_fill91 = getelementptr inbounds i8, ptr %39, i64 8
  store i64 %sub.ptr.div89, ptr %xav_fill91, align 8
  %40 = load ptr, ptr %29, align 8
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr @PL_stack_base, align 8
  %43 = load ptr, ptr %29, align 8
  %44 = load ptr, ptr %43, align 8
  %xav_max97 = getelementptr inbounds i8, ptr %44, i64 16
  %45 = load i64, ptr %xav_max97, align 8
  %add.ptr98 = getelementptr inbounds ptr, ptr %42, i64 %45
  store ptr %add.ptr98, ptr @PL_stack_max, align 8
  %46 = load ptr, ptr %29, align 8
  %47 = load ptr, ptr %46, align 8
  %xav_fill101 = getelementptr inbounds i8, ptr %47, i64 8
  %48 = load i64, ptr %xav_fill101, align 8
  %add.ptr102 = getelementptr inbounds ptr, ptr %42, i64 %48
  store ptr %add.ptr102, ptr @PL_stack_sp, align 8
  %49 = load ptr, ptr %29, align 8
  store ptr %49, ptr @PL_curstack, align 8
  store ptr %29, ptr @PL_curstackinfo, align 8
  br label %cleanup

if.end106:                                        ; preds = %if.end3, %cond.end
  %cmp107 = icmp slt i32 %num, 1
  br i1 %cmp107, label %cleanup, label %if.end110

if.end110:                                        ; preds = %if.end106
  %50 = load ptr, ptr %av, align 8
  %xav_flags = getelementptr inbounds i8, ptr %50, i64 72
  %51 = load i8, ptr %xav_flags, align 8
  %52 = and i8 %51, 3
  %or.cond.not = icmp eq i8 %52, 2
  br i1 %or.cond.not, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end110
  tail call void @Perl_av_reify(ptr noundef nonnull %av)
  %.pre278 = load ptr, ptr %av, align 8
  br label %if.end122

if.end122:                                        ; preds = %if.then121, %if.end110
  %53 = phi ptr [ %.pre278, %if.then121 ], [ %50, %if.end110 ]
  %54 = load ptr, ptr %53, align 8
  %xav_alloc = getelementptr inbounds i8, ptr %53, i64 56
  %55 = load ptr, ptr %xav_alloc, align 8
  %sub.ptr.lhs.cast126 = ptrtoint ptr %54 to i64
  %sub.ptr.rhs.cast127 = ptrtoint ptr %55 to i64
  %sub.ptr.sub128 = sub i64 %sub.ptr.lhs.cast126, %sub.ptr.rhs.cast127
  %sub.ptr.div129 = lshr exact i64 %sub.ptr.sub128, 3
  %conv130 = trunc i64 %sub.ptr.div129 to i32
  %tobool131.not = icmp eq i32 %conv130, 0
  br i1 %tobool131.not, label %if.then151, label %if.end149

if.end149:                                        ; preds = %if.end122
  %spec.select = tail call i32 @llvm.smin.i32(i32 %conv130, i32 %num)
  %sub = sub nsw i32 %num, %spec.select
  %conv137 = sext i32 %spec.select to i64
  %xav_max139 = getelementptr inbounds i8, ptr %53, i64 16
  %56 = load i64, ptr %xav_max139, align 8
  %add140 = add nsw i64 %56, %conv137
  store i64 %add140, ptr %xav_max139, align 8
  %57 = load ptr, ptr %av, align 8
  %xav_fill143 = getelementptr inbounds i8, ptr %57, i64 8
  %58 = load i64, ptr %xav_fill143, align 8
  %add144 = add nsw i64 %58, %conv137
  store i64 %add144, ptr %xav_fill143, align 8
  %59 = load ptr, ptr %av, align 8
  %60 = load ptr, ptr %59, align 8
  %idx.neg = sub nsw i64 0, %conv137
  %add.ptr147 = getelementptr inbounds ptr, ptr %60, i64 %idx.neg
  store ptr %add.ptr147, ptr %59, align 8
  %tobool150.not = icmp eq i32 %sub, 0
  br i1 %tobool150.not, label %cleanup, label %if.end149.if.then151_crit_edge

if.end149.if.then151_crit_edge:                   ; preds = %if.end149
  %.pre279 = load ptr, ptr %av, align 8
  br label %if.then151

if.then151:                                       ; preds = %if.end149.if.then151_crit_edge, %if.end122
  %61 = phi ptr [ %.pre279, %if.end149.if.then151_crit_edge ], [ %53, %if.end122 ]
  %num.addr.1272 = phi i32 [ %sub, %if.end149.if.then151_crit_edge ], [ %num, %if.end122 ]
  %xav_fill153 = getelementptr inbounds i8, ptr %61, i64 8
  %62 = load i64, ptr %xav_fill153, align 8
  %conv154 = trunc i64 %62 to i32
  %cond160 = tail call i32 @llvm.smax.i32(i32 %conv154, i32 0)
  %add161 = add nsw i32 %cond160, %num.addr.1272
  %add162 = add nsw i32 %add161, %conv154
  tail call void @Perl_av_extend(ptr noundef nonnull %av, i32 noundef signext %add162)
  %conv163 = sext i32 %add161 to i64
  %63 = load ptr, ptr %av, align 8
  %xav_fill165 = getelementptr inbounds i8, ptr %63, i64 8
  %64 = load i64, ptr %xav_fill165, align 8
  %add166 = add nsw i64 %64, %conv163
  store i64 %add166, ptr %xav_fill165, align 8
  %65 = load ptr, ptr %av, align 8
  %66 = load ptr, ptr %65, align 8
  %add.ptr170 = getelementptr inbounds ptr, ptr %66, i64 %conv163
  %add171 = shl i64 %62, 32
  %sext = add i64 %add171, 4294967296
  %mul = ashr exact i64 %sext, 29
  tail call void @llvm.memmove.p0.p0.i64(ptr align 1 %add.ptr170, ptr align 1 %66, i64 %mul, i1 false)
  %67 = sext i32 %num.addr.1272 to i64
  %68 = zext nneg i32 %cond160 to i64
  %69 = add nsw i64 %67, %68
  br label %do.body

do.body:                                          ; preds = %do.body, %if.then151
  %indvars.iv = phi i64 [ %indvars.iv.next, %do.body ], [ %69, %if.then151 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds ptr, ptr %66, i64 %indvars.iv.next
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  %tobool174.not = icmp eq i64 %indvars.iv.next, 0
  br i1 %tobool174.not, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  %70 = load ptr, ptr %av, align 8
  %xav_max177 = getelementptr inbounds i8, ptr %70, i64 16
  %71 = load i64, ptr %xav_max177, align 8
  %sub178 = sub nsw i64 %71, %68
  store i64 %sub178, ptr %xav_max177, align 8
  %72 = load ptr, ptr %av, align 8
  %xav_fill181 = getelementptr inbounds i8, ptr %72, i64 8
  %73 = load i64, ptr %xav_fill181, align 8
  %sub182 = sub nsw i64 %73, %68
  store i64 %sub182, ptr %xav_fill181, align 8
  %74 = load ptr, ptr %av, align 8
  %75 = load ptr, ptr %74, align 8
  %add.ptr186 = getelementptr inbounds ptr, ptr %75, i64 %68
  store ptr %add.ptr186, ptr %74, align 8
  br label %cleanup

cleanup:                                          ; preds = %if.end149, %do.end, %if.end106, %entry, %if.end85
  ret void
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_av_shift(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 8388608
  %tobool2.not = icmp eq i32 %and, 0
  br i1 %tobool2.not, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %1 = phi i32 [ %.pre, %if.then3 ], [ %0, %if.end ]
  %and6 = and i32 %1, 32768
  %tobool7.not = icmp eq i32 %and6, 0
  br i1 %tobool7.not, label %if.end108, label %cond.end

cond.end:                                         ; preds = %if.end4
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool8.not = icmp eq ptr %call, null
  br i1 %tobool8.not, label %cond.end.if.end108_crit_edge, label %if.then9

cond.end.if.end108_crit_edge:                     ; preds = %cond.end
  %.pre197 = load i32, ptr %sv_flags, align 4
  br label %if.end108

if.then9:                                         ; preds = %cond.end
  %2 = load ptr, ptr @PL_stack_sp, align 8
  %3 = load ptr, ptr @PL_curstackinfo, align 8
  %si_next = getelementptr inbounds i8, ptr %3, i64 40
  %4 = load ptr, ptr %si_next, align 8
  %tobool10.not = icmp eq ptr %4, null
  br i1 %tobool10.not, label %if.then11, label %if.end14

if.then11:                                        ; preds = %if.then9
  %call12 = tail call ptr @Perl_new_stackinfo(i32 noundef signext 32, i32 noundef signext 13) #7
  %5 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev = getelementptr inbounds i8, ptr %call12, i64 32
  store ptr %5, ptr %si_prev, align 8
  %si_next13 = getelementptr inbounds i8, ptr %5, i64 40
  store ptr %call12, ptr %si_next13, align 8
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %if.then9
  %next.0 = phi ptr [ %4, %if.then9 ], [ %call12, %if.then11 ]
  %si_type = getelementptr inbounds i8, ptr %next.0, i64 24
  store i32 2, ptr %si_type, align 8
  %si_cxix = getelementptr inbounds i8, ptr %next.0, i64 16
  store i32 -1, ptr %si_cxix, align 8
  %6 = load ptr, ptr %next.0, align 8
  %7 = load ptr, ptr %6, align 8
  %xav_fill = getelementptr inbounds i8, ptr %7, i64 8
  store i64 0, ptr %xav_fill, align 8
  %8 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast = ptrtoint ptr %2 to i64
  %sub.ptr.rhs.cast = ptrtoint ptr %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3
  %9 = load ptr, ptr @PL_curstack, align 8
  %10 = load ptr, ptr %9, align 8
  %xav_fill16 = getelementptr inbounds i8, ptr %10, i64 8
  store i64 %sub.ptr.div, ptr %xav_fill16, align 8
  %11 = load ptr, ptr %next.0, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr @PL_stack_base, align 8
  %14 = load ptr, ptr %next.0, align 8
  %15 = load ptr, ptr %14, align 8
  %xav_max = getelementptr inbounds i8, ptr %15, i64 16
  %16 = load i64, ptr %xav_max, align 8
  %add.ptr = getelementptr inbounds ptr, ptr %13, i64 %16
  store ptr %add.ptr, ptr @PL_stack_max, align 8
  %17 = load ptr, ptr %next.0, align 8
  %18 = load ptr, ptr %17, align 8
  %xav_fill23 = getelementptr inbounds i8, ptr %18, i64 8
  %19 = load i64, ptr %xav_fill23, align 8
  %add.ptr24 = getelementptr inbounds ptr, ptr %13, i64 %19
  store ptr %add.ptr24, ptr @PL_stack_sp, align 8
  %20 = load ptr, ptr %next.0, align 8
  store ptr %20, ptr @PL_curstack, align 8
  store ptr %next.0, ptr @PL_curstackinfo, align 8
  %21 = load ptr, ptr @PL_markstack_ptr, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %21, i64 4
  store ptr %incdec.ptr, ptr @PL_markstack_ptr, align 8
  %22 = load ptr, ptr @PL_markstack_max, align 8
  %cmp = icmp eq ptr %incdec.ptr, %22
  br i1 %cmp, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end14
  tail call void @Perl_markstack_grow() #7
  %.pre195 = load ptr, ptr @PL_stack_base, align 8
  %.pre196 = load ptr, ptr @PL_markstack_ptr, align 8
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end14
  %23 = phi ptr [ %.pre196, %if.then26 ], [ %incdec.ptr, %if.end14 ]
  %24 = phi ptr [ %.pre195, %if.then26 ], [ %13, %if.end14 ]
  %sub.ptr.lhs.cast29 = ptrtoint ptr %add.ptr24 to i64
  %sub.ptr.rhs.cast30 = ptrtoint ptr %24 to i64
  %sub.ptr.sub31 = sub i64 %sub.ptr.lhs.cast29, %sub.ptr.rhs.cast30
  %sub.ptr.div32 = lshr exact i64 %sub.ptr.sub31, 3
  %conv = trunc i64 %sub.ptr.div32 to i32
  store i32 %conv, ptr %23, align 4
  %25 = load ptr, ptr @PL_stack_max, align 8
  %sub.ptr.lhs.cast33 = ptrtoint ptr %25 to i64
  %sub.ptr.sub35 = sub i64 %sub.ptr.lhs.cast33, %sub.ptr.lhs.cast29
  %cmp37 = icmp slt i64 %sub.ptr.sub35, 8
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.end27
  %call40 = tail call ptr @Perl_stack_grow(ptr noundef %add.ptr24, ptr noundef %add.ptr24, i32 noundef signext 1) #7
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.end27
  %sp.0 = phi ptr [ %call40, %if.then39 ], [ %add.ptr24, %if.end27 ]
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %26 = load ptr, ptr %mg_obj, align 8
  %tobool43.not = icmp eq ptr %26, null
  br i1 %tobool43.not, label %cond.false46, label %cond.end49

cond.false46:                                     ; preds = %if.end41
  %call47 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call48 = tail call ptr @Perl_sv_2mortal(ptr noundef %call47) #7
  br label %cond.end49

cond.end49:                                       ; preds = %if.end41, %cond.false46
  %cond50 = phi ptr [ %call48, %cond.false46 ], [ %26, %if.end41 ]
  %incdec.ptr51 = getelementptr inbounds i8, ptr %sp.0, i64 8
  store ptr %cond50, ptr %incdec.ptr51, align 8
  store ptr %incdec.ptr51, ptr @PL_stack_sp, align 8
  tail call void @Perl_push_scope() #7
  %call52 = tail call signext i32 @Perl_call_method(ptr noundef nonnull @.str.6, i32 noundef signext 0) #7
  %tobool53.not = icmp eq i32 %call52, 0
  br i1 %tobool53.not, label %if.end57, label %if.then54

if.then54:                                        ; preds = %cond.end49
  %27 = load ptr, ptr @PL_stack_sp, align 8
  %incdec.ptr55 = getelementptr inbounds i8, ptr %27, i64 -8
  store ptr %incdec.ptr55, ptr @PL_stack_sp, align 8
  %28 = load ptr, ptr %27, align 8
  %call56 = tail call ptr @Perl_newSVsv(ptr noundef %28) #7
  br label %if.end57

if.end57:                                         ; preds = %cond.end49, %if.then54
  %retval1.0 = phi ptr [ %call56, %if.then54 ], [ @PL_sv_undef, %cond.end49 ]
  tail call void @Perl_pop_scope() #7
  %29 = load ptr, ptr @PL_stack_sp, align 8
  %30 = load ptr, ptr @PL_curstackinfo, align 8
  %si_prev59 = getelementptr inbounds i8, ptr %30, i64 32
  %31 = load ptr, ptr %si_prev59, align 8
  %tobool60.not = icmp eq ptr %31, null
  br i1 %tobool60.not, label %if.then61, label %if.end87

if.then61:                                        ; preds = %if.end57
  %32 = load ptr, ptr @PL_stderrgv, align 8
  %tobool62.not = icmp eq ptr %32, null
  br i1 %tobool62.not, label %cond.false82, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then61
  %sv_flags63 = getelementptr inbounds i8, ptr %32, i64 12
  %33 = load i32, ptr %sv_flags63, align 4
  %and64 = and i32 %33, 255
  %cmp65 = icmp eq i32 %and64, 13
  br i1 %cmp65, label %land.lhs.true67, label %cond.false82

land.lhs.true67:                                  ; preds = %land.lhs.true
  %34 = load ptr, ptr %32, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %34, i64 56
  %35 = load ptr, ptr %xgv_gp, align 8
  %gp_io = getelementptr inbounds i8, ptr %35, i64 16
  %36 = load ptr, ptr %gp_io, align 8
  %tobool69.not = icmp eq ptr %36, null
  br i1 %tobool69.not, label %cond.false82, label %land.lhs.true70

land.lhs.true70:                                  ; preds = %land.lhs.true67
  %37 = load ptr, ptr %36, align 8
  %xio_ofp = getelementptr inbounds i8, ptr %37, i64 64
  %38 = load ptr, ptr %xio_ofp, align 8
  %tobool75.not = icmp eq ptr %38, null
  br i1 %tobool75.not, label %cond.false82, label %cond.end84

cond.false82:                                     ; preds = %land.lhs.true70, %land.lhs.true67, %land.lhs.true, %if.then61
  %call83 = tail call ptr @Perl_PerlIO_stderr() #7
  br label %cond.end84

cond.end84:                                       ; preds = %land.lhs.true70, %cond.false82
  %cond85 = phi ptr [ %call83, %cond.false82 ], [ %38, %land.lhs.true70 ]
  %call86 = tail call signext i32 (ptr, ptr, ...) @PerlIO_printf(ptr noundef %cond85, ptr noundef nonnull @.str.1) #7
  tail call void @Perl_my_exit(i32 noundef signext 1) #7
  br label %if.end87

if.end87:                                         ; preds = %cond.end84, %if.end57
  %39 = load ptr, ptr @PL_stack_base, align 8
  %sub.ptr.lhs.cast88 = ptrtoint ptr %29 to i64
  %sub.ptr.rhs.cast89 = ptrtoint ptr %39 to i64
  %sub.ptr.sub90 = sub i64 %sub.ptr.lhs.cast88, %sub.ptr.rhs.cast89
  %sub.ptr.div91 = ashr exact i64 %sub.ptr.sub90, 3
  %40 = load ptr, ptr @PL_curstack, align 8
  %41 = load ptr, ptr %40, align 8
  %xav_fill93 = getelementptr inbounds i8, ptr %41, i64 8
  store i64 %sub.ptr.div91, ptr %xav_fill93, align 8
  %42 = load ptr, ptr %31, align 8
  %43 = load ptr, ptr %42, align 8
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr @PL_stack_base, align 8
  %45 = load ptr, ptr %31, align 8
  %46 = load ptr, ptr %45, align 8
  %xav_max99 = getelementptr inbounds i8, ptr %46, i64 16
  %47 = load i64, ptr %xav_max99, align 8
  %add.ptr100 = getelementptr inbounds ptr, ptr %44, i64 %47
  store ptr %add.ptr100, ptr @PL_stack_max, align 8
  %48 = load ptr, ptr %31, align 8
  %49 = load ptr, ptr %48, align 8
  %xav_fill103 = getelementptr inbounds i8, ptr %49, i64 8
  %50 = load i64, ptr %xav_fill103, align 8
  %add.ptr104 = getelementptr inbounds ptr, ptr %44, i64 %50
  store ptr %add.ptr104, ptr @PL_stack_sp, align 8
  %51 = load ptr, ptr %31, align 8
  store ptr %51, ptr @PL_curstack, align 8
  store ptr %31, ptr @PL_curstackinfo, align 8
  br label %cleanup

if.end108:                                        ; preds = %cond.end.if.end108_crit_edge, %if.end4
  %52 = phi i32 [ %.pre197, %cond.end.if.end108_crit_edge ], [ %1, %if.end4 ]
  %and110 = and i32 %52, 32768
  %tobool111.not = icmp eq i32 %and110, 0
  br i1 %tobool111.not, label %cond.false115, label %cond.true112

cond.true112:                                     ; preds = %if.end108
  %call113 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  %conv114 = sext i32 %call113 to i64
  br label %cond.end118

cond.false115:                                    ; preds = %if.end108
  %53 = load ptr, ptr %av, align 8
  %xav_fill117 = getelementptr inbounds i8, ptr %53, i64 8
  %54 = load i64, ptr %xav_fill117, align 8
  br label %cond.end118

cond.end118:                                      ; preds = %cond.false115, %cond.true112
  %cond119 = phi i64 [ %conv114, %cond.true112 ], [ %54, %cond.false115 ]
  %cmp120 = icmp slt i64 %cond119, 0
  br i1 %cmp120, label %cleanup, label %if.end123

if.end123:                                        ; preds = %cond.end118
  %55 = load ptr, ptr %av, align 8
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %56, align 8
  %xav_flags = getelementptr inbounds i8, ptr %55, i64 72
  %58 = load i8, ptr %xav_flags, align 8
  %59 = and i8 %58, 1
  %tobool129.not = icmp eq i8 %59, 0
  br i1 %tobool129.not, label %if.end133, label %if.then130

if.then130:                                       ; preds = %if.end123
  store ptr @PL_sv_undef, ptr %56, align 8
  %.pre198 = load ptr, ptr %av, align 8
  %.pre199 = load ptr, ptr %.pre198, align 8
  br label %if.end133

if.end133:                                        ; preds = %if.then130, %if.end123
  %60 = phi ptr [ %.pre199, %if.then130 ], [ %56, %if.end123 ]
  %61 = phi ptr [ %.pre198, %if.then130 ], [ %55, %if.end123 ]
  %add.ptr136 = getelementptr inbounds i8, ptr %60, i64 8
  store ptr %add.ptr136, ptr %61, align 8
  %62 = load ptr, ptr %av, align 8
  %xav_max139 = getelementptr inbounds i8, ptr %62, i64 16
  %63 = load i64, ptr %xav_max139, align 8
  %dec = add nsw i64 %63, -1
  store i64 %dec, ptr %xav_max139, align 8
  %64 = load ptr, ptr %av, align 8
  %xav_fill141 = getelementptr inbounds i8, ptr %64, i64 8
  %65 = load i64, ptr %xav_fill141, align 8
  %dec142 = add nsw i64 %65, -1
  store i64 %dec142, ptr %xav_fill141, align 8
  %66 = load i32, ptr %sv_flags, align 4
  %and144 = and i32 %66, 16384
  %tobool145.not = icmp eq i32 %and144, 0
  br i1 %tobool145.not, label %cleanup, label %if.then146

if.then146:                                       ; preds = %if.end133
  %call147 = tail call signext i32 @Perl_mg_set(ptr noundef nonnull %av) #7
  br label %cleanup

cleanup:                                          ; preds = %if.end133, %if.then146, %cond.end118, %entry, %if.end87
  %retval.0 = phi ptr [ %retval1.0, %if.end87 ], [ @PL_sv_undef, %entry ], [ @PL_sv_undef, %cond.end118 ], [ %57, %if.then146 ], [ %57, %if.end133 ]
  ret ptr %retval.0
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local signext i32 @Perl_av_len(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool.not = icmp eq i32 %and, 0
  br i1 %tobool.not, label %cond.false, label %cond.true

cond.true:                                        ; preds = %entry
  %call = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load ptr, ptr %av, align 8
  %xav_fill = getelementptr inbounds i8, ptr %1, i64 8
  %2 = load i64, ptr %xav_fill, align 8
  %3 = trunc i64 %2 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %3, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_av_delete(ptr noundef %av, i32 noundef signext %key, i32 noundef signext %flags) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %cleanup212, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 8388608
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @PL_no_modify) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %1 = phi i32 [ %.pre, %if.then2 ], [ %0, %if.end ]
  %and5 = and i32 %1, 32768
  %tobool6.not = icmp eq i32 %and5, 0
  br i1 %tobool6.not, label %if.end122, label %if.then7

if.then7:                                         ; preds = %if.end3
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool8.not = icmp eq ptr %call, null
  br i1 %tobool8.not, label %lor.lhs.false, label %if.then11.thread

lor.lhs.false:                                    ; preds = %if.then7
  %call9 = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 68) #7
  %tobool10.not = icmp eq ptr %call9, null
  br i1 %tobool10.not, label %if.end122, label %if.then11

if.then11:                                        ; preds = %lor.lhs.false
  %cmp = icmp slt i32 %key, 0
  br i1 %cmp, label %if.then87, label %if.end106

if.then11.thread:                                 ; preds = %if.then7
  %cmp275 = icmp slt i32 %key, 0
  br i1 %cmp275, label %if.then14, label %if.end106

if.then14:                                        ; preds = %if.then11.thread
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %2 = load ptr, ptr %mg_obj, align 8
  %tobool15.not = icmp eq ptr %2, null
  br i1 %tobool15.not, label %cond.false, label %cond.end

cond.false:                                       ; preds = %if.then14
  %call17 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call18 = tail call ptr @Perl_sv_2mortal(ptr noundef %call17) #7
  br label %cond.end

cond.end:                                         ; preds = %if.then14, %cond.false
  %cond = phi ptr [ %call18, %cond.false ], [ %2, %if.then14 ]
  %3 = load ptr, ptr %cond, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %4, align 8
  %xmg_stash = getelementptr inbounds i8, ptr %5, i64 48
  %6 = load ptr, ptr %xmg_stash, align 8
  %call20 = tail call ptr @Perl_hv_fetch(ptr noundef %6, ptr noundef nonnull @.str.2, i32 noundef signext 16, i32 noundef signext 0) #7
  %tobool21.not = icmp eq ptr %call20, null
  br i1 %tobool21.not, label %if.then87, label %land.lhs.true

land.lhs.true:                                    ; preds = %cond.end
  %7 = load ptr, ptr %call20, align 8
  %8 = load ptr, ptr %7, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %8, i64 56
  %9 = load ptr, ptr %xgv_gp, align 8
  %10 = load ptr, ptr %9, align 8
  %tobool23.not = icmp eq ptr %10, null
  br i1 %tobool23.not, label %if.then87, label %cond.false25

cond.false25:                                     ; preds = %land.lhs.true
  %sv_flags29 = getelementptr inbounds i8, ptr %10, i64 12
  %11 = load i32, ptr %sv_flags29, align 4
  %and30 = and i32 %11, 262144
  %tobool31.not = icmp eq i32 %and30, 0
  br i1 %tobool31.not, label %cond.false48, label %cond.true32

cond.true32:                                      ; preds = %cond.false25
  %12 = load ptr, ptr %10, align 8
  store ptr %12, ptr @PL_Xpv, align 8
  %tobool37.not = icmp eq ptr %12, null
  br i1 %tobool37.not, label %if.then87, label %land.lhs.true38

land.lhs.true38:                                  ; preds = %cond.true32
  %xpv_cur = getelementptr inbounds i8, ptr %12, i64 8
  %13 = load i64, ptr %xpv_cur, align 8
  %cmp39 = icmp ugt i64 %13, 1
  br i1 %cmp39, label %if.end106, label %lor.lhs.false40

lor.lhs.false40:                                  ; preds = %land.lhs.true38
  %tobool42.not = icmp eq i64 %13, 0
  br i1 %tobool42.not, label %if.then87, label %land.lhs.true43

land.lhs.true43:                                  ; preds = %lor.lhs.false40
  %14 = load ptr, ptr %12, align 8
  %15 = load i8, ptr %14, align 1
  %cmp44.not = icmp eq i8 %15, 48
  br i1 %cmp44.not, label %if.then87, label %if.end106

cond.false48:                                     ; preds = %cond.false25
  %and53 = and i32 %11, 65536
  %tobool54.not = icmp eq i32 %and53, 0
  br i1 %tobool54.not, label %cond.false62, label %cond.true55

cond.true55:                                      ; preds = %cond.false48
  %16 = load ptr, ptr %10, align 8
  %xiv_iv = getelementptr inbounds i8, ptr %16, i64 24
  %17 = load i64, ptr %xiv_iv, align 8
  %cmp60.not = icmp eq i64 %17, 0
  br i1 %cmp60.not, label %if.then87, label %if.end106

cond.false62:                                     ; preds = %cond.false48
  %and67 = and i32 %11, 131072
  %tobool68.not = icmp eq i32 %and67, 0
  br i1 %tobool68.not, label %cond.false76, label %cond.true69

cond.true69:                                      ; preds = %cond.false62
  %18 = load ptr, ptr %10, align 8
  %xnv_nv = getelementptr inbounds i8, ptr %18, i64 32
  %19 = load double, ptr %xnv_nv, align 8
  %cmp74 = fcmp une double %19, 0.000000e+00
  br i1 %cmp74, label %if.end106, label %if.then87

cond.false76:                                     ; preds = %cond.false62
  %call80 = tail call zeroext i8 @Perl_sv_2bool(ptr noundef nonnull %10) #7
  %tobool82.not = icmp eq i8 %call80, 0
  br i1 %tobool82.not, label %if.then87, label %if.end106

if.then87:                                        ; preds = %land.lhs.true43, %lor.lhs.false40, %cond.true32, %cond.true55, %cond.true69, %cond.false76, %land.lhs.true, %cond.end, %if.then11
  %20 = load i32, ptr %sv_flags, align 4
  %and89 = and i32 %20, 32768
  %tobool90.not = icmp eq i32 %and89, 0
  br i1 %tobool90.not, label %cond.false94, label %cond.true91

cond.true91:                                      ; preds = %if.then87
  %call92 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cleanup

cond.false94:                                     ; preds = %if.then87
  %21 = load ptr, ptr %av, align 8
  %xav_fill = getelementptr inbounds i8, ptr %21, i64 8
  %22 = load i64, ptr %xav_fill, align 8
  %23 = trunc i64 %22 to i32
  br label %cleanup

cleanup:                                          ; preds = %cond.true91, %cond.false94
  %cond97 = phi i32 [ %call92, %cond.true91 ], [ %23, %cond.false94 ]
  %24 = add nsw i32 %key, 1
  %conv100 = add i32 %24, %cond97
  %cmp101 = icmp sgt i32 %conv100, -1
  br i1 %cmp101, label %if.end106, label %cleanup212

if.end106:                                        ; preds = %land.lhs.true38, %land.lhs.true43, %cond.false76, %cond.true69, %cond.true55, %if.then11.thread, %cleanup, %if.then11
  %key.addr.2 = phi i32 [ %conv100, %cleanup ], [ %key, %if.then11 ], [ %key, %if.then11.thread ], [ %key, %cond.true55 ], [ %key, %cond.true69 ], [ %key, %cond.false76 ], [ %key, %land.lhs.true43 ], [ %key, %land.lhs.true38 ]
  %call107 = tail call ptr @Perl_av_fetch(ptr noundef nonnull %av, i32 noundef signext %key.addr.2, i32 noundef signext 1)
  %tobool108.not = icmp eq ptr %call107, null
  br i1 %tobool108.not, label %if.end122, label %if.then109

if.then109:                                       ; preds = %if.end106
  %25 = load ptr, ptr %call107, align 8
  %call110 = tail call signext i32 @Perl_mg_clear(ptr noundef %25) #7
  %call111 = tail call ptr @Perl_mg_find(ptr noundef %25, i32 noundef signext 112) #7
  %tobool112.not = icmp eq ptr %call111, null
  br i1 %tobool112.not, label %cleanup212, label %if.then113

if.then113:                                       ; preds = %if.then109
  %call114 = tail call signext i32 @Perl_sv_unmagic(ptr noundef %25, i32 noundef signext 112) #7
  br label %cleanup212

if.end122:                                        ; preds = %if.end106, %lor.lhs.false, %if.end3
  %key.addr.5 = phi i32 [ %key, %if.end3 ], [ %key.addr.2, %if.end106 ], [ %key, %lor.lhs.false ]
  %cmp123 = icmp slt i32 %key.addr.5, 0
  br i1 %cmp123, label %if.then125, label %if.end145

if.then125:                                       ; preds = %if.end122
  %26 = load i32, ptr %sv_flags, align 4
  %and127 = and i32 %26, 32768
  %tobool128.not = icmp eq i32 %and127, 0
  br i1 %tobool128.not, label %cond.false132, label %cond.true129

cond.true129:                                     ; preds = %if.then125
  %call130 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cond.end135

cond.false132:                                    ; preds = %if.then125
  %27 = load ptr, ptr %av, align 8
  %xav_fill134 = getelementptr inbounds i8, ptr %27, i64 8
  %28 = load i64, ptr %xav_fill134, align 8
  %29 = trunc i64 %28 to i32
  br label %cond.end135

cond.end135:                                      ; preds = %cond.false132, %cond.true129
  %cond136 = phi i32 [ %call130, %cond.true129 ], [ %29, %cond.false132 ]
  %30 = add nsw i32 %key.addr.5, 1
  %conv140 = add i32 %30, %cond136
  %cmp141 = icmp slt i32 %conv140, 0
  br i1 %cmp141, label %cleanup212, label %if.end145

if.end145:                                        ; preds = %cond.end135, %if.end122
  %key.addr.6 = phi i32 [ %conv140, %cond.end135 ], [ %key.addr.5, %if.end122 ]
  %conv146 = zext nneg i32 %key.addr.6 to i64
  %31 = load ptr, ptr %av, align 8
  %xav_fill148 = getelementptr inbounds i8, ptr %31, i64 8
  %32 = load i64, ptr %xav_fill148, align 8
  %cmp149 = icmp slt i64 %32, %conv146
  br i1 %cmp149, label %cleanup212, label %if.else

if.else:                                          ; preds = %if.end145
  %xav_flags = getelementptr inbounds i8, ptr %31, i64 72
  %33 = load i8, ptr %xav_flags, align 8
  %34 = and i8 %33, 3
  %or.cond.not = icmp eq i8 %34, 2
  br i1 %or.cond.not, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.else
  tail call void @Perl_av_reify(ptr noundef nonnull %av)
  %.pre283 = load ptr, ptr %av, align 8
  %xav_fill167.phi.trans.insert = getelementptr inbounds i8, ptr %.pre283, i64 8
  %.pre284 = load i64, ptr %xav_fill167.phi.trans.insert, align 8
  br label %if.end163

if.end163:                                        ; preds = %if.then162, %if.else
  %35 = phi i64 [ %.pre284, %if.then162 ], [ %32, %if.else ]
  %36 = phi ptr [ %.pre283, %if.then162 ], [ %31, %if.else ]
  %37 = load ptr, ptr %36, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %37, i64 %conv146
  %38 = load ptr, ptr %arrayidx, align 8
  %cmp168 = icmp eq i64 %35, %conv146
  store ptr @PL_sv_undef, ptr %arrayidx, align 8
  br i1 %cmp168, label %if.then170, label %if.end191

if.then170:                                       ; preds = %if.end163
  %.pre285 = load ptr, ptr %av, align 8
  br label %do.body

do.body:                                          ; preds = %land.rhs, %if.then170
  %39 = phi ptr [ %41, %land.rhs ], [ %.pre285, %if.then170 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %land.rhs ], [ %conv146, %if.then170 ]
  %xav_fill176 = getelementptr inbounds i8, ptr %39, i64 8
  %40 = load i64, ptr %xav_fill176, align 8
  %dec = add nsw i64 %40, -1
  store i64 %dec, ptr %xav_fill176, align 8
  %cmp178 = icmp sgt i64 %indvars.iv, 0
  br i1 %cmp178, label %land.rhs, label %if.end191

land.rhs:                                         ; preds = %do.body
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %41 = load ptr, ptr %av, align 8
  %42 = load ptr, ptr %41, align 8
  %arrayidx183 = getelementptr inbounds ptr, ptr %42, i64 %indvars.iv.next
  %43 = load ptr, ptr %arrayidx183, align 8
  %cmp184 = icmp eq ptr %43, @PL_sv_undef
  br i1 %cmp184, label %do.body, label %if.end191

if.end191:                                        ; preds = %do.body, %land.rhs, %if.end163
  %44 = load i32, ptr %sv_flags, align 4
  %and193 = and i32 %44, 16384
  %tobool194.not = icmp eq i32 %and193, 0
  br i1 %tobool194.not, label %if.end198, label %if.then195

if.then195:                                       ; preds = %if.end191
  %call196 = tail call signext i32 @Perl_mg_set(ptr noundef nonnull %av) #7
  br label %if.end198

if.end198:                                        ; preds = %if.end191, %if.then195
  %and199 = and i32 %flags, 2
  %tobool200.not = icmp eq i32 %and199, 0
  br i1 %tobool200.not, label %if.else202, label %if.then201

if.then201:                                       ; preds = %if.end198
  tail call void @Perl_sv_free(ptr noundef %38) #7
  br label %cleanup212

if.else202:                                       ; preds = %if.end198
  %45 = load ptr, ptr %av, align 8
  %xav_flags204 = getelementptr inbounds i8, ptr %45, i64 72
  %46 = load i8, ptr %xav_flags204, align 8
  %47 = and i8 %46, 1
  %tobool207.not = icmp eq i8 %47, 0
  br i1 %tobool207.not, label %cleanup212, label %if.then208

if.then208:                                       ; preds = %if.else202
  %call209 = tail call ptr @Perl_sv_2mortal(ptr noundef %38) #7
  br label %cleanup212

cleanup212:                                       ; preds = %if.then109, %cleanup, %if.then113, %if.then201, %if.then208, %if.else202, %if.end145, %cond.end135, %entry
  %retval.4 = phi ptr [ null, %entry ], [ null, %cond.end135 ], [ null, %if.end145 ], [ null, %if.then201 ], [ %call209, %if.then208 ], [ %38, %if.else202 ], [ null, %if.then109 ], [ null, %cleanup ], [ %25, %if.then113 ]
  ret ptr %retval.4
}

declare signext i32 @Perl_sv_unmagic(ptr noundef, i32 noundef signext) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local zeroext i8 @Perl_av_exists(ptr noundef %av, i32 noundef signext %key) local_unnamed_addr #2 {
entry:
  %tobool.not = icmp eq ptr %av, null
  br i1 %tobool.not, label %return, label %if.end

if.end:                                           ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %av, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 32768
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end168, label %if.then2

if.then2:                                         ; preds = %if.end
  %call = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 80) #7
  %tobool3.not = icmp eq ptr %call, null
  br i1 %tobool3.not, label %lor.lhs.false, label %if.then6.thread

lor.lhs.false:                                    ; preds = %if.then2
  %call4 = tail call ptr @Perl_mg_find(ptr noundef nonnull %av, i32 noundef signext 68) #7
  %tobool5.not = icmp eq ptr %call4, null
  br i1 %tobool5.not, label %if.end168, label %if.then6

if.then6:                                         ; preds = %lor.lhs.false
  %call7 = tail call ptr @Perl_sv_newmortal() #7
  %cmp = icmp slt i32 %key, 0
  br i1 %cmp, label %if.then83, label %if.end102

if.then6.thread:                                  ; preds = %if.then2
  %call7264 = tail call ptr @Perl_sv_newmortal() #7
  %cmp265 = icmp slt i32 %key, 0
  br i1 %cmp265, label %if.then10, label %if.end102

if.then10:                                        ; preds = %if.then6.thread
  %mg_obj = getelementptr inbounds i8, ptr %call, i64 24
  %1 = load ptr, ptr %mg_obj, align 8
  %tobool11.not = icmp eq ptr %1, null
  br i1 %tobool11.not, label %cond.false, label %cond.end

cond.false:                                       ; preds = %if.then10
  %call13 = tail call ptr @Perl_newRV(ptr noundef nonnull %av) #7
  %call14 = tail call ptr @Perl_sv_2mortal(ptr noundef %call13) #7
  br label %cond.end

cond.end:                                         ; preds = %if.then10, %cond.false
  %cond = phi ptr [ %call14, %cond.false ], [ %1, %if.then10 ]
  %2 = load ptr, ptr %cond, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %xmg_stash = getelementptr inbounds i8, ptr %4, i64 48
  %5 = load ptr, ptr %xmg_stash, align 8
  %call16 = tail call ptr @Perl_hv_fetch(ptr noundef %5, ptr noundef nonnull @.str.2, i32 noundef signext 16, i32 noundef signext 0) #7
  %tobool17.not = icmp eq ptr %call16, null
  br i1 %tobool17.not, label %if.then83, label %land.lhs.true

land.lhs.true:                                    ; preds = %cond.end
  %6 = load ptr, ptr %call16, align 8
  %7 = load ptr, ptr %6, align 8
  %xgv_gp = getelementptr inbounds i8, ptr %7, i64 56
  %8 = load ptr, ptr %xgv_gp, align 8
  %9 = load ptr, ptr %8, align 8
  %tobool19.not = icmp eq ptr %9, null
  br i1 %tobool19.not, label %if.then83, label %cond.false21

cond.false21:                                     ; preds = %land.lhs.true
  %sv_flags25 = getelementptr inbounds i8, ptr %9, i64 12
  %10 = load i32, ptr %sv_flags25, align 4
  %and26 = and i32 %10, 262144
  %tobool27.not = icmp eq i32 %and26, 0
  br i1 %tobool27.not, label %cond.false44, label %cond.true28

cond.true28:                                      ; preds = %cond.false21
  %11 = load ptr, ptr %9, align 8
  store ptr %11, ptr @PL_Xpv, align 8
  %tobool33.not = icmp eq ptr %11, null
  br i1 %tobool33.not, label %if.then83, label %land.lhs.true34

land.lhs.true34:                                  ; preds = %cond.true28
  %xpv_cur = getelementptr inbounds i8, ptr %11, i64 8
  %12 = load i64, ptr %xpv_cur, align 8
  %cmp35 = icmp ugt i64 %12, 1
  br i1 %cmp35, label %if.end102, label %lor.lhs.false36

lor.lhs.false36:                                  ; preds = %land.lhs.true34
  %tobool38.not = icmp eq i64 %12, 0
  br i1 %tobool38.not, label %if.then83, label %land.lhs.true39

land.lhs.true39:                                  ; preds = %lor.lhs.false36
  %13 = load ptr, ptr %11, align 8
  %14 = load i8, ptr %13, align 1
  %cmp40.not = icmp eq i8 %14, 48
  br i1 %cmp40.not, label %if.then83, label %if.end102

cond.false44:                                     ; preds = %cond.false21
  %and49 = and i32 %10, 65536
  %tobool50.not = icmp eq i32 %and49, 0
  br i1 %tobool50.not, label %cond.false58, label %cond.true51

cond.true51:                                      ; preds = %cond.false44
  %15 = load ptr, ptr %9, align 8
  %xiv_iv = getelementptr inbounds i8, ptr %15, i64 24
  %16 = load i64, ptr %xiv_iv, align 8
  %cmp56.not = icmp eq i64 %16, 0
  br i1 %cmp56.not, label %if.then83, label %if.end102

cond.false58:                                     ; preds = %cond.false44
  %and63 = and i32 %10, 131072
  %tobool64.not = icmp eq i32 %and63, 0
  br i1 %tobool64.not, label %cond.false72, label %cond.true65

cond.true65:                                      ; preds = %cond.false58
  %17 = load ptr, ptr %9, align 8
  %xnv_nv = getelementptr inbounds i8, ptr %17, i64 32
  %18 = load double, ptr %xnv_nv, align 8
  %cmp70 = fcmp une double %18, 0.000000e+00
  br i1 %cmp70, label %if.end102, label %if.then83

cond.false72:                                     ; preds = %cond.false58
  %call76 = tail call zeroext i8 @Perl_sv_2bool(ptr noundef nonnull %9) #7
  %tobool78.not = icmp eq i8 %call76, 0
  br i1 %tobool78.not, label %if.then83, label %if.end102

if.then83:                                        ; preds = %land.lhs.true39, %lor.lhs.false36, %cond.true28, %cond.true51, %cond.true65, %cond.false72, %land.lhs.true, %cond.end, %if.then6
  %call7267270.ph = phi ptr [ %call7, %if.then6 ], [ %call7264, %cond.end ], [ %call7264, %land.lhs.true ], [ %call7264, %cond.false72 ], [ %call7264, %cond.true65 ], [ %call7264, %cond.true51 ], [ %call7264, %cond.true28 ], [ %call7264, %lor.lhs.false36 ], [ %call7264, %land.lhs.true39 ]
  %19 = load i32, ptr %sv_flags, align 4
  %and85 = and i32 %19, 32768
  %tobool86.not = icmp eq i32 %and85, 0
  br i1 %tobool86.not, label %cond.false90, label %cond.true87

cond.true87:                                      ; preds = %if.then83
  %call88 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cleanup

cond.false90:                                     ; preds = %if.then83
  %20 = load ptr, ptr %av, align 8
  %xav_fill = getelementptr inbounds i8, ptr %20, i64 8
  %21 = load i64, ptr %xav_fill, align 8
  %22 = trunc i64 %21 to i32
  br label %cleanup

cleanup:                                          ; preds = %cond.true87, %cond.false90
  %cond93 = phi i32 [ %call88, %cond.true87 ], [ %22, %cond.false90 ]
  %23 = add nsw i32 %key, 1
  %conv96 = add i32 %23, %cond93
  %cmp97 = icmp sgt i32 %conv96, -1
  br i1 %cmp97, label %if.end102, label %return

if.end102:                                        ; preds = %land.lhs.true34, %land.lhs.true39, %cond.false72, %cond.true65, %cond.true51, %if.then6.thread, %cleanup, %if.then6
  %call7266 = phi ptr [ %call7267270.ph, %cleanup ], [ %call7, %if.then6 ], [ %call7264, %if.then6.thread ], [ %call7264, %cond.true51 ], [ %call7264, %cond.true65 ], [ %call7264, %cond.false72 ], [ %call7264, %land.lhs.true39 ], [ %call7264, %land.lhs.true34 ]
  %key.addr.2 = phi i32 [ %conv96, %cleanup ], [ %key, %if.then6 ], [ %key, %if.then6.thread ], [ %key, %cond.true51 ], [ %key, %cond.true65 ], [ %key, %cond.false72 ], [ %key, %land.lhs.true39 ], [ %key, %land.lhs.true34 ]
  %call103 = tail call signext i32 @Perl_mg_copy(ptr noundef nonnull %av, ptr noundef %call7266, ptr noundef null, i32 noundef signext %key.addr.2) #7
  %call104 = tail call ptr @Perl_mg_find(ptr noundef %call7266, i32 noundef signext 112) #7
  %tobool105.not = icmp eq ptr %call104, null
  br i1 %tobool105.not, label %if.end168, label %if.then106

if.then106:                                       ; preds = %if.end102
  %call107 = tail call signext i32 @Perl_magic_existspack(ptr noundef %call7266, ptr noundef nonnull %call104) #7
  %tobool108.not = icmp eq ptr %call7266, null
  br i1 %tobool108.not, label %return, label %cond.false110

cond.false110:                                    ; preds = %if.then106
  %sv_flags111 = getelementptr inbounds i8, ptr %call7266, i64 12
  %24 = load i32, ptr %sv_flags111, align 4
  %and112 = and i32 %24, 262144
  %tobool113.not = icmp eq i32 %and112, 0
  br i1 %tobool113.not, label %cond.false129, label %cond.true114

cond.true114:                                     ; preds = %cond.false110
  %25 = load ptr, ptr %call7266, align 8
  store ptr %25, ptr @PL_Xpv, align 8
  %tobool116.not = icmp eq ptr %25, null
  br i1 %tobool116.not, label %return, label %land.rhs

land.rhs:                                         ; preds = %cond.true114
  %xpv_cur117 = getelementptr inbounds i8, ptr %25, i64 8
  %26 = load i64, ptr %xpv_cur117, align 8
  %cmp118 = icmp ugt i64 %26, 1
  br i1 %cmp118, label %return, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %tobool121.not = icmp eq i64 %26, 0
  br i1 %tobool121.not, label %return, label %land.rhs122

land.rhs122:                                      ; preds = %lor.rhs
  %27 = load ptr, ptr %25, align 8
  %28 = load i8, ptr %27, align 1
  %cmp125 = icmp ne i8 %28, 48
  %29 = zext i1 %cmp125 to i8
  br label %return

cond.false129:                                    ; preds = %cond.false110
  %and131 = and i32 %24, 65536
  %tobool132.not = icmp eq i32 %and131, 0
  br i1 %tobool132.not, label %cond.false138, label %cond.true133

cond.true133:                                     ; preds = %cond.false129
  %30 = load ptr, ptr %call7266, align 8
  %xiv_iv135 = getelementptr inbounds i8, ptr %30, i64 24
  %31 = load i64, ptr %xiv_iv135, align 8
  %cmp136 = icmp ne i64 %31, 0
  %conv137 = zext i1 %cmp136 to i8
  br label %return

cond.false138:                                    ; preds = %cond.false129
  %and140 = and i32 %24, 131072
  %tobool141.not = icmp eq i32 %and140, 0
  br i1 %tobool141.not, label %cond.false147, label %cond.true142

cond.true142:                                     ; preds = %cond.false138
  %32 = load ptr, ptr %call7266, align 8
  %xnv_nv144 = getelementptr inbounds i8, ptr %32, i64 32
  %33 = load double, ptr %xnv_nv144, align 8
  %cmp145 = fcmp une double %33, 0.000000e+00
  %conv146 = zext i1 %cmp145 to i8
  br label %return

cond.false147:                                    ; preds = %cond.false138
  %call148 = tail call zeroext i8 @Perl_sv_2bool(ptr noundef nonnull %call7266) #7
  br label %return

if.end168:                                        ; preds = %if.end102, %lor.lhs.false, %if.end
  %key.addr.6 = phi i32 [ %key, %if.end ], [ %key.addr.2, %if.end102 ], [ %key, %lor.lhs.false ]
  %cmp169 = icmp slt i32 %key.addr.6, 0
  br i1 %cmp169, label %if.then171, label %if.end191

if.then171:                                       ; preds = %if.end168
  %34 = load i32, ptr %sv_flags, align 4
  %and173 = and i32 %34, 32768
  %tobool174.not = icmp eq i32 %and173, 0
  br i1 %tobool174.not, label %cond.false178, label %cond.true175

cond.true175:                                     ; preds = %if.then171
  %call176 = tail call signext i32 @Perl_mg_size(ptr noundef nonnull %av) #7
  br label %cond.end181

cond.false178:                                    ; preds = %if.then171
  %35 = load ptr, ptr %av, align 8
  %xav_fill180 = getelementptr inbounds i8, ptr %35, i64 8
  %36 = load i64, ptr %xav_fill180, align 8
  %37 = trunc i64 %36 to i32
  br label %cond.end181

cond.end181:                                      ; preds = %cond.false178, %cond.true175
  %cond182 = phi i32 [ %call176, %cond.true175 ], [ %37, %cond.false178 ]
  %38 = add nsw i32 %key.addr.6, 1
  %conv186 = add i32 %38, %cond182
  %cmp187 = icmp slt i32 %conv186, 0
  br i1 %cmp187, label %return, label %if.end191

if.end191:                                        ; preds = %cond.end181, %if.end168
  %key.addr.7 = phi i32 [ %conv186, %cond.end181 ], [ %key.addr.6, %if.end168 ]
  %conv192 = zext nneg i32 %key.addr.7 to i64
  %39 = load ptr, ptr %av, align 8
  %xav_fill194 = getelementptr inbounds i8, ptr %39, i64 8
  %40 = load i64, ptr %xav_fill194, align 8
  %cmp195.not = icmp slt i64 %40, %conv192
  br i1 %cmp195.not, label %if.else, label %land.lhs.true197

land.lhs.true197:                                 ; preds = %if.end191
  %41 = load ptr, ptr %39, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %41, i64 %conv192
  %42 = load ptr, ptr %arrayidx, align 8
  %cmp199.not = icmp eq ptr %42, @PL_sv_undef
  %tobool206.not = icmp eq ptr %42, null
  %or.cond = or i1 %cmp199.not, %tobool206.not
  br i1 %or.cond, label %if.else, label %return

if.else:                                          ; preds = %land.lhs.true197, %if.end191
  br label %return

return:                                           ; preds = %if.then106, %cond.true133, %cond.false147, %cond.true142, %land.rhs, %land.rhs122, %lor.rhs, %cond.true114, %cleanup, %land.lhs.true197, %cond.end181, %entry, %if.else
  %retval.5 = phi i8 [ 0, %if.else ], [ 0, %entry ], [ 0, %cond.end181 ], [ 1, %land.lhs.true197 ], [ %29, %land.rhs122 ], [ 0, %lor.rhs ], [ 1, %land.rhs ], [ 0, %cond.true114 ], [ %call148, %cond.false147 ], [ %conv146, %cond.true142 ], [ %conv137, %cond.true133 ], [ 0, %if.then106 ], [ 0, %cleanup ]
  ret i8 %retval.5
}

declare signext i32 @Perl_magic_existspack(ptr noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_avhv_keys(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_av_fetch(ptr noundef %av, i32 noundef signext 0, i32 noundef signext 0)
  %tobool.not = icmp eq ptr %call, null
  br i1 %tobool.not, label %if.end37, label %if.then

if.then:                                          ; preds = %entry
  %0 = load ptr, ptr %call, align 8
  %sv_flags = getelementptr inbounds i8, ptr %0, i64 12
  %1 = load i32, ptr %sv_flags, align 4
  %and = and i32 %1, 8192
  %tobool1.not = icmp eq i32 %and, 0
  br i1 %tobool1.not, label %if.end, label %if.then2

if.then2:                                         ; preds = %if.then
  %call3 = tail call signext i32 @Perl_mg_get(ptr noundef nonnull %0) #7
  %.pre = load i32, ptr %sv_flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %2 = phi i32 [ %.pre, %if.then2 ], [ %1, %if.then ]
  %and5 = and i32 %2, 524288
  %tobool6.not = icmp eq i32 %and5, 0
  br i1 %tobool6.not, label %if.end37, label %if.then7

if.then7:                                         ; preds = %if.end
  %3 = load volatile ptr, ptr @PL_curcop, align 8
  %cop_warnings = getelementptr inbounds i8, ptr %3, i64 80
  %4 = load ptr, ptr %cop_warnings, align 8
  %cmp.not = icmp eq ptr %4, null
  br i1 %cmp.not, label %lor.lhs.false16, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.then7
  %5 = load volatile ptr, ptr @PL_curcop, align 8
  %cop_warnings8 = getelementptr inbounds i8, ptr %5, i64 80
  %6 = load ptr, ptr %cop_warnings8, align 8
  %cmp9.not = icmp eq ptr %6, inttoptr (i64 32 to ptr)
  br i1 %cmp9.not, label %lor.lhs.false16, label %land.lhs.true10

land.lhs.true10:                                  ; preds = %land.lhs.true
  %7 = load volatile ptr, ptr @PL_curcop, align 8
  %cop_warnings11 = getelementptr inbounds i8, ptr %7, i64 80
  %8 = load ptr, ptr %cop_warnings11, align 8
  %cmp12 = icmp eq ptr %8, inttoptr (i64 16 to ptr)
  br i1 %cmp12, label %land.lhs.true24, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true10
  %9 = load volatile ptr, ptr @PL_curcop, align 8
  %cop_warnings13 = getelementptr inbounds i8, ptr %9, i64 80
  %10 = load ptr, ptr %cop_warnings13, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = load i8, ptr %12, align 1
  %14 = and i8 %13, 16
  %tobool15.not = icmp eq i8 %14, 0
  br i1 %tobool15.not, label %lor.lhs.false16, label %land.lhs.true24

lor.lhs.false16:                                  ; preds = %lor.lhs.false, %land.lhs.true, %if.then7
  %15 = load volatile ptr, ptr @PL_curcop, align 8
  %cop_warnings17 = getelementptr inbounds i8, ptr %15, i64 80
  %16 = load ptr, ptr %cop_warnings17, align 8
  %cmp18 = icmp eq ptr %16, null
  br i1 %cmp18, label %land.lhs.true20, label %if.end28

land.lhs.true20:                                  ; preds = %lor.lhs.false16
  %17 = load i8, ptr @PL_dowarn, align 1
  %18 = and i8 %17, 1
  %tobool23.not = icmp eq i8 %18, 0
  br i1 %tobool23.not, label %if.end28, label %land.lhs.true24

land.lhs.true24:                                  ; preds = %land.lhs.true20, %lor.lhs.false, %land.lhs.true10
  %call25 = tail call signext i32 @Perl_sv_isa(ptr noundef nonnull %0, ptr noundef nonnull @.str.9) #7
  %tobool26.not = icmp eq i32 %call25, 0
  br i1 %tobool26.not, label %if.then27, label %if.end28

if.then27:                                        ; preds = %land.lhs.true24
  tail call void (i32, ptr, ...) @Perl_warner(i32 noundef signext 2, ptr noundef nonnull @.str.10) #7
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %land.lhs.true24, %land.lhs.true20, %lor.lhs.false16
  %19 = load ptr, ptr %0, align 8
  %20 = load ptr, ptr %19, align 8
  %sv_flags30 = getelementptr inbounds i8, ptr %20, i64 12
  %21 = load i32, ptr %sv_flags30, align 4
  %and31 = and i32 %21, 255
  %cmp32 = icmp eq i32 %and31, 11
  br i1 %cmp32, label %cleanup38, label %if.end37

if.end37:                                         ; preds = %if.end28, %if.end, %entry
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @.str.11) #7
  br label %cleanup38

cleanup38:                                        ; preds = %if.end28, %if.end37
  %retval.1 = phi ptr [ null, %if.end37 ], [ %20, %if.end28 ]
  ret ptr %retval.1
}

declare signext i32 @Perl_mg_get(ptr noundef) local_unnamed_addr #3

declare signext i32 @Perl_sv_isa(ptr noundef, ptr noundef) local_unnamed_addr #3

declare void @Perl_warner(i32 noundef signext, ptr noundef, ...) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local noundef ptr @Perl_avhv_store_ent(ptr noundef %av, ptr noundef %keysv, ptr noundef %val, i32 noundef signext %hash) local_unnamed_addr #2 {
entry:
  %call = tail call fastcc signext i32 @S_avhv_index(ptr noundef %av, ptr noundef %keysv, i32 noundef signext %hash)
  %call1 = tail call ptr @Perl_av_store(ptr noundef %av, i32 noundef signext %call, ptr noundef %val)
  ret ptr %call1
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define internal fastcc signext i32 @S_avhv_index(ptr noundef %av, ptr noundef %keysv, i32 noundef signext %hash) unnamed_addr #2 {
entry:
  %n_a = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %n_a) #7
  %call = tail call ptr @Perl_avhv_keys(ptr noundef %av)
  %call1 = tail call ptr @Perl_hv_fetch_ent(ptr noundef %call, ptr noundef %keysv, i32 noundef signext 0, i32 noundef signext %hash) #7
  %tobool.not = icmp eq ptr %call1, null
  br i1 %tobool.not, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sv_flags = getelementptr inbounds i8, ptr %keysv, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 262144
  %cmp.not = icmp eq i32 %and, 0
  br i1 %cmp.not, label %cond.false, label %cond.true

cond.true:                                        ; preds = %if.then
  %1 = load ptr, ptr %keysv, align 8
  %xpv_cur = getelementptr inbounds i8, ptr %1, i64 8
  %2 = load i64, ptr %xpv_cur, align 8
  store i64 %2, ptr %n_a, align 8
  %3 = load ptr, ptr %1, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %call3 = call ptr @Perl_sv_2pv_flags(ptr noundef nonnull %keysv, ptr noundef nonnull %n_a, i32 noundef signext 2) #7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi ptr [ %3, %cond.true ], [ %call3, %cond.false ]
  call void (ptr, ...) @Perl_croak(ptr noundef nonnull @.str.12, ptr noundef %cond) #7
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  %hent_val = getelementptr inbounds i8, ptr %call1, i64 16
  %4 = load ptr, ptr %hent_val, align 8
  %call4 = call fastcc signext i32 @S_avhv_index_sv(ptr noundef %4)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %n_a) #7
  ret i32 %call4
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_avhv_fetch_ent(ptr noundef %av, ptr noundef %keysv, i32 noundef signext %lval, i32 noundef signext %hash) local_unnamed_addr #2 {
entry:
  %call = tail call fastcc signext i32 @S_avhv_index(ptr noundef %av, ptr noundef %keysv, i32 noundef signext %hash)
  %call1 = tail call ptr @Perl_av_fetch(ptr noundef %av, i32 noundef signext %call, i32 noundef signext %lval)
  ret ptr %call1
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_avhv_delete_ent(ptr noundef %av, ptr noundef %keysv, i32 noundef signext %flags, i32 noundef signext %hash) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_avhv_keys(ptr noundef %av)
  %call1 = tail call ptr @Perl_hv_fetch_ent(ptr noundef %call, ptr noundef %keysv, i32 noundef signext 0, i32 noundef signext %hash) #7
  %tobool.not = icmp eq ptr %call1, null
  br i1 %tobool.not, label %cleanup, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %hent_val = getelementptr inbounds i8, ptr %call1, i64 16
  %0 = load ptr, ptr %hent_val, align 8
  %sv_flags = getelementptr inbounds i8, ptr %0, i64 12
  %1 = load i32, ptr %sv_flags, align 4
  %and = and i32 %1, 118423552
  %tobool2.not = icmp eq i32 %and, 0
  br i1 %tobool2.not, label %cleanup, label %if.end

if.end:                                           ; preds = %lor.lhs.false
  %call4 = tail call fastcc signext i32 @S_avhv_index_sv(ptr noundef nonnull %0)
  %call5 = tail call ptr @Perl_av_delete(ptr noundef %av, i32 noundef signext %call4, i32 noundef signext %flags)
  br label %cleanup

cleanup:                                          ; preds = %entry, %lor.lhs.false, %if.end
  %retval.0 = phi ptr [ %call5, %if.end ], [ null, %lor.lhs.false ], [ null, %entry ]
  ret ptr %retval.0
}

declare ptr @Perl_hv_fetch_ent(ptr noundef, ptr noundef, i32 noundef signext, i32 noundef signext) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define internal fastcc signext i32 @S_avhv_index_sv(ptr noundef %sv) unnamed_addr #2 {
entry:
  %sv_flags = getelementptr inbounds i8, ptr %sv, i64 12
  %0 = load i32, ptr %sv_flags, align 4
  %and = and i32 %0, 65536
  %tobool.not = icmp eq i32 %and, 0
  br i1 %tobool.not, label %cond.false, label %cond.true

cond.true:                                        ; preds = %entry
  %1 = load ptr, ptr %sv, align 8
  %xiv_iv = getelementptr inbounds i8, ptr %1, i64 24
  %2 = load i64, ptr %xiv_iv, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call = tail call i64 @Perl_sv_2iv(ptr noundef nonnull %sv) #7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %2, %cond.true ], [ %call, %cond.false ]
  %conv = trunc i64 %cond to i32
  %cmp = icmp slt i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  tail call void (ptr, ...) @Perl_croak(ptr noundef nonnull @.str.13) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  ret i32 %conv
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local zeroext i8 @Perl_avhv_exists_ent(ptr noundef %av, ptr noundef %keysv, i32 noundef signext %hash) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_avhv_keys(ptr noundef %av)
  %call1 = tail call ptr @Perl_hv_fetch_ent(ptr noundef %call, ptr noundef %keysv, i32 noundef signext 0, i32 noundef signext %hash) #7
  %tobool.not = icmp eq ptr %call1, null
  br i1 %tobool.not, label %cleanup, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %hent_val = getelementptr inbounds i8, ptr %call1, i64 16
  %0 = load ptr, ptr %hent_val, align 8
  %sv_flags = getelementptr inbounds i8, ptr %0, i64 12
  %1 = load i32, ptr %sv_flags, align 4
  %and = and i32 %1, 118423552
  %tobool2.not = icmp eq i32 %and, 0
  br i1 %tobool2.not, label %cleanup, label %if.end

if.end:                                           ; preds = %lor.lhs.false
  %call4 = tail call fastcc signext i32 @S_avhv_index_sv(ptr noundef nonnull %0)
  %call5 = tail call zeroext i8 @Perl_av_exists(ptr noundef %av, i32 noundef signext %call4)
  br label %cleanup

cleanup:                                          ; preds = %entry, %lor.lhs.false, %if.end
  %retval.0 = phi i8 [ %call5, %if.end ], [ 0, %lor.lhs.false ], [ 0, %entry ]
  ret i8 %retval.0
}

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_avhv_iternext(ptr noundef %av) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_avhv_keys(ptr noundef %av)
  %call1 = tail call ptr @Perl_hv_iternext(ptr noundef %call) #7
  ret ptr %call1
}

declare ptr @Perl_hv_iternext(ptr noundef) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable vscale_range(2,2)
define dso_local ptr @Perl_avhv_iterval(ptr noundef %av, ptr noundef %entry1) local_unnamed_addr #2 {
entry:
  %call = tail call ptr @Perl_avhv_keys(ptr noundef %av)
  %call2 = tail call ptr @Perl_hv_iterval(ptr noundef %call, ptr noundef %entry1) #7
  %call3 = tail call fastcc signext i32 @S_avhv_index_sv(ptr noundef %call2)
  %call4 = tail call ptr @Perl_av_fetch(ptr noundef %av, i32 noundef signext %call3, i32 noundef signext 1)
  %0 = load ptr, ptr %call4, align 8
  ret ptr %0
}

declare ptr @Perl_hv_iterval(ptr noundef, ptr noundef) local_unnamed_addr #3

declare ptr @Perl_sv_2pv_flags(ptr noundef, ptr noundef, i32 noundef signext) local_unnamed_addr #3

declare i64 @Perl_sv_2iv(ptr noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x ptr> @llvm.vector.reverse.nxv2p0(<vscale x 2 x ptr>) #6

attributes #0 = { nofree noinline norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable vscale_range(2,2) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zbb,+zicsr,+zifencei,+zmmul,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-b,-e,-experimental-smmpm,-experimental-smnpm,-experimental-ssnpm,-experimental-sspm,-experimental-ssqosid,-experimental-supm,-experimental-zacas,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-h,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smepmp,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zaamo,-zabha,-zalrsc,-zama16b,-zawrs,-zba,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { noinline nounwind uwtable vscale_range(2,2) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zbb,+zicsr,+zifencei,+zmmul,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-b,-e,-experimental-smmpm,-experimental-smnpm,-experimental-ssnpm,-experimental-sspm,-experimental-ssqosid,-experimental-supm,-experimental-zacas,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-h,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smepmp,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zaamo,-zabha,-zalrsc,-zama16b,-zawrs,-zba,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zbb,+zicsr,+zifencei,+zmmul,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl32b,+zvl64b,-b,-e,-experimental-smmpm,-experimental-smnpm,-experimental-ssnpm,-experimental-sspm,-experimental-ssqosid,-experimental-supm,-experimental-zacas,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-h,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smepmp,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zaamo,-zabha,-zalrsc,-zama16b,-zawrs,-zba,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl4096b,-zvl512b,-zvl65536b,-zvl8192b" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{i32 8, !"SmallDataLimit", i32 8}
!8 = !{!"clang version 19.1.0-rc3 (https://github.com/Tomlord1122/llvm-project.git 47d5c3e1c9e2c98b44f2b9ea8aa02100ed00cc52)"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
!12 = distinct !{!12, !11, !10}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !11, !10}
