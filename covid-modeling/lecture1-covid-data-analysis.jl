using CSV
using DataFrames
using Interact

url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
download(url, "covid_data.csv")
data = CSV.read("covid_data.csv")
rename!(data, 1 => "Province", 2 => "Country")
#=
@manipulate for i in 1:10
    HTML(i^2)
end
=#
countries = data[:, 2]
unique_countries = unique(countries)

#=
@manipulate for i in 1:length(unique_countries)
    unique_countries[i]
end
=#
U_countries = [startswith(country, "U") for country in countries]
data[U_countries, :] # how is the country united states encoded in data set??

US_row = findfirst(countries .== "US") # broadcasting- apply to each element in vector
US_data = data[US_row, :]
US_data_vector = convert(Vector, US_data[5:end])
plot(US_data_vector, legend=false)
xlabel!("Day")
ylabel!("Cases")
title!("COVID-19 in America")
