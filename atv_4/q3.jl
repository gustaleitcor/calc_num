using LinearAlgebra

function q_tres()
	x = [0.0, 0.0, 0.0]
	b = [1.0, 4.0, 0.0]

    m = [3 -1 1; 3 3 7; 3 6 2]

	fx1(x2, x3) = (1 - x3 + x2) / 3
	fx2(x1, x3) = (4 - 7 * x3 - 3 * x1) / 3
	fx3(x1, x2) = (-3 * x1 - 6 * x2) / 2

    while(norm(x-b) > 0.001)
        println(norm(x-b), " ", x)
        x[1] = fx1(x[2], x[3])
        x[2] = fx2(x[1], x[3])
        x[3] = fx3(x[1], x[2])
    end
end

export q_tres
