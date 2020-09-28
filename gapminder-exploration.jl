using DataFrames
using Statistics
using RDatasets
using CSV
using Interact

iris = dataset("datasets", "iris")

url = "https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv"
download(url, "gapminder-data.csv")
df = CSV.read("gapminder-data.csv")

continents = unique(df[:continent])

years = unique(df[:year])

countries = unique(df[:country])

france_data = df[df.country .== "France", :]

spain_data = df[df.country .== "Spain", :]

for i in 1:size(countries)[1]
    if contains(countries[i], "Uni")
        println(countries[i])
    end
end

@manipulate for i in continents
    i
end

@manipulate for i in countries
    i
end
