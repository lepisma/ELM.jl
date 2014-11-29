module ELM

using Reexport
@reexport using DataFrames

export ExtremeLearningMachine
export fit!, predict

# Base code
include("base.jl")

end
