#!/usr/bin/python3
"""
this module is for expermenting a fake API
"""
import csv
import requests
import sys

if __name__ == "__main__":

    employee_id = int(sys.argv[1])

    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"

    response = requests.get(url)
    response_json = response.json()
    employee_name = response_json['username']

    todos_url = (
        f"https://jsonplaceholder.typicode.com/todos?userId={employee_id}"
    )
    todos_response = requests.get(todos_url)
    todos_data = todos_response.json()
    csv_file = f'{employee_id}.csv'
    with open(csv_file, 'w') as file:
        writer = csv.writer(file)

        for task in todos_data:
            writer.writerow(
                        [str(employee_id),
                        str(employee_name),
                        str(task['completed']),
                        str(task['title'])]
                    )

    print("data has been written")
