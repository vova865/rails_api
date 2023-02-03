class AccuWeatherClient
  URL = 'http://dataservice.accuweather.com/currentconditions/v1/294021'.freeze
  URL_TELEGRAM = "https://api.telegram.org/bot#{Rails.application.secrets[:telegram][:bot][:token]}/sendMessage".freeze

  def initialize
    @api_key = ENV['SECRET_KEY']
  end

  def req
    response = RestClient.get URL, { params: { apikey: @api_key } }
    res = JSON.parse(response.body)
    t = res.first['Temperature']['Metric']['Value']
    DataWeather.create(kind: 'current', temperature: t)
    RestClient.get URL_TELEGRAM, { params: { chat_id: '347032598', text: t } }
  end

end
