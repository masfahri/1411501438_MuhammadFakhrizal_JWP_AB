epsilon = 1
while True:
    epsilon = epsilon/2.0
    if (epsilon+1<=1):
        break
epsilon = 2*epsilon
print epsilon
