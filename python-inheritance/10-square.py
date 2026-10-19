#!/usr/bin/python3
"""Defines a square based on the Rectangle class."""

Rectangle = __import__('9-rectangle').Rectangle


class Square(Rectangle):
    """Represent a square with equal width and height."""

    def __init__(self, size):
        """Initialize a square with a validated size."""
        self.integer_validator("size", size)
        self.__size = size
        super().__init__(size, size)

    def area(self):
        """Return the area of the square."""
        return self.__size * self.__size
