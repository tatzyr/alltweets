require "colorize"
require "json"
require "trollop"

module AllTweets
  class CLI
    def initialize
      @screen_name, @opts = parse_args
      @settings = Settings.new
      update_access_token
      @collector = Collector.new(
        consumer_key: @settings.consumer_key,
        consumer_secret: @settings.consumer_secret,
        access_token: @settings.access_token,
        access_token_secret: @settings.access_token_secret
      )
    end

    def run
      warn "Downloading #{@screen_name}'s all tweets"
      result = @collector.get_all_tweets(@screen_name, include_retweets: @opts[:retweets]).map(&:to_h)

      if @opts[:yaml]
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
      opts = Trollop::options do
        opt :retweets, "Include retweets"
        opt :yaml, "Use YAML instead of JSON"
        version "alltweets #{VERSION}"
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
        Launchy.open(request_token.authorize_url)

        $stderr.print "2) Enter the PIN: ".colorize(:cyan)
        pin = $stdin.gets.strip

        access_token = request_token.get_access_token(oauth_verifier: pin)

        warn "Saving access token and access token secret to #{@settings.filename}"
        @settings.add_access_tokens(access_token.token, access_token.secret)
      end
    end
  end
end
