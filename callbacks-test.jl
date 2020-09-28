using Dash
using DashHtmlComponents
using DashCoreComponents
using RDatasets
using PlotlyJS


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
    html_div(id="example-graph2-container"),
    html_div("click me", id="button")
end


callback!(
    app,
    Output("example-graph2-container", "children"),
    Input("button", "children"),
) do x
    return html_div() do
        dcc_graph(
        figure = p2,
        id = "example-graph2"
        )
    end
end

run_server(app, "0.0.0.0", 8000)
