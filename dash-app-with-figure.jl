using Dash
using DashHtmlComponents
using DashCoreComponents
using RDatasets


app =
    dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])

iris = dataset("datasets", "iris")

p1 = Plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers", marker_size=8, group=:Species)

p2 = Plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers+lines", marker_size=8, group=:Species)

app.layout = html_div() do
    dcc_graph(
        id = "example-graph",
        figure = p1,
    ),
    dcc_graph(
        id = "example-graph2",
        figure = p2,
    )
end

run_server(app, "0.0.0.0", 8000)
