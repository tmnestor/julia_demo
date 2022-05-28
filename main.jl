using VegaLite, DataFrames, Query, VegaDatasets

cars = dataset("cars")

cars |> @select(:Acceleration, :Name) |> collect

function show_plot(data, origin)
    df = data |> @filter(_.Origin==origin) |> DataFrame

    return df |> @vlplot(:point, :Acceleration, :Miles_per_Gallon)
end

p = show_plot(cars, "USA")

p |> save("foo.png")