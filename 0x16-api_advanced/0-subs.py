#!/usr/bin/python3
"""
Return the total number of subscribers.
"""


import requests


def number_of_subscribers(subreddit):
    """Return the total number of subscirbers."""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        return response.json().get('data', {}).get('subscribers', 0)
    else:
        return 0
