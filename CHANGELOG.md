## [Unreleased]

## [2.0.0] - 2021-06-27
### Added
- Detail the token/secret pair message
- Add error handling when invalid options are specified
- Rewrite README
- We finally added CHANGELOG!

### Changed
- Include retweets
- Update dependencies
- Use rainbow instead of colorize

### Removed
- Remove `-r, --retweets` options
- Remove `-y, --yaml` options
- Remove Ruby code description from README

### Fixed
- Change the author name
- Fix failed spec
- Added standard gem to run lint

## [1.1.3] - 2016-12-10
### Changed
- Update dependencies

## [1.1.2] - 2016-12-10
### Changed
- Update description

### Removed
- Remove additional dependency and using optparse standard library

### Fixed
- Add missing requirements

## [1.1.1] - 2016-09-13
### Fixed
- Change settings file permissions to `0600`

## [1.1.0] - 2016-05-11
### Added
- Add Ruby code example to README

### Changed
- Don't open the browser automatically
- Rename class name: `Collector` => `Fetcher`
- Rename method name: `Fetcher#get_all_tweets` => `Fetcher#fetch_all_tweets`
- Allow `Fetcher#initialize` to be passed `Twitter::REST::Client` as an argument
- Change default `include_rts` from `false` to `true`. Note that only the default values have been changed when running the Ruby code directly, not when running alltweets from the command line

## [1.0.2] - 2016-03-15
### Changed
- Update description

### Fixed
- Continue processing even if opening browser is failed

## [1.0.1] - 2016-03-08
### Changed
- Update description

### Removed
- Remove Oj dependency

### Fixed
- Fix typo of gemfile homepage URL

## [1.0.0] - 2016-02-04
### Changed
- Update dependencies
- Print result to stdout instead of a file
- Change default format from YAML to JSON
- Print system messages to stderr instead of stdout

### Fixed
- Show an error if multiple username is given
- Return a status code 1 if an error occurs
- Support old Ruby 2.0 syntax

## [0.1.3] - 2015-12-17
### Changed
- Change consumer key/secret
- Update description
- Update dependencies

## [0.1.2] - 2015-11-10
### Changed
- Update description

## [0.1.1] - 2015-10-30
### Fixed
- Show an error if username is not specified
- Change the author name


## [0.1.0] - 2015-07-29
### Added
- Initial release
