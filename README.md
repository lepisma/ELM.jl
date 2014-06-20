# ELM.jl

![Travis-CI Build Status](https://travis-ci.org/lepisma/ELM.jl.svg)

Extreme Learning Machine in julia

### Install

`julia> Pkg.clone("git://github.com/lepisma/ELM.jl.git")`

### Usage

```
julia> using ELM

julia> X_train = [1 1 1; 1 0 1; 0 0 0; 1 0 0]
julia> Y_train = [1, 1, 0, 0]

julia> elm = ExtremeLearningMachine(100) # number of nodes
julia> fit!(elm, X_train, Y_train)

julia> X_test = [0 1 1; 0 1 0]
julia> predict(elm, X_test)
```

### License

MIT