class SourcesController < ApplicationController
  ENDPOINTS = {
    hn_new_stories: "https://hacker-news.firebaseio.com/v0/newstories.json?print=pretty",
    hn_story: "https://hacker-news.firebaseio.com/v0/item/",
    tc_story: "http://feeds.feedburner.com/TechCrunch/",
    cnn_story: "http://rss.cnn.com/rss/cnn_tech.rss"
  }

  def show
    case Source.find(params[:id]).name
    when "HackerNews"
      response = HTTParty.get(ENDPOINTS[:hn_story] + HTTParty.get(ENDPOINTS[:hn_new_stories])[0].to_s + '.json?print=pretty')
    when "TechCrunch"
      json = HTTParty.get(ENDPOINTS[:tc_story])
      url = json["rss"]["channel"]["item"][0]["link"]
      title = json["rss"]["channel"]["item"][0]["title"]

      response = {title: title, url: url}
    when "CNNTech"
      json = HTTParty.get(ENDPOINTS[:cnn_story])
      url = json["rss"]["channel"]["item"][0]["link"]
      title = json["rss"]["channel"]["item"][0]["title"]

      response = {title: title, url: url}
    end

    render json: response
  end
end
