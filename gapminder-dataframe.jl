url = "https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv"
download(url, "gapminder-data.csv")
gapminder_df = CSV.read("gapminder-data.csv")

continents = unique(gapminder_df[:continent])

gapminder_years = unique(gapminder_df[:year])

#=
gapminder_1952 =
    gapminder_df[in.(gapminder_df.year, Ref([gapminder_years[1]])), :]

gapminder_1952_asia =
    gapminder_1952[occursin.(gapminder_1952.continent, Ref("Asia")), :]
=#

filter(row -> row.continent == "Asia", gapminder_df)
filter(row -> row.year == 1952, gapminder_df)
