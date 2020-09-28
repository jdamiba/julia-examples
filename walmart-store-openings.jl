using CSV, DataFrames, Dates

url = "https://github.com/plotly/datasets/raw/master/1962_2006_walmart_store_openings.csv"
download(url, "walmart.csv")
df = DataFrame(CSV.File("walmart.csv"))

names(df)

dates = String.(df[!, :OPENDATE])

before_2000 = []
after_2000 []

format = Dates.DateFormat("m/d/y")
open_dates = parse.(Date, dates, format)  + Year(2000)

for i in 1:length(open_dates)
    println(open_dates[i] > Date(2007, 1, 1))
end


#before_1990 = df[df.OPENDATE ]
