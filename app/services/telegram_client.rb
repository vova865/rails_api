class TelegramClient
  def initialize
    @bot = Telegram::Bot::Client.new(Rails.application.secrets[:telegram][:bot][:token])
  end

  def me
    @bot.request(:getMe)
  end
end
