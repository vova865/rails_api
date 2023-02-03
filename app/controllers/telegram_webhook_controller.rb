class TelegramWebhookController < Telegram::Bot::UpdatesController
  def start(*)
    # reply_with text: "Echo: #{message['text']}"
    respond_with :message, text: 'Hello!'
    log { "Started at: #{payload['date']}" }
  end

  def help!(*)
    'help'
  end
end
