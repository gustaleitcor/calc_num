using LinearAlgebra

function q_tres()
	x = [0.0, 0.0, 0.0]
	b = [1.0, 4.0, 0.0]
	m = [3 -1 1; 3 3 7; 3 6 2]

	m[2,:], m[3,:] = m[3,:], m[2,:]

	fx1(x2, x3) = (b[1] - m[1, 2]x2 - m[1, 3]x3) / m[1, 1]
	fx2(x1, x3) = (b[2] - m[2, 1]x1 - m[2, 3]x3) / m[2, 2]
	fx3(x1, x2) = (b[3] - m[3, 1]x1 - m[3, 2]x2) / m[3, 3]

	while (norm(m * x - b) > 0.0001)
		x[1] = fx1(x[2], x[3])
		x[2] = fx2(x[1], x[3])
		x[3] = fx3(x[1], x[2])
	end

	println("x1: ", x[1], " | x2: ", x[2], " | x3: ", x[3], " => norma: ", norm(m*x - b))
end

export q_tres
