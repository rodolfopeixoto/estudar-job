require 'faraday'
require 'json'

class ConnectionApi < BaseApplicationLib

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def call
    connect
  end
  
  private
  
  def connect
    Faraday.new(url) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
    end
  end
end
