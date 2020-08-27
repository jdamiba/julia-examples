methods(+)
@which 3+3
@which 3.0+3.0
import Base:+
+(x::String, y::String) = string(x, y) # add a method to function + for inputs of type String
"hello"+"world"+"cool"
@which "hello"+"world"+"cool"
foo(x, y) = println("duck typed foo")
foo(x::Int, y::Float64) = println("foo with integer and float")
foo(x::Float64, y::Float64) = println("foo with float and float")
foo(x::Int, y::Int) = println("foo with integer and integer")
foo(1,1)
foo(1.0, 3)
foo(1.0, 3.0)
foo(1, + 3.0)
foo("string", 3)
