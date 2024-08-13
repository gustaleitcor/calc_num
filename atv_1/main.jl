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
	#
	e = 2.718281828459045235360287471352

	f(x) = 6 - 15 * (e^(-0.1*x) - e^(-0.5*x))

	x_axis = range(0, 4, length = 1000)

	plt = plot(x_axis, [f.(x_axis) x_axis.*0], label = ["f(x)" "y = 0"], xlabel = "x", ylabel = "f(x)", title = "f(x) = 6 - 15 * (e^(-0.1*x) - e^(-0.5*x))")

	display(plt)
	savefig(plt, "plot3.png")

	readline()

	# lower_bound = parse(Float64, readline())
	# upper_bound = parse(Float64, readline())

	# if lower_bound > upper_bound
	# 	aux = lower_bound
	# 	lower_bound = upper_bound
	# 	upper_bound = aux
	# end

	(raiz, ehRaiz) = newt(f, -2, 0.01)

	if ehRaiz
		println("f(", raiz, ")", " = ", f(raiz))
	else
		println("Não tem raiz nesse intervalo")
	end
end

main()
