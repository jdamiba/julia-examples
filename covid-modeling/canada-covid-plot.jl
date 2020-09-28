using CSV
using DataFrames
using Interact

url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
download(url, "covid_data.csv")
data = CSV.read("covid_data.csv")

canada_row_index = findfirst(countries .== "Canada") # use broadcasting- to apply test to each element in dataframe
canada_covid_data = data[canada_row_index, :] # get all columns
covid_cases = convert(Vector, canada_covid_data[5:end])

plot(covid_cases, legend=false)
xlabel!("Day")
ylabel!("Cases")
title!("COVID-19 in America")
