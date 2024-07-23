function teoremaValorMedio(f, lower_bound, upper_bound, erro)

    signal = f(lower_bound) * f(upper_bound)

    if signal > 0
        return (false, false)
    else
        return (true, false)
    end
end