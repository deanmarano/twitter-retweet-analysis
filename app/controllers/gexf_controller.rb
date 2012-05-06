class GexfController < ApplicationController
  def show
    @users = User.all
    @tweets = Tweet.all
    File.open('retweet_graph.gexf', 'w') {|f| f.write(render_to_string 'show') }
    render 'show'
  end
end
