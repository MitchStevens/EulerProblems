def per(x, y, z, n):
    return 2*(x+z) + 4*(n-1)

def top(x, y, z, n):
    if(n == 1):
        return x*z
    else:
        return top(x, y, z, n-1) + per(x, y, z, n-1)

def shell(x, y, z, n):
    return y*per(x, y, z, n) + 2*top(x, y, z, n)
