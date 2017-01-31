def countdown(n):
    """
    >>> for number in countdown(5):
    ...     print(number)
    ...
    5
    4
    3
    2
    1
    0
    """
    if n >= 0:
        yield n
        yield from countdown(n-1)

def trap(s, k):
    """Return a generator that yields the first K values in iterable S,
    but raises a ValueError exception if any more values are requested.

    >>> t = trap([3, 2, 1], 2)
    >>> next(t)
    3
    >>> next(t)
    2
    >>> next(t)
    ValueError
    >>> list(trap(range(5), 5))
    ValueError
    """
    t = iter(s)
    while k > 0:
        yield next(t)
        k -= 1
    raise ValueError

    #assert k <= len(s)
    #if k == 0:
    #    raise ValueError
    #yield s[0]
    #yield from trap(s[1:], k-1)

def repeated(t, k):
    """Return the first value in iterable T that appears K times in a row.

    >>> s = [3, 2, 1, 2, 1, 4, 4, 5, 5, 5]
    >>> repeated(trap(s, 7), 2)
    4
    >>> repeated(trap(s, 10), 3)
    5
    >>> print(repeated([4, None, None, None], 3))
    None
    """
    assert k > 0
    prev = 0
    count = 1
    for i in t:
        if prev == i:
            count += 1
            if count == k:
                return i
        elif prev != i and count:
            count = 1
        prev = i

def hailstone(n):
    """
    >>> for num in hailstone(10):
    ...     print(num)
    ...
    10
    5
    16
    8
    4
    2
    1
    """
    while n > 1:
        yield n
        if n % 2 == 0:
            n = n // 2
        else:
            n = 1 + n * 3
    yield n