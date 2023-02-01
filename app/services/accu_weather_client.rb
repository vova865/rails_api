class AccuWeatherClient
  URL = 'http://dataservice.accuweather.com/currentconditions/v1/294021'.freeze

  def initialize
    @api_key = ENV['SECRET_KEY']
  end

  def req
    response = RestClient.get URL, { params: { apikey: @api_key } }
    res = JSON.parse(response.body)
    DataWeather.create(kind: "current", temperature: res.first['Temperature']['Metric']['Value'])
  end

end
