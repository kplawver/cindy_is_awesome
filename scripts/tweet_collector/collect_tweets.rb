require 'twitter'
require 'json'

class CindyTweetCollector

  def self.config
    @config ||= JSON.parse(File.read("config.json"))
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = CindyTweetCollector.config['consumer_key']
      config.consumer_secret     = CindyTweetCollector.config['consumer_secret']
      config.access_token        = CindyTweetCollector.config['access_token']
      config.access_token_secret = CindyTweetCollector.config['access_token_secret']
    end
  end

  def query
    @query ||= "@cindyli since:2018-10-22"
  end

  def search(max_id = nil)
    puts "MAX_ID: #{max_id}"
    options = { count: 100, result_type: "recent" }
    unless max_id.nil?
      options[:max_id] = max_id
    end
    results = client.search(query, options).to_h

    results[:next_max_id] = 0

    if results[:search_metadata] && results[:search_metadata][:next_results]
      s = results[:search_metadata][:next_results].split("&")
      if s.length > 0
        pair = s.first.split("=")
        results[:next_max_id] = pair.last.strip.to_i
      end
    end

    puts results[:search_metadata]
    puts results[:next_max_id]
    results
  end

  def save_tweet(tweet)
    id = tweet[:id_str]
    return true if File.exist?("tweets/#{id}.json")
    f = File.open("tweets/#{id}.json", "w+")
    f.puts tweet.to_json
    f.close
    true
  end

  def collect!
    results = self.search
    max_id = results[:next_max_id]

    results[:statuses].each do |tweet|
      self.save_tweet(tweet)
    end

    while max_id > 0
      results = self.search(max_id)

      results[:statuses].each do |tweet|
        self.save_tweet(tweet)
      end

      max_id = results[:next_max_id]
    end

  end

end

CindyTweetCollector.new.collect!
