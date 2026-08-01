The 7-base_geometry module
===============================

Using BaseGeometry
-------------------

Import the class:

    >>> BaseGeometry = __import__('7-base_geometry').BaseGeometry
    >>> bg = BaseGeometry()

area is not implemented and always raises an Exception:

    >>> bg.area()
    Traceback (most recent call last):
    Exception: area() is not implemented

integer_validator — valid positive integers pass silently:

    >>> bg.integer_validator("my_int", 12)
    >>> bg.integer_validator("width", 89)
    >>> bg.integer_validator("age", 1)

Non-integer values raise a TypeError:

    >>> bg.integer_validator("name", "John")
    Traceback (most recent call last):
    TypeError: name must be an integer

    >>> bg.integer_validator("age", "4")
    Traceback (most recent call last):
    TypeError: age must be an integer

    >>> bg.integer_validator("height", 3.5)
    Traceback (most recent call last):
    TypeError: height must be an integer

    >>> bg.integer_validator("value", [1, 2])
    Traceback (most recent call last):
    TypeError: value must be an integer

    >>> bg.integer_validator("age", [3])
    Traceback (most recent call last):
    TypeError: age must be an integer

    >>> bg.integer_validator("age", (4,))
    Traceback (most recent call last):
    TypeError: age must be an integer

    >>> bg.integer_validator("age", {3, 4})
    Traceback (most recent call last):
    TypeError: age must be an integer

    >>> bg.integer_validator("flag", None)
    Traceback (most recent call last):
    TypeError: flag must be an integer

Boolean is rejected too, since bool is not exactly int:

    >>> bg.integer_validator("is_valid", True)
    Traceback (most recent call last):
    TypeError: is_valid must be an integer

    >>> bg.integer_validator("age", True)
    Traceback (most recent call last):
    TypeError: age must be an integer

Zero or negative integers raise a ValueError:

    >>> bg.integer_validator("age", 0)
    Traceback (most recent call last):
    ValueError: age must be greater than 0

    >>> bg.integer_validator("distance", -4)
    Traceback (most recent call last):
    ValueError: distance must be greater than 0

    >>> bg.integer_validator("age", -4)
    Traceback (most recent call last):
    ValueError: age must be greater than 0

Missing arguments raise a TypeError from the function signature itself:

    >>> bg.integer_validator()
    Traceback (most recent call last):
    TypeError: integer_validator() missing 2 required positional arguments: 'name' and 'value'

    >>> bg.integer_validator("age")
    Traceback (most recent call last):
    TypeError: integer_validator() missing 1 required positional argument: 'value'

name argument formats correctly into each message:

    >>> try:
    ...     bg.integer_validator("custom_name", -1)
    ... except ValueError as e:
    ...     print(e)
    custom_name must be greater than 0
