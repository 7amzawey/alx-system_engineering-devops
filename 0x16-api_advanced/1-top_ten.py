#!/usr/bin/python3
"""
The top 10 hot posts for a given subreddit
"""
import requests


def top_ten(subreddit):
    """Get the top ten hot posts and print their titles"""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        posts = response.json().get('data', {}).get('children', [])
        titles = [post.get('data', {}).get('title', '') for post in posts[:10]]
        for title in titles:
            print(title)
    else:
        print(None)
