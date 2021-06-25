# AllTweets

Downloads someone's all tweets.

## Installation

```
$ gem install alltweets
```

## Usage

### Commands

* `alltweets [options] SCREEN_NAME`: Download SCREEN_NAME's all tweets.

### Options

* `-r`, `--retweets`: Include retweets
* `-y`, `--yaml`: Use YAML instead of JSON
* `-v`, `--version`: Print version and exit
* `-h`, `--help`: Show help message

### Example

* `alltweets tatzyr`: Download @tatzyr's all tweets.
* `alltweets -r tatzyr`: Download @tatzyr's all tweets including retweets.
* `alltweets -y tatzyr`: Download @tatzyr's all tweets as YAML instead of JSON.

### Using AllTweets from Ruby

```ruby
require "alltweets"

fetcher = AllTweets::Fetcher.new(
  consumer_key: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  consumer_secret: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  access_token: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  access_token_secret: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
)

# # alternatively
# require "twitter"
# client = Twitter::REST::Client.new(...)
# fetcher = AllTweets::Fetcher.new(client)

fetcher.fetch_all_tweets("tatzyr")
# => [#<Twitter::Tweet id=...>, #<Twitter::Tweet id=...>, ...]

fetcher.fetch_all_tweets("tatzyr", include_retweets: false)
# => [#<Twitter::Tweet id=...>, #<Twitter::Tweet id=...>, ...]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec alltweets` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tatzyr/alltweets.
