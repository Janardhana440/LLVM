@.helloworld = constant [13 x i8] c"Hello world\0A\00"
; Declare new string
@.myname = constant [23 x i8] c"My name is Janardhana\0A\00"
define dso_local i32 @main() {
%hello_world_pointer = getelementptr [13 x i8], [13 x i8]* @.helloworld, i64 0, i64
0 %my_name_pointer = getelementptr [23 x i8], [23 x i8]* @.myname, i64 0, i64 0
%1 = call i32 (i8*, ...) @printf(i8* %hello_world_pointer)
%2 = call i32 (i8*, ...) @printf(i8* %my_name_pointer)
ret i32 0
}
declare i32 @printf(i8*, ...)
