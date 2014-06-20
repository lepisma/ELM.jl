using ELM

elm = ExtremeLearningMachine(100)

# Testing XOR
x = [1.0 1.0; 0.0 1.0; 0.0 0.0; 1.0 0.0]
y = [0.0, 1.0, 0.0, 1.0]

fit!(elm, x, y)

y_pred = predict(elm, [1 1.; 0 1; 1 1])
@assert y_pred[1] < 0.2
@assert y_pred[2] > 0.8
@assert y_pred[3] < 0.2
