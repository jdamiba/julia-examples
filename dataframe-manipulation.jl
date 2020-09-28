using CSV
using DataFrames



url = "https://gist.githubusercontent.com/chriddyp/cb5392c35661370d95f300086accea51/raw/8e0768211f6b747c0db42a9ce9a0937dafcbd8b2/indicators.csv"
download(url, "country-indicators.csv")
country_indicators_df = CSV.read("country-indicators.csv")


#df2 = CSV.File("country-indicators.csv") |> DataFrame

#df2

rename!(country_indicators_df, Dict(:"Indicator Name" => "Indicator"))

available_indicators = unique(country_indicators_df[:Indicator])
country_indicators_years = unique(country_indicators_df[:Year])

function filter_by_year(df, year)
    return filter(row -> row.Year == year, country_indicators_df)
end

function filter_by_indicator(df, indicator)
    return filter(row -> row.Indicator == indicator, country_indicators_df)
end


function filter_by_year_and_indicator(df, year, indicator)
    return filter(row -> row.Year == year && row.Indicator == indicator, country_indicators_df)
end


country_indicators_by_year = []
for i in 1:length(country_indicators_years)
    push!(country_indicators_by_year, filter_by_year(country_indicators_df, country_indicators_years[i]))
end

country_indicators_by_year

country_indicators_by_indicator = []

for i in 1:length(available_indicators)
    push!(country_indicators_by_indicator, filter_by_indicator(country_indicators_df, string(available_indicators[i])))
end

country_indicators_by_indicator

testdf = filter_by_year_and_indicator(country_indicators_df, country_indicators_years[1], available_indicators[1])

country_indicators_by_year_and_indicator = []
for i in 1:length(country_indicators_years)
    for j in 1:length(available_indicators)
        push!(country_indicators_by_year_and_indicator, filter_by_year_and_indicator(country_indicators_df, country_indicators_years[i], available_indicators[j]))
    end
end

country_indicators_by_year_and_indicator
#=

country_indicators_1952 = filter_by_year(country_indicators_df, country_indicators_years[1])
country_indicators_1953 = filter_by_year(country_indicators_df, country_indicators_years[2])


country_indicators_1952_fertility = country_indicators_1952[
    occursin.(
        country_indicators_1952.Indicator,
        Ref("Fertility rate, total (births per woman)"),
    ),
    :,
]

country_indicators_1952_agriculture = country_indicators_1952[
    occursin.(
        country_indicators_1952.Indicator,
        Ref("Agriculture, value added (% of GDP)"),
    ),
    :,
]
=#
