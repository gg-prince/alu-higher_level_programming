#!/usr/bin/python3
"""Fetches a URL and displays information about its response body."""

import requests


if __name__ == "__main__":
    response = requests.get("https://intranet.hbtn.io/status")

    print("Body response:")
    print("\t- type:", type(response.text))
    print("\t- content:", response.text)
