class HomeController < ApplicationController

  def index
    #@cryptos = Crypto.all
    require 'net/http'
    require 'json'

    #@url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=e75d37d1-b7b2-4253-9f36-289eaff48122'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=e75d37d1-b7b2-4253-9f36-289eaff48122&start=1&limit=5000&convert=USD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @my_coins = ["BTC", "ETH", "XRP", "ADA", "BNB", "USDT", "SOL", "DOGE"]
    @coinlist = []
  end

  def lookup
    require 'net/http'
    require 'json'

    #@url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=e75d37d1-b7b2-4253-9f36-289eaff48122'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=e75d37d1-b7b2-4253-9f36-289eaff48122&start=1&limit=5000&convert=USD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coin = JSON.parse(@response)

    @symbol = params[:sym]

    #error handling on lookup form
    #changing the input text to uppercase to match on key value pair of JSON on API
    if @symbol
          @symbol = @symbol.upcase
    end

    #if entered an empty value
    if @symbol == ""
        @symbol = "Please Enter A Currency!"
    end
  end

  def about
  end

end
