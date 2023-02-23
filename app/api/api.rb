require 'grape'

class Api < Grape::API
  prefix 'api'
  format :json

  mount Weather
  mount Telegram

  # add_swagger_documentation
end
