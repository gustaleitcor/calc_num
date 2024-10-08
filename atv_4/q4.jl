function q_quatro()

	m = [  3 4 7 20;
		20 25 40 50;
		10 15 20 22;
		10 8 10 15]

	m[:, 4], m[:, 1] = m[:, 1], m[:, 4]
	m[:, 3], m[:, 2] = m[:, 2], m[:, 3]

	b = [504, 1970, 970, 601]

	x = [0.0, 0.0, 0.0, 0.0]

	fx1(x2, x3, x4) = (b[1] - m[1, 2]x2 - m[1, 3]x3 - m[1, 4]x4) / m[1, 1]
	fx2(x1, x3, x4) = (b[2] - m[2, 1]x1 - m[2, 3]x3 - m[2, 4]x4) / m[2, 2]
	fx3(x1, x2, x4) = (b[3] - m[3, 1]x1 - m[3, 2]x2 - m[3, 4]x4) / m[3, 3]
	fx4(x1, x2, x3) = (b[4] - m[4, 1]x1 - m[4, 2]x2 - m[4, 3]x3) / m[4, 4]

	while (norm(m * x - b) > 0.0001)
		x[1] = fx1(x[2], x[3], x[4])
		x[2] = fx2(x[1], x[3], x[4])
		x[3] = fx3(x[1], x[2], x[4])
		x[4] = fx4(x[1], x[2], x[3])
	end

	x = reverse(x)

	for (i, v) in enumerate(x)
		x[i] = round(v)
	end

	println("x1: ", x[1], " | x2: ", x[2], " | x3: ", x[3], " | x4: ", x[4], " => norma: ", norm(m * x - b))
end

export q_quatro
