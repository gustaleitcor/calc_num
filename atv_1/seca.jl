using Pkg: Pkg;
Pkg.add("ForwardDiff");
using ForwardDiff

include("tvm.jl")


function seca(f, a, b, erro)

	counter = 0
	c = 0

	while true
		c = (a * f(b) - b * f(a)) / (f(b) - f(a))

		println(counter, " | <", a, ", ", b, ", ", c, "> | ", "f(", c, ") = ", f(c))

		if abs((c - b) / c) < erro
			return (c, true)
		end

		a = b
		b = c

		counter += 1
	end
end
