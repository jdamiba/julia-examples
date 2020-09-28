using DataFrames
using Statistics
using RDatasets
using CSV

iris = dataset("datasets", "iris")

url = "https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv"
download(url, "gapminder-data.csv")
gapminder_df = DataFrame(CSV.File("gapminder-data.csv"))

continents = unique(gapminder_df[!, :continent])
gapminder_years = unique(gapminder_df[!, :year])

filter(row -> row.continent == "Asia", gapminder_df)
filter(row -> row.year == 1952, gapminder_df)


df = DataFrame(grp = repeat(1:2, 3), x = 6:-1:1, y = 4:9, z = [3:7; missing], id = 'a':'f')
df2 = DataFrame(grp = [1, 3], w = [10, 11])

# cell indexing by location

df[2, 2]

gapminder_df[2,2] # second row, secoond column

df[3, 4]

df[5, 4]

# row slicing by location

df[2:3, :]

df[3:end, :] # drop first and second row

gapminder_df[1:100, :]

# column slicing by location

df[:, 2:end] # drop first column

gapminder_df[:, 4:end] # drop first column

# row index by label
df[findfirst(==('c'), df.id), :]

gapminder_df[findfirst(==("France"), gapminder_df.country), :]

gapminder_df.country

# column index by label
df[:, :grp]

gapminder_df[:, :lifeExp]

# column slice by label

df[:, [:x, :z]]

df[:, [:grp, :y]]

gapminder_df[:, [:country, :continent]]
gapminder_df[:, [:country, :gdpPercap]]


# mixed indexing
# return what is at row with id 'c' in second column
df[findfirst(==('c'), df.id), 2]

# return what is at row with id 'f' in first column
df[findfirst(==('f'), df.id), 1]

df[findfirst(==('f'), df.id), :y]

df[df.y .< 7, :y]

gapminder_df[gapminder_df.continent .== "Africa", :]
gapminder_df[gapminder_df.continent .== "Asia", :]
gapminder_df[gapminder_df.continent .== "Asia", 1:4]

gapminder_df[gapminder_df.year .== 1952, 1:4]

gapminder_df[gapminder_df.year .>= 1980, 1:4]


mean(df.y)

mean(df.z)

mean(gapminder_df.lifeExp)
mean(gapminder_df.gdpPercap)
mean(gapminder_df.pop)

mean(skipmissing(df.z))

# create new column z1 whose values are
# the values in the z column of df, add it to end df
transform(df, :z => (v -> v .+ 1) => :z1)

new_df = transform(gapminder_df, :gdpPercap => (v -> v .* 10) => :percap10)


rename(new_df, :percap10 => :cap10)

select(df, :x => mean, :y)
