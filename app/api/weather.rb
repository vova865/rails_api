class Weather < Grape::API
  # version 'v1', using: :path
  format :json

  get :current do
    AccuWeatherClient.new.req
  end

  get :historical do
  end

  get :health do
    'OK'
  end

end
