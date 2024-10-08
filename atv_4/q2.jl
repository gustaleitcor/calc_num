function q_dois()
    P(h)= -5*(h^2) - 3*h
    acc = 0

    for i in range(0, 8, 5)
        acc += ((P(i) + P(i+2)) * 2) / 2
    end

    println("Under Pressure: ", acc)

end

export q_dois