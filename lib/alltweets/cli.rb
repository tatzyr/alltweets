require "oj"
require "trollop"

module AllTweets
  class CLI
    def initialize
      @settings = Settings.new
    end

    def collect(screen_name, include_retweets:)
      collector = Collector.new(
        consumer_key: @settings.consumer_key,
        consumer_secret: @settings.consumer_secret,
        access_token: @settings.access_token,
        access_token_secret: @settings.access_token_secret
      )

      collector.get_all_tweets(screen_name, include_retweets: include_retweets)
    end

    def run
      @settings.get_access_token

      opts = Trollop::options do
        opt :retweets, "Include retweets to output"
        opt :json, "Use JSON"
      end

      screen_name = ARGV.first
      result = collect(screen_name, include_retweets: opts[:retweets])

      result.map!(&:to_h)
      ext = opts[:json] ? ".json" : ".yml"
      dump_data =
        if opts[:json]
          Oj.dump(result, mode: :compat)
        else
          YAML.dump(result)
        end

      filename = "alltweets_#{screen_name}#{ext}"
      puts "Saving #{screen_name}'s all tweets to #{filename}"
      open("alltweets_#{screen_name}#{ext}", "w") do |f|
        f.puts dump_data
      end
    end
  end
end
