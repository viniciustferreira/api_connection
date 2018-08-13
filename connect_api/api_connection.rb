require 'uri'
require 'net/http'
require 'json'

class ApiConnection

  def initialize(url)
    @url = url
  end

  def connect
    begin
      @url_parsed = URI.parse(@url)
      @req = Net::HTTP.get(@url_parsed)
    rescue Exception
      raise "não foi possivel se conectar"
    end
  end

  def response
    @api_response = JSON.parse(@req)
  end
end
