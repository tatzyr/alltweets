# AllTweets

Downloads someone's all tweets.

## Installation

```
$ gem install alltweets
```

## Usage

### Commands

* `alltweets <screen name>`: Download <screen name>'s all tweets.

### Options

* `-r`, `--retweets`: Include retweets to output
* `-j`, `--json`: Download as JSON (default: YAML)
* `-h`, `--help`: Show help message

### Example

* `alltweets tatzyr`: Download @tatzyr's all tweets.
* `alltweets -r tatzyr`: Download @tatzyr's all tweets including retweets.
* `alltweets -j tatzyr`: Download @tatzyr's all tweets as JSON.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec alltweets` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Tatzyr/alltweets.
