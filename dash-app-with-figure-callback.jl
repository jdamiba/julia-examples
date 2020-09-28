using Dash
using DashHtmlComponents
using DashCoreComponents
using RDatasets
using PlotlyJS


app = dash()

iris = dataset("datasets", "iris")

p1 = Plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers", marker_size=8, group=:Species)

p2 = Plot(iris, x=:SepalLength, y=:SepalWidth, mode="markers+lines", marker_size=8, group=:Species)

app.layout = html_div() do
    dcc_graph(
        id = "example-graph",
        figure = p1,
    ),
    html_div("click me", id="button"),
    dcc_graph(
        id = "example-graph2"
    )
end


callback!(
    app,
    Output("example-graph2", "figure"),
    Input("button", "children"),
) do x
    return p2
end

run_server(app, "0.0.0.0", 8000)
