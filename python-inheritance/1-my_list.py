#!/usr/bin/python3
"""This module defines a list class with a sorted print method"""


class MyList(list):
    """Represents a list that can print itself sorted"""

    def print_sorted(self):
        """Print the list in ascending sorted order"""

        print(sorted(self))
