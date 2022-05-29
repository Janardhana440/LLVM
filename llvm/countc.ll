@.targetstr = constant [22 x i8] c"counting c's is cool!\00"
@.formatstr = constant [22 x i8] c"Number of c's is: %d\0A\00"
define dso_local i32 @main() {
%targetptr = getelementptr [22 x i8], [22 x i8]* @.targetstr, i32 0, i32 0
%1 = call i32 @countc(i8* %targetptr, i32 22)
%formatptr = getelementptr [22 x i8], [22 x i8]* @.formatstr, i64 0, i64 0
%2 = call i32 (i8*, ...) @printf(i8* %formatptr, i32 %1)
ret i32 0
}

define dso_local i32 @fib(i32 %elem) {
%cur_val = alloca i32
%prev_val = alloca i32
%index = alloca i32
store i32 0, i32* %prev_val
store i32 1, i32* %cur_val
store i32 2, i32* %index
br label %1
1:
%cmp_1 = icmp eq i32 %elem, 1
br i1 %cmp_1, label %2, label %3
2:
%retval_1 = load i32, i32* %prev_val
ret i32 %retval_1
3:
%cmp_2 = icmp eq i32 %elem, 2
br i1 %cmp_2, label %6, label %4
4:
%idx_1 = load i32, i32* %index
%cmp_3 = icmp slt i32 %idx_1, %elem
br i1 %cmp_3, label %5, label %6
5:
%old_cur = load i32, i32* %cur_val
%old_prev = load i32, i32* %prev_val
%new_cur = add i32 %old_prev, %old_cur

store i32 %new_cur, i32* %cur_val

store i32 %old_cur, i32* %prev_val

%idx_2 = load i32, i32* %index

%idx_2_inc = add i32 %idx_2, 1

store i32 %idx_2_inc, i32* %index

br label %1

6:

%retval_final = load i32, i32* %cur_val

ret i32 %retval_final

}


declare i32 @printf(i8*, ...)
