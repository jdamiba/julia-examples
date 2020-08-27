using Dash
using DashHtmlComponents
using DashCoreComponents

app =
    dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])

fig = (
    data = [(
        mode = "markers",
        locations = ["FRA", "DEU", "RUS", "ESP", "USA", "GHA", "BRA"],
        type = "scattergeo",
    )],
)

app.layout = html_div() do
    html_h1("Hello, Dash"), html_div("Dash.jl: Julia interface for Dash")
    dcc_graph(
        id = "example-graph",
        figure = p,
    )
end

run_server(app, "0.0.0.0", 8000)
