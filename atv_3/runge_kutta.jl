function runge_kutta_3(f, x_des, x_0, y_0, h, n)

    #primeira iteracao (m = n-1)
    x_m = x_0
    y_m = y_0

    x_n = 0
    y_n = 0

    index = 1
    println("comecando rugen cutta 3...")

    while (x_des - x_m > 0.00000000001 && index <= n)
        x_n = x_m + h

        k1 = h * f(x_m, y_m)
        k2 = h * f(x_m + h / 2, y_m + k1 / 2)
        k3 = h * f(x_m + h, y_m - k1 - 2k2)

        y_n = y_m + (k1 + 4k2 + k3) / 6

        x_m = x_n
        y_m = y_n
        println(x_n, " ", y_n)

        index = index + 1
    end

    println("fim rg3...")
    return x_n, y_n
end

function runge_kutta_4(f, x_des, x_0, y_0, h, n)

    #primeira iteracao (m = n-1)
    x_m = x_0
    y_m = y_0

    x_n = 0
    y_n = 0

    index = 1
    println("rugen cutta ordem 4...")

    while (x_des - x_m > 0.00000000001 && index <= n)
        x_n = x_m + h

        k1 = h * f(x_m, y_m)
        k2 = h * f(x_m + h / 2, y_m + k1 / 2)
        k3 = h * f(x_m + h / 2, y_m + k2 / 2)
        k4 = h * f(x_m + h, y_m + k3)

        y_n = y_m + (k1 + 2k2 + 2k3 + k4) / 6

        x_m = x_n
        y_m = y_n

        println(x_n, " ", y_n)

        index = index + 1
    end

    println("fim rg4...")
    return x_n, y_n
end

function runge_kutta_4_mod(f, x_0, y_0, y, h)

    #primeira iteracao (m = n-1)
    x_m = x_0
    y_m = y_0

    x_n = x_0
    y_n = y_0

    println("rugen cutta ordem 4 mod...")

    while (abs(y_n - y) > 0.001)
        x_n = x_m + h

        k1 = h * f(x_m, y_m)
        k2 = h * f(x_m + h / 2, y_m + k1 / 2)
        k3 = h * f(x_m + h / 2, y_m + k2 / 2)
        k4 = h * f(x_m + h, y_m + k3)

        y_n = y_m + (k1 + 2k2 + 2k3 + k4) / 6

        x_m = x_n
        y_m = y_n
        println(x_n, " ", y_n)
    end

    println("fim rg4 mod...")
    return x_n, y_n
end
