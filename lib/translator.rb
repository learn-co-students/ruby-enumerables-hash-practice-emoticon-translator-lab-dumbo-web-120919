# require modules here
require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  japanese_emoticons = {}
  english_emoticons = {}
  emoticons.each do |pair|
    japanese_emoticons[pair[1][1]] = pair[0]
    english_emoticons[pair[1][0]] = pair[1][1]
  end
  return {
    :get_meaning => japanese_emoticons,
    :get_emoticon => english_emoticons
  }
end

def get_japanese_emoticon(file, english_emoticon)
  library = load_library(file)
  # return japanese emoticon based on given english emoticon
  # in library use get_emoticon hash 
  # use english_emoticon as the key
  # if it looks for english emoticon and it's not there then return sorry message
  if library[:get_emoticon][english_emoticon]
    library[:get_emoticon][english_emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
  library = load_library(file)
  # when given the japanese emoticon, we need to get the meaning
  # use the get_meaning hash
  if library[:get_meaning][japanese_emoticon]
    library[:get_meaning][japanese_emoticon]
  else 
    "Sorry, that emoticon was not found"
  end
end