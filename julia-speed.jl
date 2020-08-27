using BenchmarkTools
a = rand(10^7)
b = sum(a)
println(b)
C_code = """
#include <stddef.h>
double c_sum(size_t n, double *X) {
    double s = 0.0;
    for (size_t i = 0; i < n; i++) {
        s += X[i];
    }
    return s;
}
"""
const Clib = tempname()
open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`, "w") do f
    print(f, C_code)
end
c_sum(X:Array{Float64}) = ccal("c_sum", Clib), Float64, (Csize_t, Ptr{Float64}, length(X), X)
