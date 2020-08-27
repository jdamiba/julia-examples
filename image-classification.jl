using Metalhead
using Metalhead: classify
using Images
using Dash
using DashHtmlComponents
using DashCoreComponents

vgg = VGG19()
#densenet = DenseNet()
#resnet = ResNet()
#googlenet = GoogleNet()
#squeezenet = SqueezeNet()

function classify_image(url)
    download(url, "image.jpg")

    image = load("image.jpg")

    classify(vgg, image)
end

app = dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])

app.layout = html_div() do
    html_div("enter image url"),
    dcc_input(id = "url", value="https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg"),
    html_br(),
    html_img(id="img", height="50%", width="50%", src="https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg"),
    html_br(),
    html_div(id = "output")
end

callback!(app, Output("img", "src"), Output("output", "children"), Input("url", "value")) do input_value
    vgg_prediction = classify_image(input_value)
    return input_value, "$vgg_prediction"
    # return classify_image(input_value)
end

run_server(app, "0.0.0.0", 8000)
