using RDatasets, DataFrames, FixedEffectModels, Base.Test

# values checked from reghdfe
df = dataset("plm", "Cigar")
df[:pState] = pool(df[:State])
df[:pYear] = pool(df[:Year])


result = reg(Sales ~ NDI, df)
show(result)
predict(result, df)
residuals(result, df)


result = reg(Sales ~ Price + (NDI = CPI), df)
predict(result, df)
residuals(result, df)

