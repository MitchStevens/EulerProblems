def non_bouncy(digits):
    return increasing(digits) + decreasing(digits)

def increasing(digits):
    return map(increasing_starting_with, range(0, 10))

def increasing_starting_with(digits, n):
    if(digits == 1):
        return 1

    acc = 0
    for i in range(0, n):
        acc += (10-i)*increasing_starting_with(i)
    return acc

print increasing(2)
