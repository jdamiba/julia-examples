using Plots
x = -100:0.1:100
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
p5 = plot(x, x.^5)
p6 = plot(x, x.^6)
p7 = plot(x, x.^7)
p8 = plot(x, x.^8)
p9 = plot(x, x.^9)
plot(p1, p2, p3, p4, p5, p6, p7, p8, p9, layout=(3,3), legend=false)
