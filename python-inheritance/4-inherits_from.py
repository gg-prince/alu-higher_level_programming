#!/usr/bin/python3
"""Provides a function for checking inherited classes."""


def inherits_from(obj, a_class):
    """Return True if obj belongs to a subclass of a_class."""
    return isinstance(obj, a_class) and type(obj) is not a_class
