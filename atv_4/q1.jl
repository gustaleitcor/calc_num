

function q_um()
	vel = [0, 4.67, 7.34, 8.86, 9.73, 10.22, 10.51, 10.67, 10.76, 10.81, 10.81]
	acc = 0

	h = 0.5
	acc += vel[1]

	for (i, v) in enumerate(vel[2:length(vel)-1])
		acc += v * (i % 2 == 0 ? 2 : 4)
	end

	acc += vel[length(vel)]

	acc *= h / 3

	println("Distância total percorrido : ", acc)

end
export q_um
