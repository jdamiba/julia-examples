using CSV
using DataFrames
using Interact
using Dates

url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
download(url, "covid_data.csv")
data = CSV.read("covid_data.csv")

US_row_index = findfirst(countries .== "US") # use broadcasting- to apply test to each element
US_covid_data = data[US_row_index, :] # get all columns
covid_cases = convert(Vector, US_covid_data[5:end])

date_strings = String.(names(data))[5:end] # apply string function to each element
format = Dates.DateFormat("m/d/y")
dates = parse.(Date, date_strings, format) + Year(2000)
plot(
    dates,
    covid_cases,
    xticks = dates[1:60:end],
    xrotation = 45,
    legend = false,
    m=:o,
    markersize=1,
    yscale=:log10
)
xlabel!("Date")
ylabel!("Cases")
title!("COVID-19 in America")
