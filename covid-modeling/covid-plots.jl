using CSV
using DataFrames
using Interact
using Dates
using Plots
using Dash
using DashHtmlComponents
using DashCoreComponents

plotlyjs()

function plot_covid_cases(country)
    url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
    download(url, "covid_data.csv")
    data = CSV.read("covid_data.csv")
    countries = data[:, 2]
    date_strings = String.(names(data))[5:end]
    format = Dates.DateFormat("m/d/y")
    dates = parse.(Date, date_strings, format) + Year(2000)
    row_index = findfirst(countries .== country)
    covid_data = data[row_index, :]
    covid_cases = convert(Vector, covid_data[5:end])
    plot(
        dates,
        covid_cases,
        xticks = dates[1:30:end],
        xrotation = 45,
        label = country,
        xlabel = "Date",
        ylabel = "Cases",
        title="COVID-19",
     )
end

plot_covid_cases("Uruguay")
