url = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Killerwhales_jumping.jpg/1280px-Killerwhales_jumping.jpg"

download(url, "orca.jpg")

using Images

orca = load("orca.jpg")

typeof(orca)

size(orca)

orca[200, 200]

orca[1:500, 1:300]

(h, w) = size(orca)

portion = orca[(h÷10):h, (w÷10):(5w÷5)]

size(portion)

[portion portion]

kaleidoscoped = [
    portion                     reverse(portion, dims=2)
    reverse(portion, dims=1)    reverse(reverse(portion, dims=1), dims=2)
]

new_orca = copy(orca)

red = RGB(1, 0, 0)
green = RGB(0, 1, 0)

for i in 1:100
    for j in 1:300
        new_orca[i, j] = red
    end
end

new_orca

new_orca_2 = copy(orca)

new_orca_2[100:200, 1:100] .= green

new_orca_2

function redify(color)
    return RGB(color.r, 0, 0)
end

function greenify(color)
    return RGB(0, color.g, 0)
end

function bluify(color)
    return RGB(0, 0, color.b)
end


color = RGB(0.5, 0.5, 0.2)

[color, redify(color)]

[color, greenify(color)]

bluify.(orca)

redify.(orca)

greenify.(orca)

decimate(image, ratio=5) = image[1:ratio:end, 1:ratio:end]

poor_orca = decimate(new_orca, 100)

[ bluify.(orca) redify.(orca) greenify.(orca) ]
