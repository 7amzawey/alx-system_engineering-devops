#!/usr/bin/python3
"""A recursive function that queries the Reddit API and returns
a list containing titles of all hot posts from a subreddit."""
import requests


def recurse(subreddit, hot_list=None):
    """Recursively fetches all hot post titles from a subreddit."""
    if hot_list is None:
        hot_list = []

    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code != 200:
        return None
    data = response.json().get('data', {})
    posts = data.get('children', [])
    titles = [post.get('data', {}).get('title', '') for post in posts]
    if not posts:
        return hot_list
    hot_list.extend(titles)
    after = data.get('after', None)
    if after:
        n_url = f"https://www.reddit.com/r/{subreddit}/hot.json?after={after}"
        if n_url:
            return recurse(subreddit, hot_list)
    return hot_list
