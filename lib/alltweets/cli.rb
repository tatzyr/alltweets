require "colorize"
require "json"
require "optparse"

module AllTweets
  class CLI
    def initialize
      @screen_name, @opts = parse_args
      @settings = Settings.new
      update_access_token
      @fetcher = Fetcher.new(
        consumer_key: @settings.consumer_key,
        consumer_secret: @settings.consumer_secret,
        access_token: @settings.access_token,
        access_token_secret: @settings.access_token_secret
      )
    end

    def run
      warn "Downloading @#{@screen_name}'s all tweets"
      result = @fetcher.fetch_all_tweets(@screen_name, include_retweets: @opts["retweets"]).map(&:to_h)

      if @opts["yaml"]
        dump_data = YAML.dump(result)
      else
        dump_data = JSON.dump(result)
      end

      puts dump_data
    rescue
      warn "Error: #{$!}".colorize(:red)
      exit 1
    end

    private
    def parse_args
      opts = ARGV.getopts("", "retweets", "yaml", "help", "version")

      if opts["help"]
        puts <<EOS
alltweets #{VERSION}
Options:
  -r, --retweets    Include retweets
  -y, --yaml        Use YAML instead of JSON
  -v, --version     Print version and exit
  -h, --help        Show this message
EOS
        exit
      end

      if opts["version"]
        puts "alltweets #{VERSION}"
        exit
      end

      unless ARGV.size == 1
        warn "usage: alltweets [options] <screen name>"
        exit 1
      end

      screen_name = ARGV.first

      [screen_name, opts]
    end

    def update_access_token
      unless @settings.exist?
        consumer = OAuth::Consumer.new(
          @settings.consumer_key,
          @settings.consumer_secret,
          site: "https://api.twitter.com"
        )
        request_token = consumer.get_request_token

        warn "1) Open: #{request_token.authorize_url}".colorize(:cyan)
        $stderr.print "2) Enter the PIN: ".colorize(:cyan)
        pin = $stdin.gets.strip

        access_token = request_token.get_access_token(oauth_verifier: pin)

        warn "Saving access token and access token secret to #{@settings.filename}"
        @settings.add_access_tokens(access_token.token, access_token.secret)
      end
    end
  end
end
