require "twitter"

module AllTweets
  class Collector
    def initialize(hash)
      @client = Twitter::REST::Client.new(hash)
    end

    def get_all_tweets(user, include_retweets:)
      collect_with_max_id do |max_id|
        options = { count: 200, include_rts: include_retweets }
        options[:max_id] = max_id unless max_id.nil?
        @client.user_timeline(user, options)
      end
    end

    private
    def collect_with_max_id(collection=[], max_id = nil, &block)
      response = yield(max_id)
      collection += response
      if response.empty?
        collection.flatten
      else
        collect_with_max_id(collection, response.last.id - 1, &block)
      end
    end
  end
end
