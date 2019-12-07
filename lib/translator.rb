require "yaml" # require modules here

def load_library(file)
  # code goes here
  
  emojifile = YAML.load_file(file)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emojifile.each do |meaning, emoji| 
      hash["get_meaning"][emoji[1]] = meaning
      hash["get_emoticon"][emoji[0]] = emoji[1]
    end
  return hash
end

def get_japanese_emoticon(file, e_emoticon)
  emojifile = load_library(file)
    if emojifile["get_emoticon"].include? (e_emoticon)
      return emojifile["get_emoticon"][e_emoticon]
    else 
      return "Sorry, that emoticon was not found"
    end 
  # code goes here
end

def get_english_meaning(file, j_emoticon)
  emojifile = load_library(file)
  if emojifile["get_meaning"].include?(j_emoticon)
    return emojifile["get_meaning"][j_emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end 
  # code goes here
end