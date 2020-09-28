using Metalhead
using Metalhead: classify
using Images, Dash, DashHtmlComponents, DashCoreComponents


vgg = VGG19()
densenet = DenseNet()
resnet = ResNet()
squeezenet = SqueezeNet()

default_model = vgg

default_image_url = "https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg"

function classify_image(url, model)
    download(url, "image.jpg")

    image = load("image.jpg")

    return classify(model, image)
end

app = dash()

app.layout = html_div() do
    html_div("select a model", style = (paddingBottom = "10px",)),
    dcc_dropdown(
        id = "dropdown",
        style = (width = "150px", marginBottom = "10px"),
        options = [
            (label = "vgg", value = "vgg"),
            (label = "densenet", value = "densenet"),
            (label = "resnet", value = "resnet"),
            (label = "squeezenet", value = "squeezenet"),
        ],
        value="vgg"
    ),
    html_div("enter image url", style = (paddingBottom = "10px",)),
    dcc_input(
        style = (width = "400px", marginBottom = "40px",),
        id = "url",
        value = default_image_url,
    ),
    html_br(),
    html_img(
        style = (marginBottom = "40px",),
        id = "img",
        height = "30%",
        width = "30%",
        src = default_image_url,
    ),
    html_br(),
    dcc_loading(html_div(id = "output"))
end

callback!(
    app,
    Output("img", "src"),
    Output("output", "children"),
    Input("url", "value"),
    Input("dropdown", "value"),
) do image_url, currently_selected_model

    model = default_model

    if image_url == ""
        image_url = default_image_url
    end

    if currently_selected_model == "vgg"
        model = vgg
    elseif currently_selected_model == "densenet"
        model = densenet
    elseif currently_selected_model == "resnet"
        model = resnet
    elseif currently_selected_model == "squeezenet"
        model = squeezenet
    end

    prediction = classify_image(image_url, model)

    return image_url, "$currently_selected_model thinks the image contains $prediction"
end

run_server(app, "0.0.0.0", 8000)
