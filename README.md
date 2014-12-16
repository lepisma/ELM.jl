# ELM.jl

![Travis-CI Build Status](https://travis-ci.org/lepisma/ELM.jl.svg)

Extreme Learning Machine in julia

Extreme Learning Machines [1] are a variant of Single-Hidden Layer Feedforward Networks (SLFNs) with a significant departure as their weights aren't iteratively tuned. This boosts the speed of neurals nets heavily.

**According to ELM theory:**

The hidden node / neuron parameters are not only independent of the training data but also of each other, standard feedforward neural networks with such hidden nodes have universial approximation capability and separation capability. Such hidden nodes and their related mappings are terms ELM random nodes, ELM random neurons or ELM random features.

Unlike conventional learning methods which MUST see the training data before generating the hidden node / neuron parameters, ELM could randomly generate the hidden node / neuron parameters before seeing the training data.


### Install

```julia
Pkg.clone("git://github.com/lepisma/ELM.jl.git")
```

### Usage

```julia
using ELM

X_train = [1 1 1; 1 0 1; 0 0 0; 1 0 0]
Y_train = [1, 1, 0, 0]

elm = ExtremeLearningMachine(100) # number of nodes
fit!(elm, float(X_train), float(Y_train))

X_test = [0 1 1; 0 1 0]
predict(elm, float(X_test))
```

### References

**[1]** G.-B. Huang, Q.-Y. Zhu, and C.-K. Siew, "Extreme Learning Machine: A New Learning Scheme of Feedforward Neural
Networks", Proc. Int. Joint Conf.
Neural Networks (IJCNN2004), vol. 2,
IEEE, 2004, pp. 985-990.

**License** MIT
