using Dash
using DashHtmlComponents
using DashCoreComponents

app = dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])

app.layout = html_div() do
    dcc_input(id = "my-id", value = "initial value"),
    html_div(id = "my-div")
end

callback!(app, Output("my-div", "children"), Input("my-id", "value")) do input_value
    "You've entered $(typeof(input_value))"
end

run_server(app, "0.0.0.0", 8000)
``
