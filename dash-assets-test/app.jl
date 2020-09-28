using Dash, DashHtmlComponents

app = dash(assets_ignore=".*ignored.*")

app.index_string = """<!DOCTYPE html>
<html>
    <head>
        {%metas%}
        <title>{%title%}</title>
        {%css%}
    </head>
    <body>
        <div id="tested"></div>
        {%app_entry%}
        <footer>
            {%config%}
            {%scripts%}
            {%renderer%}
        </footer>
    </body>
</html>"""

app.layout = html_div() do
    html_div("this is a div", id="div-1"),
    html_div("this is another div")
end


run_server(app)
