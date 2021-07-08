# require modules here
# had to go back to the examples and read the comment again
require "yaml"

def load_library(file)
  # code goes here
  emojis = YAML.load_file(file)
  
  hash = {
    'get_meaning' => {},
    "get_emoticon" => {}
  }
  
  emojis.each do |k, v|
    hash['get_emoticon'][v[0]] = emojis[k][1]
    hash['get_meaning'][v[1]] = k
  end
  
  hash
  
end

def get_japanese_emoticon(file, emoji)
  # code goes here
  result = load_library(file)['get_emoticon'][emoji]
  
  # im confuse at this point should I call this emoji or emoticon - need to google this ! the real question here.
  
  result ? result : "Sorry, that emoticon was not found"
  
end

def get_english_meaning(file, emoji)
  # code goes here
  result = load_library(file)['get_meaning'][emoji]
  
  result ? result : "Sorry, that emoticon was not found"
  
end

# had to reset the terminal .... editor was not saving changes.