import requests
from bs4 import BeautifulSoup

# Function to search YouTube for a song and artist
def search_youtube(song, artist):
    query = f"{song} {artist}".replace(' ', '+')
    url = f"https://www.youtube.com/results?search_query={query}"

    try:
        response = requests.get(url)
        response.raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')

        results = []
        for link in soup.select('a.yt-simple-endpoint'):
            video_title = link.text.strip()
            video_url = f"https://www.youtube.com{link['href']}"
            results.append({ 'title': video_title, 'url': video_url })
            break  # Limit to the first result

        return results

    except requests.HTTPError as e:
        print(f"Error accessing URL: {e}")
        return []

# Example songs
songs = [
    { 'title': 'Shape of You', 'artist': 'Ed Sheeran' },
    { 'title': 'Blinding Lights', 'artist': 'The Weeknd' }
]

# Search YouTube for each song
for song in songs:
    print(song)
    results = search_youtube(song['title'], song['artist'])
    for result in results:
        print(f"Title: {result['title']}, URL: {result['url']}")

