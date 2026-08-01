#!/usr/bin/python3
"""Searches a user through an API and handles JSON responses."""

import requests
import sys


if __name__ == "__main__":
    url = "http://0.0.0.0:5000/search_user"

    if len(sys.argv) > 1:
        q = sys.argv[1]
    else:
        q = ""

    response = requests.post(url, data={"q": q})

    try:
        data = response.json()

        if data:
            print("[{}] {}".format(data.get("id"), data.get("name")))
        else:
            print("No result")

    except ValueError:
        print("Not a valid JSON")
