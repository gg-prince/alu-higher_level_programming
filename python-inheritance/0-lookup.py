#!/usr/bin/python3
"""Provides a function for listing an object's attributes and methods."""


def lookup(obj):
    """Return a list of attributes and methods available on an object."""
    return dir(obj)
