class SourcesController < ApplicationController
  ENDPOINTS = {
    hn_new_stories: "https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty",
    hn_story: "https://hacker-news.firebaseio.com/v0/item/",
    tc_story: ""
  }

  def show
    case Source.find(params[:id]).name
    when "HackerNews"
      response = HTTParty.get(ENDPOINTS[:hn_story] + HTTParty.get(ENDPOINTS[:hn_new_stories])[0].to_s + '.json?print=pretty')
    when "TechCrunch"
      response = HTTParty.get(ENDPOINTS[:tc_story] + '.json?print=pretty')
    end
    render json: response
  end
end
