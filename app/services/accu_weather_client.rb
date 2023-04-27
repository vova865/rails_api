class AccuWeatherClient
  URL = 'http://dataservice.accuweather.com/currentconditions/v1/294021'

  def initialize
    @api_key = ENV['SECRET_KEY']
  end

  def call(param)
    req(param)
  end

  private

  def req(param)
    new_url = param ? URL + param : URL
    response = RestClient.get new_url, { params: { apikey: @api_key } }
    JSON.parse(response.body)
    # chat_id = '347032598'
    # t = res.first['Temperature']['Metric']['Value']
    # DataWeather.create(kind: 'current', temperature: t)
    # SendToTelegramWorker.perform_async(chat_id, t)
    # t
  end

end
