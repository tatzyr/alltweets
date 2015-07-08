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

    attr_reader :filename

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
