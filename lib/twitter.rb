class TwitterClient
  def self.search(search_term, since = nil)
    sinceString = "since=" + since unless since.nil?
    path = "http://search.twitter.com/search.json?#{sinceString}rpp=100&q=%23"
    response = HTTParty.get(path+search_term)

    response['results'].each do |t|
      if Tweet.find_by_twitter_id(t['id']).nil?
        if get_user(t['text'])
          user = User.find_or_create_by_user_name(t['from_user'])
          retweeter_id = User.find_or_create_by_user_name(get_user(t['text'])).id
          tweet = user.tweets.new(
            text: t['text'],
            twitter_id: t['id'],
            tweeted_at: t['created_at'],
            retweet_of_user_id: retweeter_id)
          tweet.save
        end
      end
    end
  end

  def self.get_user(tweet)
    regex = /^RT @[a-zA-Z0-9]+:/
    tweet.scan(regex)[0].gsub('RT @', '').gsub(':', '')
  rescue
    nil
  end
end
