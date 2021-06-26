require "oauth"
require "yaml"

module AllTweets
  class Settings
    INITIAL_SETTINGS = {
      consumer_key: "GyRoi6Jx4T4olW1Rfwgfaa5kv",
      consumer_secret: "OHx2XugBhtg7kuI4yaPANXh3rplREN0Si8CoLzVWYpkeDyH3NJ"
    }

    def initialize(filename = File.expand_path("~/.alltweets"))
      @filename = filename
      @settings = load_file
    end

    attr_reader :filename

    %i[consumer_key consumer_secret access_token access_token_secret].each do |name|
      define_method(name) do
        @settings[name]
      end
    end

    def add_access_tokens(access_token, access_token_secret)
      @settings[:access_token] = access_token
      @settings[:access_token_secret] = access_token_secret
      dump_file
    end

    def exist?
      FileTest.exist?(@filename)
    end

    private

    def load_file
      return INITIAL_SETTINGS unless exist?

      YAML.load_file(@filename)
    end

    def dump_file
      File.open(@filename, "w", 0o600) do |f|
        YAML.dump(@settings, f)
      end
    end
  end
end
