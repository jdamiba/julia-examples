A = rand(1:4, 3, 3)
B = A # does not create new array, just new pointer to original
C = copy(A) # explicitly create new array
[ B C ]
A[1] = 17 # updating A will also update B
[ B C ]
x = ones(3)
b = A * x
Acongj = A'
Asym = A + A'
Apd = A'A
A\b # solve Ax = B for square A
Atall = A[:, 1:2]
Atall\b
