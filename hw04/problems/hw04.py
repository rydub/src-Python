HW_SOURCE_FILE = 'hw04.py'

def g(n):
    """Return the value of G(n), computed recursively.

    >>> g(1)
    1
    >>> g(2)
    2
    >>> g(3)
    3
    >>> g(4)
    10
    >>> g(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g', ['While', 'For'])
    True
    """
    if n < 4:
        return n

    return g(n - 1) + 2 * g(n - 2) + 3 * g(n - 3)

def g_iter(n):
    """Return the value of G(n), computed iteratively.

    >>> g_iter(1)
    1
    >>> g_iter(2)
    2
    >>> g_iter(3)
    3
    >>> g_iter(4)
    10
    >>> g_iter(5)
    22
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'g_iter', ['Recursion'])
    True
    """
    if n < 4:
        return n
    
    else:
        result, resultLess3, resultLess2, resultLess1 = 0, 1, 2, 3
        i = 4    
        while i <= n:
            result = resultLess1 + 2 * resultLess2 + 3 * resultLess3
            resultLess3, resultLess2, resultLess1 = resultLess2, resultLess1, result
            i += 1
        return result




def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(7)
    7
    >>> pingpong(8)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    0
    >>> pingpong(30)
    6
    >>> pingpong(68)
    2
    >>> pingpong(69)
    1
    >>> pingpong(70)
    0
    >>> pingpong(71)
    1
    >>> pingpong(72)
    0
    >>> pingpong(100)
    2
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'pingpong', ['Assign', 'AugAssign'])
    True
    """

    def pingpongHelp(i, state):
        if n == i:
            if state:
                return 1
            else:
                return 0

        if i % 7 == 0 or has_seven(i):
            return pingpongHelp(i + 1, not(state))
        else:
            if state:
                return 1 + pingpongHelp(i + 1, state)
            else:
                return pingpongHelp(i + 1, state) - 1
    
    return pingpongHelp(1, True)
            

def has_seven(k):
    """Returns True if at least one of the digits of k is a 7, False otherwise.

    >>> has_seven(3)
    False
    >>> has_seven(7)
    True
    >>> has_seven(2734)
    True
    >>> has_seven(2634)
    False
    >>> has_seven(734)
    True
    >>> has_seven(7777)
    True
    """
    if k % 10 == 7:
        return True
    elif k < 10:
        return False
    else:
        return has_seven(k // 10)



def count_change(amount):
    """Return the number of ways to make change for amount.

    >>> count_change(7)
    6
    >>> count_change(10)
    14
    >>> count_change(20)
    60
    >>> count_change(100)
    9828
    """
    def counterHelp(amount, coinSize):
        if amount == 0:
            return 1
        elif amount < 0:
            return 0
        elif coinSize > amount:
            return 0

        return counterHelp(amount - (2 ** coinSize), coinSize) + counterHelp(amount, coinSize + 1)

    return counterHelp(amount, 0)


###################
# Extra Questions #
###################

from operator import sub, mul

def make_anonymous_factorial():
    """Return the value of an expression that computes factorial.

    >>> make_anonymous_factorial()(5)
    120
    >>> from construct_check import check
    >>> check(HW_SOURCE_FILE, 'make_anonymous_factorial', ['Assign', 'AugAssign', 'FunctionDef', 'Recursion'])
    True
    """
    return 'YOUR_EXPRESSION_HERE'
