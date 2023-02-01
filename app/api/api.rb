class Api < Grape::API
  prefix 'weather'
  format :json

  mount Weather

  # add_swagger_documentation
end
