include("tvm.jl")


function biss(f, a, b, erro)

	counter = 0
	meio = (b + a) / 2

	(temRaiz, ehRaiz) = teoremaValorMedio(f, a, b, erro)

	while temRaiz && !ehRaiz && abs(f(meio)) >= erro

		counter += 1

		meio = (b + a) / 2

		println(counter, " | <", a, ", ", b, "> | ", "f(", meio, ") = ", f(meio))

		(temRaiz, ehRaiz) = teoremaValorMedio(f, a, meio, erro)
		if temRaiz
			b = meio
			continue
		end

		(temRaiz, ehRaiz) = teoremaValorMedio(f, meio, b, erro)
		if temRaiz
			a = meio
			continue
		end
	end

	if !temRaiz
		return (0, false)
	end

	return (meio, true)
end
