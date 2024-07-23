include("tvm.jl")


function falsa(f, a, b, erro)

	counter = 0
    
	meio = (a*f(b) - b*f(a)) / (f(b)-f(a))
    ultimo_meio = meio

	(temRaiz, ehRaiz) = teoremaValorMedio(f, a, b, erro)

	while temRaiz && !ehRaiz && abs(f(meio)) >= erro

		counter += 1

        ultimo_meio = meio

		meio = (a*f(b) - b*f(a)) / (f(b)-f(a))

        # if (meio-ultimo_meio)/meio < erro
        #     break
        # end

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
