using Flux, MLDatasets

train_x, train_y = MNIST.traindata()
test_x,  test_y  = MNIST.testdata()

m = @Chain(
  Input(784),
  Affine(128), relu,
  Affine( 64), relu,
  Affine( 10), softmax)

  m(train_x[1][1])
