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
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.get(url, headers=headers,  allow_redirects=False)
    if response.ok:
        return response.json().get('data', {}).get('subscribers', 0)
    else:
        return 0
