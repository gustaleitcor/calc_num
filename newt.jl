using Pkg: Pkg;
Pkg.add("ForwardDiff");
using ForwardDiff

include("tvm.jl")


function newt(f, pivot, erro)

	counter = 0
    last_pivot = pivot

	while true
		println(counter, " | <", pivot, "> | ", "f(", pivot, ") = ", f(pivot))
		dfx = ForwardDiff.derivative(f, pivot)
		if dfx == 0
			return (0, false)
		end
		pivot = pivot - (f(pivot) / dfx)
        
        if abs(pivot - last_pivot) < erro
            return (pivot, true) 
        end

        last_pivot = pivot

		counter += 1
	end
end
