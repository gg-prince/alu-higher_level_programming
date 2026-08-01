#!/usr/bin/python3
"""This module defines a base geometry class with area method
and integer validation"""


class BaseGeometry:
    """Represents a Basegeometry"""

    def area(self):
        """Raises Exception as area is not implemented"""

        raise Exception("area() is not implemented")

    def integer_validator(self, name, value):
        """Validate value as a positive integer"""

        if type(value) is not int:
            raise TypeError("{} must be an integer".format(name))

        if value <= 0:
            raise ValueError("{} must be greater than 0".format(name))
