include("euler.jl") 
include("rugen_cutta.jl")
function main()

# Questão 1
f(x, y) = (y*y - 2*x)/y
x = 1 # x do valor desejado y(x)

x_0 = 0 
y_0 = 1
h = 0.2
n = (1-0)/h

#euler(f, x, x_0, y_0, n)
e_x1, e_y1 = euler(f, x, x_0, y_0, n)

#rugen_cutta(f, x, x_0, y_0, h, n)
rg_x1, rg_y1 = rugen_cutta_3(f, x, x_0, y_0, h, n)

println("\nrespostas questao 1:")

println("\neuler: x, y(x)")
println(e_x1, ", ", e_y1)
println("\nrugen cutta: x, y(x)")
println(rg_x1, ", ", rg_y1)
println("\nErro absoluto: ")
println(abs(e_y1 - 3^0.5), ", ", abs(rg_y1 - 3^0.5))

# Questão 2
f(x, y) = (0.11*9.8-0.002*y*abs(y)) / 0.11
x = 1 # x do valor desejado y(x)

x_0 = 0 
y_0 = 8
h = 0.1
n = (1-0)/h

#euler(f, x, x_0, y_0, n)
e_x1, e_y1 = euler(f, x, x_0, y_0, n)

#rugen_cutta(f, x, x_0, y_0, h, n)
rg_x1, rg_y1 = rugen_cutta_3(f, x, x_0, y_0, h, n)

println("\nrespostas questao 2:")

println("\neuler: x, y(x)")
println(e_x1, ", ", e_y1)
println("\nrugen cutta: x, y(x)")
println(rg_x1, ", ", rg_y1)
# println("\nErro absoluto: ")
# println(abs(e_y1 - 3^0.5), ", ", abs(rg_y1 - 3^0.5))


end

main()

