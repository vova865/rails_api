class AccuWeatherClient
  URL = 'http://dataservice.accuweather.com/currentconditions/v1/294021'.freeze

  def initialize
    @api_key = ENV['SECRET_KEY']
  end

  def req
    response = RestClient.get URL, { params: { apikey: @api_key } }
    res = JSON.parse(response.body)
    chat_id = '347032598'
    t = res.first['Temperature']['Metric']['Value']
    DataWeather.create(kind: 'current', temperature: t)
    SendToTelegramWorker.perform_async(chat_id, t)
    t
  end

end
