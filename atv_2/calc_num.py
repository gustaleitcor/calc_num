from matplotlib.lines import lineStyles
import random

file_path = "./results.txt"

try:
    with open(file_path, "r") as file:
        start_to_read = False
        line_counter = 0
        v2 = 0
        v3 = 0
        t = 0
        states = []
        for line in file:
            # Process each line here
            line = line.strip()  # Remove leading/trailing whitespaces
            if line == "Values:":
                start_to_read = True
                continue

            if start_to_read:
                line_counter += 1

                # how to convert numbers like 2.500000000000000e-09 to float?
                # use float() function


                if line_counter % 4 == 1:
                    t = (float(line.split()[1]))
                    continue
                elif line_counter % 4 == 2:
                    v2 = (float(line))
                    continue
                elif line_counter % 4 == 3:
                    v3 = (float(line))

                states.append((t, v2, v3))

    # plot states t = time, v1 = voltage 1, v8 = voltage 8
    # also plot the gain v8/v1
    # put a title in the plot referring the frequency of the input signal
    import matplotlib.pyplot as plt
    import numpy as np

    states = [state for state in states if state[0] >= 2 and state[1] == 0]

    random.shuffle(states)
    states = states[:10]

    for state in states:
        print(f"t: {state[0]}, v2: {state[1]}, v3: {state[2]}")

    for state in states:
        print(f"t: {state[0]}, v2: {state[1]}, v3: {state[2]}")

    #plot scatter
    states = np.array(states)
    #plt.scatter(states[:, 0], states[:, 1], label="Tensão de entrada")
    plt.scatter(states[:, 0], states[:, 2], label="Tensão do capacitor")
    #plt.plot(states[:, 0], states[:, 2]/states[:, 1], label="Gain")
    plt.xlabel("Tempo (s)")
    plt.ylabel("Tensão (V)")
    plt.title("Descarregamento de um capacitor")
    plt.legend()
    plt.savefig("plot.png")
    plt.show()













except FileNotFoundError:
    print(f"File '{file_path}' not found.")
except IOError:
    print(f"Error reading file '{file_path}'.")
