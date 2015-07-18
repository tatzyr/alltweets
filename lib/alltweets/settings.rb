require "colorize"
require "launchy"
require "oauth"
require "yaml"

module AllTweets
  class Settings
    INITIAL_SETTINGS = {
      consumer_key: "dJHSlSiV3iuchF4UdXKxw",
      consumer_secret: "y34Ftm34OJNoNO3wXlLujnq5aULaK5eRzDz1DnbjGQ",
    }

    def initialize(filename = File.expand_path('~/.alltweets'))
      @filename = filename
      @settings = load_file
    end

    def add_access_tokens(access_token, access_token_secret)
      @settings[:access_token] = access_token
      @settings[:access_token_secret] = access_token_secret
      dump_file
    end

    %i[consumer_key consumer_secret access_token access_token_secret].each do |name|
      define_method(name) do
        @settings[name]
      end
    end

    def exist?
      FileTest.exist?(@filename)
    end

    def get_access_token
      unless exist?
        consumer = OAuth::Consumer.new(consumer_key, consumer_secret, site: "https://api.twitter.com")
        request_token = consumer.get_request_token

        puts "1) Open: #{request_token.authorize_url}".colorize(:cyan)
        Launchy.open(request_token.authorize_url)

        print "2) Enter the PIN: ".colorize(:cyan)
        pin = $stdin.gets.strip

        access_token = request_token.get_access_token(oauth_verifier: pin)
        access_token, access_token_secret = access_token.token, access_token.secret

        puts "Saving access token and access token secret to #{@filename}"
        add_access_tokens(access_token, access_token_secret)
      end
    end

    private
    def load_file
      return INITIAL_SETTINGS unless exist?

      YAML.load_file(@filename)
    end

    def dump_file
      open(@filename, "w") do |f|
        YAML.dump(@settings, f)
      end
    end
  end
end
