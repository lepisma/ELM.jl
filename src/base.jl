# Types and functions

type HiddenLayer
	n_hidden_neurons::Integer
	weight_matrix::Matrix{Float64}
	bias_vector::Vector{Float64}
	act_func::Function
end

type ExtremeLearningMachine
	hidden_layer::HiddenLayer
	output_weights::Matrix{Float64}
	C::Integer
	
	function ExtremeLearningMachine(n_hidden_neurons::Integer; C = 100)
		this = new()
		this.C = C
		
		weight_matrix = rand(0, 0)
		bias_vector = rand(n_hidden_neurons)
		
		this.hidden_layer = HiddenLayer(n_hidden_neurons, weight_matrix, bias_vector, sigmoid)

		this
	end
end

function sigmoid(x)
	1 / (1 + exp(-x))
end

function find_activations(layer::HiddenLayer, x::Matrix{Float64}; fun = sigmoid)
	n_observations = size(x)[1]
	
	act_matrix = zeros(layer.n_hidden_neurons, n_observations)
	
	for i = 1:n_observations
		act_matrix[:, i] = fun(layer.weight_matrix * x[i, :]' + layer.bias_vector)
	end
	
	act_matrix
end

function fit!(elm::ExtremeLearningMachine, x::Matrix{Float64}, y::Vector{Float64})
	n_observations, n_inputs = size(x)
	weight_matrix = rand(elm.hidden_layer.n_hidden_neurons, n_inputs) * 2 - 1
	elm.hidden_layer.weight_matrix = weight_matrix
	
	act_matrix = find_activations(elm.hidden_layer, x)

	output_weights = y' * pinv(act_matrix)
	elm.output_weights = output_weights
end

function predict(elm::ExtremeLearningMachine, x::Vector{Float64})
	act_matrix = find_activations(elm.hidden_layer, x')
	elm.output_weights * act_matrix
end

function predict(elm::ExtremeLearningMachine, x::Matrix{Float64})
	act_matrix = find_activations(elm.hidden_layer, x)
	elm.output_weights * act_matrix
end
