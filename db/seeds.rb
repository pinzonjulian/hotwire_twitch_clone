live_streams = [
  { name: "he didn't see it coming", url: "https://www.youtube.com/embed/UolirF_2Dv4", theme: :gaming },
  { name: "GG my friend", url: "https://www.youtube.com/embed/wxU3-59dhyM", theme: :gaming },
  { name: "Daut vs The Viper", url: "https://www.youtube.com/embed/XGVXkdnLJqg", theme: :gaming },
  { name: "Winning... again...", url: "https://www.youtube.com/embed/7IHedKtcSW4", theme: :gaming },
  { name: "Cuting thorugh the black forrest", url: "https://www.youtube.com/embed/9jB34bMG2VA", theme: :gaming },
  { name: "Carbonara tradizizonale", url: "https://www.youtube.com/embed/4UTrEpVKhKM", theme: :cooking },
  { name: "96yo granny still cooking traditional italian", url: "https://www.youtube.com/embed/RnhlpQlYBwo", theme: :cooking },
  { name: "Ravioli, Ravioli", url: "https://www.youtube.com/embed/Hzs-0vLIQxs", theme: :cooking },
  { name: "Garlic, the cure for everything", url: "https://www.youtube.com/embed/bJCKetu94XY", theme: :cooking },
  { name: "Cycling through a blizzard in Amsterdam", url: "https://www.youtube.com/embed/SfsCniN7Nsc", theme: :climate },
  { name: "Dutch bikes are better", url: "https://www.youtube.com/embed/Evy2EgoveuE", theme: :climate },
  { name: "American cities, pt 1", url: "https://www.youtube.com/embed/GRB6rSDW5i4", theme: :climate },
  { name: "Safer sidewalks", url: "https://www.youtube.com/embed/oOttvpjJvAo", theme: :climate },
  { name: "Suburbs are bleeding america dry", url: "https://www.youtube.com/embed/cO6txCZpbsQ", theme: :climate },
  { name: "Fast fashion is garbage", url: "https://www.youtube.com/embed/f_hErrx9Ubk", theme: :climate },
  { name: "How the auto industry carjacked america", url: "https://www.youtube.com/embed/PO4k2Svd92s", theme: :climate },
  { name: "Let's break up with gas stoves", url: "https://www.youtube.com/embed/DXu1t6gs1S4", theme: :climate },
  { name: "Exxon lobbyists caught on camera", url: "https://www.youtube.com/embed/sI-1YNAmWlk", theme: :climate },
]
gaming_messages = [
  "gg",
  "He's crushing it",
  "wololoooooo",
  "no way he's hiding that scout in the forest",
  "OMG he's cutting through the forrest",
  "Ruuuuuuuun",
  "That microooooo",
  "Dude has las 1 villager left 😂",
  "C'mon, stop trying to hit me and hit me",
  "Comons nana",
  "how do you turn this on",
  "he's got 4 relics now?",
  "Geez, that's not a good way to die",
  "wait.. is that a... car?"
]
cooking_messages = [
  "She's the best!",
  "La mia nona!",
  "Ooo sooooole miiiiioooo",
  "that grannie can roll",
  "It's not ravioliS it's ravioli",
  "Ravioli is the plural of raviolo",
  "Jamie Oliver should take lessons from this woman",
  "Uncle Roger better not mess with these ladies #warned",
  "Is carbonara a city in Italy? Asking for a friend",
  "#sayNoToCannedTomatoes",
  "a bit of garlic she says... and puts in 10 cloves",
  "Rigatoni? Are you sure, lady?",
  "OMG, double yolk?",
  "Anyone loving these women?!"
]
climate_messages = [
  "This guy's so cool",
  "America's car dependence is so so so bad",
  "16 lanes will fix traffix... NOT",
  "I want more traaaaaains",
  "Ch ch chaaaain... chain of fools!",
  "Speed limit 40? What the...",
  "OMG I hate those loud bikes, like.. WTF?",
  "anyone else ride their bicycle in the snow?",
  "I'd rather live in a green city and rent a car for sure.",
]

messages = {
  gaming: gaming_messages,
  cooking: cooking_messages,
  climate: climate_messages
}

live_streams.each do |data|
  live_stream = LiveStream.create!(name: data[:name], url: data[:url])
  [3, 4, 5].sample.times do
    body = messages[data[:theme]].sample
    live_stream.messages.create!(body: body)
  end
  (1..9).to_a.each do
    name = case data[:theme].to_s
           when "climate"
             Faker::Book.title
           when "cooking"
             Faker::Restaurant.name
           when "gaming"
             "#{Faker::Computer.platform} #{Faker::Hipster.word} #{Faker::Hacker.verb}"
           else
             raise data[:theme]
           end
    live_stream.products.create! name: name, category: data[:theme].to_s
  end
end