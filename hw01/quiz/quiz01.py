def multiple(a, b):
    """Return the smallest number n that is a multiple of both a and b.

    >>> multiple(3, 4)
    12
    >>> multiple(14, 21)
    42
    """
    """factArrA, factArrB = [], []
                for i in range(2,max(a,b)):
                    if a%i == 0:
                        factArrA.append(i)
                    if b%i == 0:
                        factArrB.append(i)"""
    multA, multB, i, n = a, b, 2, 2
    while(multA != multB):
        if multA < multB:
            multA = a * n
            n += 1
        else:
            multB = b * i
            i += 1
    return multA


def unique_digits(n):
    """Return the number of unique digits in positive integer n

    >>> unique_digits(8675309) # All are unique
    7
    >>> unique_digits(1313131) # 1 and 3
    2
    >>> unique_digits(13173131) # 1, 3, and 7
    3
    >>> unique_digits(10000) # 0 and 1
    2
    >>> unique_digits(101) # 0 and 1
    2
    >>> unique_digits(10) # 0 and 1
    2
    """
    check, unique, n1, n2 = 0, 0, n, n
    while n1 > 0:
        check = n1 % 10
        n1 = n1 // 10
        n2 = n1
        flag = False
        while n2 > 0:
            if (n2 % 10) == check:
                flag = True
            n2 = n2 // 10
        if flag == pythonFalse:
            unique += 1
    return unique


