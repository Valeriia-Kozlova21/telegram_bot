require 'telegram/bot'

TOKEN = '1964729172:AAEW6WqNEzwyUQ484yPiWE4tCKAUV1ct2hc'


PHRASES = ["How are you?", "I'm bot", "The weather is good today, isn't it?\xE2\x98\x80"]
FACTS = [
  "All the swans in England are property of the Queen.",
  "The earth rotates more slowly on its axis in March than in September.",
  "If a Lobster loses an eye, it will grow another one.",
  "There are 206 bones in the human body!",
  "Turtles can live for more than 100 years\xF0\x9F\x90\xA2"
]
ADVICE = [
  "The Ruby book is waiting for you ... ",
  "Check out what's new on Netflix\xF0\x9F\x8E\xAC",
  "Tea drinking is always a good idea \xE2\x98\x95"
]


Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.to_s
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Hello, #{message.from.first_name}. I'm a talking grasshopper."
      )
    when '/talk'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Actually ... I can't speak. I'm just a bot \xF0\x9F\xA4\x96"
      )
    when '/boring'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: ADVICE.sample
      )
    when '/fact'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: FACTS.sample
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: PHRASES.sample
      )
    end
  end
end
