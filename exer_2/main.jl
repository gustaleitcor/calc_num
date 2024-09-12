include("euler.jl") 

function main()

# Questão 1
f(x, y) = (y*y - 2*x)/y
#euler(f, y, x_0, y_0, n)
euler(f, 1, 0, 1, 10)

# Questão 2
f(x, y) = (y*y - 2*x)/y
#euler(f, y, x_0, y_0, n)
euler(f, 1, 0, 1, 10)



end

main()

