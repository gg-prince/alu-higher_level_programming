#!/usr/bin/python3
"""This module defines a function that prints a square"""


def print_square(size):
    """Prints a square with the characters #
    Raises:
    TypeError: If size is not an integer
    ValueError; if size is less than zero
    """

    if type(size) is not int:
        raise TypeError("size must be an integer")
    if size < 0:
        raise ValueError("size must be >= 0")

    for i in range(size):
        [print("#", end="") for _ in range(size)]
        print("")
