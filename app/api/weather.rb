class Weather < Grape::API
  # version 'v1', using: :path
  format :json

  get :current do
    AccuWeatherClient.new.req

    present 'ok'
  end

  get 'historical' do

  end

  get 'historical/max' do

  end

  get 'historical/min' do

  end

  get 'historical/avg' do

  end

  get 'by_time' do

  end

  get :health do
    'OK'
  end

end
