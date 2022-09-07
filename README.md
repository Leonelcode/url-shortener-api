# URL shortener API

A small url shortener API, using Sidekiq for background job processing and RSpec for test suite.

# Requirements
- [x] We must be able to put a URL into the home page and get back a URL of the shortest possible length.
- [x] We must be redirected to the full URL when we enter the short URL (ex: http://localhost:3000/a => https://google.com)
- [x] There should be a page that shows the top 100 most frequently accessed URLs.
- [x] There must be a background job that crawls the URL is shortened, pulls the <title> from the website, and stores it.
- [x] Display the title with the URL on the top 100 board.
- [x] There must be a README that explains how to set up the application and the algorithm used for generating the URL short code.

# Installations
- Install Redis first
- Clone project
- bundle install
- redis-server in another window
- rails db:setup
- Run test suite with: bundle exec rspec
- Go to: localhost:3000 to see magic!
  
## Algorithm and system design
The problem we are solving here is how to generate a short and unique key for a given URL and for that there are different approaches however the solution
exposed here consists of an algorithm that computes a unique hash (e.g., MD5 or SHA256, etc.) of the given URL. The hash can then be encoded 
for display. This encoding could be base36, base62 or even base64 encoding. Assuming the following in our system we could get the number of combinations posible of each strategy:
- Using base64 encoding, a 6 letters long key would result in 64^6 = ~68.7 billion possible strings.
- Using base64 encoding, an 8 letters long key would result in 64^8 = ~281 trillion possible strings.

## API
#### Base URL
```
 https://getshortcode.herokuapp.com/
```

## URLS

### `POST /api/v1/short`
Adds and return the url shortened  
Accepted params (*all fields must be present*):
- url (*string*)
- shortcode (*string*) not required
```json
{
  "url": "example"
}
```

### `GET /api/v1/short/:shortcode`
Redirects you to the address that :shortcode is pointing to
  
## Stats
Show the 100 most frequently visited sites
  
### `GET /api/v1/stats`

```json
[
  {
    "title": "Sidekiq In Rails: Native Worker & ActiveJob, Who’s The Winner?",
    "url": "https://www.gojek.io/blog/sidekiq-in-rails-native-worker-activejob-whos-the-winner",
    "shortcode": "aQ3-gA",
    "visit_count": 50
  }
  ...
]
```
