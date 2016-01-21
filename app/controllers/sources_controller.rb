class SourcesController < ApplicationController
  ENDPOINTS = {
    hn_new_stories: "https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty",
    hn_story: "https://hacker-news.firebaseio.com/v0/item/"
  }

  def index
    stories = HTTParty.get(ENDPOINTS[:hn_new_stories])
    response = HTTParty.get(ENDPOINTS[:hn_story] + stories[0].to_s + '.json?print=pretty')
    render json: response
  end
end
