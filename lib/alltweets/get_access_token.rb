require "colorize"
require "launchy"
require "oauth"

module AllTweets
  module GetAccessToken
    def self.get_access_token(consumer_key, consumer_secret)
      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, site: "https://api.twitter.com")
      request_token = consumer.get_request_token

      puts "1) Open: #{request_token.authorize_url}".colorize(:cyan)
      Launchy.open(request_token.authorize_url)

      print "2) Enter the PIN: ".colorize(:cyan)
      pin = $stdin.gets.strip

      access_token = request_token.get_access_token(oauth_verifier: pin)
      [access_token.token, access_token.secret]
    end
  end
end
