using Plots
temps = [19, 21, 23, 25, 27, 29, 31]
pirates = [99, 89, 79, 69, 59, 49, 39]
plot(pirates, temps, legend=false)
scatter!(pirates, temps, legend=false)
xflip!()
xlabel!("Pirates")
ylabel!("Temperatures")
title!("Dearth of Pirates Cause Global Warming")
