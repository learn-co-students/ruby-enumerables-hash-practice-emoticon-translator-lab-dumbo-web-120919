# require modules here

def load_library(file)
  require "yaml"
  emoticons = YAML.load_file(file)

  new_hash = Hash.new {|k, v| k[v] = {}}

  emoticons.each do |meaning, emoticon|
    emoticon.each do |arr_element|
      new_hash["get_meaning"][arr_element] = meaning
      new_hash["get_emoticon"][emoticon[0]] = emoticon[1]
    end
  end

  new_hash
end

def get_japanese_emoticon(file, emo)
  new_hash = load_library(file)
  
  if new_hash["get_emoticon"][emo]
    return new_hash["get_emoticon"][emo]
  else
    return "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(file, emo)
  new_hash = load_library(file)
  
  if new_hash["get_meaning"][emo]
    return new_hash["get_meaning"][emo]
  else
    return "Sorry, that emoticon was not found"
  end
  
end