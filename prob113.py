# the number of bouncy numbers with n digits
#def bouncy_numbers(n):
#    10**n - increasing(n) - decreasing(n)

def strictly_increasing(n):
    for i in range(1, 10):
        for j in range(i, 10):
            yield (i, j)
