using PlotlyJS
using RDatasets


iris = dataset("datasets", "iris")

#=
p1 = plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers", marker_size=8, group=:Species)

p1
=#

p2 = Plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers+lines", marker_size=8, group=:Species)

display(p2)
