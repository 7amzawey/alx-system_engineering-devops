#!/usr/bin/python3
"""
This is a module for quering a string
"""
import requests


def number_of_subscribers(subreddit):
    """quering the number of subscribers in a specific subreddit"""
    url = f"https://reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}
    response = requests.get(url, headers=headers)
    return response.json().get('data', {}).get('subscribers', 0)
