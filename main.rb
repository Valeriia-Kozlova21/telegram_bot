require 'telegram/bot'

TOKEN = '1964729172:AAEW6WqNEzwyUQ484yPiWE4tCKAUV1ct2hc'

PHRASES = ["Hello", "How are you?", "I'm bot"]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Hello, #{message.from.first_name}. I'm a talking grasshopper."
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: PHRASES.sample
      )
    end
  end
end
