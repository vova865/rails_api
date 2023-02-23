class Weather < Grape::API
  version 'v1', using: :path
  format :json

  namespace 'weather' do
    desc 'Current temperature'
    get 'current' do
      response = AccuWeatherClient.new.call(param)

      present :temperature, response.first['Temperature']['Metric']['Value']
    end

    desc 'Hourly temperature for the last 24 hours'
    get 'historical' do

    end

    desc 'Maximum temperature over the last 24 hours'
    get 'historical/max' do
      param = '/historical/24'
      response = AccuWeatherClient.new.call(param)
      max = response.map { |t| t['Temperature']['Metric']['Value'] }.max

      present :max_temperature, max
    end

    desc 'Minimum temperature over the last 24 hours'
    get 'historical/min' do
      param = '/historical/24'
      response = AccuWeatherClient.new.call(param)
      min = response.map { |t| t['Temperature']['Metric']['Value'] }.min

      present :min_temperature, min
    end

    desc 'Average temperature over the last 24 hours.'
    get 'historical/avg' do
      param = '/historical/24'
      response = AccuWeatherClient.new.call(param)
      arr = response.map { |t| t['Temperature']['Metric']['Value'] }
      average = (arr.sum.to_f / arr.size).round(1)

      present :avg_temperature, average
    end

    desc 'Temperature closest to the given time.'
    get 'by_time' do

    end

    desc 'Status'
    get :health do
      'OK'
    end
  end
end
