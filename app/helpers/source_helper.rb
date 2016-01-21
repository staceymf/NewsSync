module SourceHelper
  include HTTParty
  response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

  puts response.body, response.code, response.message, response.headers.inspect
end
