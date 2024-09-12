function euler(f, y, x_0, y_0, n)
    h = (y - x_0) / n
    
    for i in 1:n
        y_0 = y_0 + h * f(x_0, y_0)
        x_0 = x_0 + h
        println(y_0, ' ', x_0)
    end

    println(y_0)
    return y_0
end
