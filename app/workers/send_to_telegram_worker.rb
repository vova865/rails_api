class SendToTelegramWorker < BaseWorker
  URL_TELEGRAM = "https://api.telegram.org/bot#{Rails.application.secrets[:telegram][:bot][:token]}/sendMessage".freeze

  def perform(chat_id, t)
    RestClient.get URL_TELEGRAM, { params: { chat_id: chat_id, text: t } }
  end
end
