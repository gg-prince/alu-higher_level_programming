#!/usr/bin/python3
"""Reads a UTF-8 text file and prints its contents."""


def read_file(filename=""):
    """Read a text file and print its contents to stdout."""
    with open(filename, "r", encoding="utf-8") as f:
        print(f.read(), end="")
