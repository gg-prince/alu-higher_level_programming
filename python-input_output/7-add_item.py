#!/usr/bin/python3
"""
Adds all arguments to a Python list and saves them to a JSON file.
"""
import sys
import os

# Import the required functions from previous files
save_to_json_file = __import__('5-save_to_json_file').save_to_json_file
load_from_json_file = __import__('6-load_from_json_file').load_from_json_file

filename = "add_item.json"

if os.path.exists(filename):
    my_list = load_from_json_file(filename)
else:
    my_list = []

# sys.argv[1:] captures all arguments passed after the script name
my_list.extend(sys.argv[1:])

# Save the updated list back to the file
save_to_json_file(my_list, filename)
