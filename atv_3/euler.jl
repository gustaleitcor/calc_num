function euler(f, x, x_0, y_0, n)
    println("comecando euler...")

    h = (x - x_0) / n

    for i in 1:n
        y_0 = y_0 + h * f(x_0, y_0)
        x_0 = x_0 + h
        println(x_0, ' ', y_0)
    end

    println("fim euler...")
    return x_0, y_0
end
