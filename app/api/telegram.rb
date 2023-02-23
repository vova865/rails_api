class Telegram < Grape::API
  # prefix 'telegram'
  version 'v1', using: :path
  format :json

  get 'to_telegram' do
    TelegramClient.new.me
  end
end
