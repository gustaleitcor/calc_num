using Pkg: Pkg;
Pkg.add("Plots");


include("biss.jl")
include("falsa.jl")
include("newt.jl")
include("seca.jl")

using Plots

function main()
	# input_str = readline()
	# println("You entered: ", input_str)

	f(x) = (x.^3).-(x.*9).+3
	x_axis = range(-100, 100, length = 1000)

	plt = plot(x_axis, [f(x_axis) x_axis.*0])

	display(plt)

	lower_bound = parse(Float64, readline())
	upper_bound = parse(Float64, readline())

	if lower_bound > upper_bound
		aux = lower_bound
		lower_bound = upper_bound
		upper_bound = aux
	end

	(raiz, ehRaiz) = newt(f, -2, 0.01)

	if ehRaiz
		println("f(", raiz, ")", " = ", f(raiz))
	else
		println("Não tem raiz nesse intervalo")
	end
end

main()
