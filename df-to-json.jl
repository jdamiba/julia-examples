using JSON
using DataFrames

function df2json(df::DataFrame)
  len = length(df[:,1])
  indices = names(df)
  jsonarray = [Dict([string(index) => (isnan(df[index][i]) ? nothing : df[index][i])
                     for index in indices])
               for i in 1:len]
  return JSON.json(jsonarray)
end

function writejson(path::String,df::DataFrame)
  open(path,"w") do f
    write(f,df2json(df))
  end
end
