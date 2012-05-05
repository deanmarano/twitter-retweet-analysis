require './lib/twitter'

task 'twitter:seed' => :environment do
  TwitterClient.search('javascript+rt')
end
