#!/usr/bin/python3
"""
This is a module for quering a string
"""
import requests


def number_of_subscribers(subreddit):
    """number_of_subscribers
    queries the Reddit API and returns the number of subscribers
    If not a valid subreddit, return 0."""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    response = requests.get(url, allow_redirects=False)
    if response.ok:
        return response.json().get('data').get('subscribers')
    else:
        return 0
