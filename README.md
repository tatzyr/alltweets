# alltweets

Downloads someone's all tweets.

## Installation

```zsh
$ gem install alltweets
```

## Usage

Just specify the username. The results will be retrieved as JSON data and displayed on the stdout.

```zsh
$ alltweets tatzyr > tweets.json
```

## Options

* `-v`, `--version`: Print version and exit
* `-h`, `--help`: Show help message

## Limitations

alltweets can only retrieve 3200 tweets due to Twitter API limitations.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` and `rake standard` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec alltweets` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tatzyr/alltweets.
