Δx = 0.3
x = Δx:Δx:1-Δx
N = length(x)
B = sin.(2π*x)
A = zeros(N,N)
for i in 1:N, j in 1:N
    abs(i-j) <= 1 && (A[i, j]+=1)
    i==j && (A[i, j] -= 3)
end
A = A/(Δx^2)
U = A\B
using Plots
plotly()
Plots.plot([0;x;1], [0;U;0], label="U")
Plots.plot!([0;x;1], -sin.(2π*[0;x;1])/4(π^2), label="analytical solution")
