; ModuleID = '../game_of_life/game_of_life.c'
source_filename = "../game_of_life/game_of_life.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.NeighborNum.help_arr_x = private unnamed_addr constant [8 x i32] [i32 -1, i32 -1, i32 0, i32 1, i32 1, i32 1, i32 0, i32 -1], align 16
@__const.NeighborNum.help_arr_y = private unnamed_addr constant [8 x i32] [i32 0, i32 1, i32 1, i32 1, i32 0, i32 -1, i32 -1, i32 -1], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @GoodInds(i32 %0, i32 %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %16

7:                                                ; preds = %2
  %8 = load i32, i32* %4, align 4
  %9 = icmp sge i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %7
  %11 = load i32, i32* %3, align 4
  %12 = icmp slt i32 %11, 60
  br i1 %12, label %13, label %16

13:                                               ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = icmp slt i32 %14, 40
  br label %16

16:                                               ; preds = %13, %10, %7, %2
  %17 = phi i1 [ false, %10 ], [ false, %7 ], [ false, %2 ], [ %15, %13 ]
  %18 = zext i1 %17 to i32
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @NeighborNum(i32 %0, i32 %1, [60 x [40 x i32]]* %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [60 x [40 x i32]]*, align 8
  %7 = alloca [8 x i32], align 16
  %8 = alloca [8 x i32], align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store [60 x [40 x i32]]* %2, [60 x [40 x i32]]** %6, align 8
  %15 = bitcast [8 x i32]* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %15, i8* align 16 bitcast ([8 x i32]* @__const.NeighborNum.help_arr_x to i8*), i64 32, i1 false)
  %16 = bitcast [8 x i32]* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %16, i8* align 16 bitcast ([8 x i32]* @__const.NeighborNum.help_arr_y to i8*), i64 32, i1 false)
  store i32 0, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %17

17:                                               ; preds = %51, %3
  %18 = load i32, i32* %12, align 4
  %19 = icmp slt i32 %18, 8
  br i1 %19, label %20, label %54

20:                                               ; preds = %17
  %21 = load i32, i32* %4, align 4
  %22 = load i32, i32* %12, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i32], [8 x i32]* %7, i64 0, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = add nsw i32 %21, %25
  store i32 %26, i32* %13, align 4
  %27 = load i32, i32* %5, align 4
  %28 = load i32, i32* %12, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [8 x i32], [8 x i32]* %8, i64 0, i64 %29
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %27, %31
  store i32 %32, i32* %14, align 4
  %33 = load i32, i32* %13, align 4
  %34 = load i32, i32* %14, align 4
  %35 = call i32 @GoodInds(i32 %33, i32 %34)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %50

37:                                               ; preds = %20
  %38 = load [60 x [40 x i32]]*, [60 x [40 x i32]]** %6, align 8
  %39 = load i32, i32* %13, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %38, i64 0, i64 %40
  %42 = load i32, i32* %14, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [40 x i32], [40 x i32]* %41, i64 0, i64 %43
  %45 = load i32, i32* %44, align 4
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %47, label %50

47:                                               ; preds = %37
  %48 = load i32, i32* %11, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %11, align 4
  br label %50

50:                                               ; preds = %47, %37, %20
  br label %51

51:                                               ; preds = %50
  %52 = load i32, i32* %12, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %12, align 4
  br label %17

54:                                               ; preds = %17
  %55 = load i32, i32* %11, align 4
  ret i32 %55
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @prepNextIter([60 x [40 x i32]]* %0, [60 x [40 x i32]]* %1) #0 {
  %3 = alloca [60 x [40 x i32]]*, align 8
  %4 = alloca [60 x [40 x i32]]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store [60 x [40 x i32]]* %0, [60 x [40 x i32]]** %3, align 8
  store [60 x [40 x i32]]* %1, [60 x [40 x i32]]** %4, align 8
  store i32 0, i32* %6, align 4
  br label %10

10:                                               ; preds = %48, %2
  %11 = load i32, i32* %6, align 4
  %12 = icmp slt i32 %11, 60
  br i1 %12, label %13, label %51

13:                                               ; preds = %10
  store i32 0, i32* %7, align 4
  br label %14

14:                                               ; preds = %44, %13
  %15 = load i32, i32* %7, align 4
  %16 = icmp slt i32 %15, 40
  br i1 %16, label %17, label %47

17:                                               ; preds = %14
  %18 = load i32, i32* %6, align 4
  %19 = load i32, i32* %7, align 4
  %20 = load [60 x [40 x i32]]*, [60 x [40 x i32]]** %3, align 8
  %21 = call i32 @NeighborNum(i32 %18, i32 %19, [60 x [40 x i32]]* %20)
  store i32 %21, i32* %5, align 4
  %22 = load i32, i32* %5, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %27, label %24

24:                                               ; preds = %17
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 3
  br i1 %26, label %27, label %35

27:                                               ; preds = %24, %17
  %28 = load [60 x [40 x i32]]*, [60 x [40 x i32]]** %4, align 8
  %29 = load i32, i32* %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %28, i64 0, i64 %30
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [40 x i32], [40 x i32]* %31, i64 0, i64 %33
  store i32 0, i32* %34, align 4
  br label %43

35:                                               ; preds = %24
  %36 = load [60 x [40 x i32]]*, [60 x [40 x i32]]** %4, align 8
  %37 = load i32, i32* %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %36, i64 0, i64 %38
  %40 = load i32, i32* %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [40 x i32], [40 x i32]* %39, i64 0, i64 %41
  store i32 1, i32* %42, align 4
  br label %43

43:                                               ; preds = %35, %27
  br label %44

44:                                               ; preds = %43
  %45 = load i32, i32* %7, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %7, align 4
  br label %14

47:                                               ; preds = %14
  br label %48

48:                                               ; preds = %47
  %49 = load i32, i32* %6, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %6, align 4
  br label %10

51:                                               ; preds = %10
  store i32 0, i32* %8, align 4
  br label %52

52:                                               ; preds = %79, %51
  %53 = load i32, i32* %8, align 4
  %54 = icmp slt i32 %53, 60
  br i1 %54, label %55, label %82

55:                                               ; preds = %52
  store i32 0, i32* %9, align 4
  br label %56

56:                                               ; preds = %75, %55
  %57 = load i32, i32* %9, align 4
  %58 = icmp slt i32 %57, 40
  br i1 %58, label %59, label %78

59:                                               ; preds = %56
  %60 = load [60 x [40 x i32]]*, [60 x [40 x i32]]** %4, align 8
  %61 = load i32, i32* %8, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %60, i64 0, i64 %62
  %64 = load i32, i32* %9, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [40 x i32], [40 x i32]* %63, i64 0, i64 %65
  %67 = load i32, i32* %66, align 4
  %68 = load [60 x [40 x i32]]*, [60 x [40 x i32]]** %3, align 8
  %69 = load i32, i32* %8, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %68, i64 0, i64 %70
  %72 = load i32, i32* %9, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [40 x i32], [40 x i32]* %71, i64 0, i64 %73
  store i32 %67, i32* %74, align 4
  br label %75

75:                                               ; preds = %59
  %76 = load i32, i32* %9, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %9, align 4
  br label %56

78:                                               ; preds = %56
  br label %79

79:                                               ; preds = %78
  %80 = load i32, i32* %8, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %8, align 4
  br label %52

82:                                               ; preds = %52
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca [60 x [40 x i32]], align 16
  %2 = alloca [60 x [40 x i32]], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  br label %13

13:                                               ; preds = %44, %0
  %14 = load i32, i32* %3, align 4
  %15 = icmp slt i32 %14, 60
  br i1 %15, label %16, label %47

16:                                               ; preds = %13
  store i32 0, i32* %4, align 4
  br label %17

17:                                               ; preds = %40, %16
  %18 = load i32, i32* %4, align 4
  %19 = icmp slt i32 %18, 40
  br i1 %19, label %20, label %43

20:                                               ; preds = %17
  %21 = call i32 (...) @simRand()
  %22 = srem i32 %21, 10
  store i32 %22, i32* %5, align 4
  %23 = load i32, i32* %5, align 4
  %24 = icmp slt i32 %23, 1
  br i1 %24, label %25, label %32

25:                                               ; preds = %20
  %26 = load i32, i32* %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %1, i64 0, i64 %27
  %29 = load i32, i32* %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [40 x i32], [40 x i32]* %28, i64 0, i64 %30
  store i32 1, i32* %31, align 4
  br label %39

32:                                               ; preds = %20
  %33 = load i32, i32* %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %1, i64 0, i64 %34
  %36 = load i32, i32* %4, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [40 x i32], [40 x i32]* %35, i64 0, i64 %37
  store i32 0, i32* %38, align 4
  br label %39

39:                                               ; preds = %32, %25
  br label %40

40:                                               ; preds = %39
  %41 = load i32, i32* %4, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %4, align 4
  br label %17

43:                                               ; preds = %17
  br label %44

44:                                               ; preds = %43
  %45 = load i32, i32* %3, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %3, align 4
  br label %13

47:                                               ; preds = %13
  store i32 0, i32* %6, align 4
  br label %48

48:                                               ; preds = %127, %47
  %49 = load i32, i32* %6, align 4
  %50 = icmp slt i32 %49, 1000
  br i1 %50, label %51, label %130

51:                                               ; preds = %48
  store i32 0, i32* %7, align 4
  br label %52

52:                                               ; preds = %123, %51
  %53 = load i32, i32* %7, align 4
  %54 = icmp slt i32 %53, 40
  br i1 %54, label %55, label %126

55:                                               ; preds = %52
  store i32 0, i32* %8, align 4
  br label %56

56:                                               ; preds = %119, %55
  %57 = load i32, i32* %8, align 4
  %58 = icmp slt i32 %57, 60
  br i1 %58, label %59, label %122

59:                                               ; preds = %56
  %60 = load i32, i32* %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [60 x [40 x i32]], [60 x [40 x i32]]* %1, i64 0, i64 %61
  %63 = load i32, i32* %7, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [40 x i32], [40 x i32]* %62, i64 0, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = icmp eq i32 %66, 1
  br i1 %67, label %68, label %93

68:                                               ; preds = %59
  store i32 0, i32* %9, align 4
  br label %69

69:                                               ; preds = %89, %68
  %70 = load i32, i32* %9, align 4
  %71 = icmp slt i32 %70, 20
  br i1 %71, label %72, label %92

72:                                               ; preds = %69
  store i32 0, i32* %10, align 4
  br label %73

73:                                               ; preds = %85, %72
  %74 = load i32, i32* %10, align 4
  %75 = icmp slt i32 %74, 20
  br i1 %75, label %76, label %88

76:                                               ; preds = %73
  %77 = load i32, i32* %8, align 4
  %78 = mul nsw i32 %77, 20
  %79 = load i32, i32* %9, align 4
  %80 = add nsw i32 %78, %79
  %81 = load i32, i32* %7, align 4
  %82 = mul nsw i32 %81, 20
  %83 = load i32, i32* %10, align 4
  %84 = add nsw i32 %82, %83
  call void @simPutPixel(i32 %80, i32 %84, i32 16842496)
  br label %85

85:                                               ; preds = %76
  %86 = load i32, i32* %10, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %10, align 4
  br label %73

88:                                               ; preds = %73
  br label %89

89:                                               ; preds = %88
  %90 = load i32, i32* %9, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %9, align 4
  br label %69

92:                                               ; preds = %69
  br label %118

93:                                               ; preds = %59
  store i32 0, i32* %11, align 4
  br label %94

94:                                               ; preds = %114, %93
  %95 = load i32, i32* %11, align 4
  %96 = icmp slt i32 %95, 20
  br i1 %96, label %97, label %117

97:                                               ; preds = %94
  store i32 0, i32* %12, align 4
  br label %98

98:                                               ; preds = %110, %97
  %99 = load i32, i32* %12, align 4
  %100 = icmp slt i32 %99, 20
  br i1 %100, label %101, label %113

101:                                              ; preds = %98
  %102 = load i32, i32* %8, align 4
  %103 = mul nsw i32 %102, 20
  %104 = load i32, i32* %11, align 4
  %105 = add nsw i32 %103, %104
  %106 = load i32, i32* %7, align 4
  %107 = mul nsw i32 %106, 20
  %108 = load i32, i32* %12, align 4
  %109 = add nsw i32 %107, %108
  call void @simPutPixel(i32 %105, i32 %109, i32 0)
  br label %110

110:                                              ; preds = %101
  %111 = load i32, i32* %12, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %12, align 4
  br label %98

113:                                              ; preds = %98
  br label %114

114:                                              ; preds = %113
  %115 = load i32, i32* %11, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %11, align 4
  br label %94

117:                                              ; preds = %94
  br label %118

118:                                              ; preds = %117, %92
  br label %119

119:                                              ; preds = %118
  %120 = load i32, i32* %8, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %8, align 4
  br label %56

122:                                              ; preds = %56
  br label %123

123:                                              ; preds = %122
  %124 = load i32, i32* %7, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %7, align 4
  br label %52

126:                                              ; preds = %52
  call void @prepNextIter([60 x [40 x i32]]* %1, [60 x [40 x i32]]* %2)
  call void (...) @simFlush()
  br label %127

127:                                              ; preds = %126
  %128 = load i32, i32* %6, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %6, align 4
  br label %48

130:                                              ; preds = %48
  ret void
}

declare dso_local i32 @simRand(...) #2

declare dso_local void @simPutPixel(i32, i32, i32) #2

declare dso_local void @simFlush(...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
