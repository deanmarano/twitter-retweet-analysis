class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer   :id
      t.integer   :twitter_id, :limit => 8
      t.integer   :user_id
      t.datetime :tweeted_at
      t.string :text
      t.integer   :retweet_of_user_id

      t.timestamps
    end

    create_table :users do |t|
      t.integer :id
      t.string :user_name

      t.timestamps
    end
  end
end
