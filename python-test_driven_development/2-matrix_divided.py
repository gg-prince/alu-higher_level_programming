#!/usr/bin/python3
"""This module defines a function that performs matrix division"""


def matrix_divided(matrix, div):
    """Returns division of all elements of matrix
    Args:
        matrix (list): list of lists of integers or floats.
        div (int/float): the number to divide each element by.

    Raises:
        TypeError: if matrix is not a list of lists of integers/floats.
        TypeError: if rows of matrix are not all the same size.
        TypeError: if div is not a number.
        ZeroDivisionError: if div is equal to 0.

    Returns:
        list: a new matrix with all elements divided by div.
    """
    if (not isinstance(matrix, list) or matrix == [] or
            not all(isinstance(row, list) for row in matrix)):
        raise TypeError(
            "matrix must be a matrix (list of lists) of integers/floats")

    for row in matrix:
        if not all(isinstance(item, (int, float)) and
                   not isinstance(item, bool) for item in row):
            raise TypeError(
                "matrix must be a matrix (list of lists) of integers/floats")

    if len(set(len(row) for row in matrix)) != 1:
        raise TypeError("Each row of the matrix must have the same size")

    if not isinstance(div, (int, float)) or isinstance(div, bool):
        raise TypeError("div must be a number")

    if div == 0:
        raise ZeroDivisionError("division by zero")

    new_matrix = [[round(item / div, 2) for item in row] for row in matrix]
    return new_matrix
