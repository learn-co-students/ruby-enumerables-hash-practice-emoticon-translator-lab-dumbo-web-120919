require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  emoticon_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  
  emoticons.each do |key, value|
    emoticon_hash['get_meaning'][value[1]] = key
    emoticon_hash['get_emoticon'][value[0]] = value[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  
  emoticon_hash['get_emoticon'].each do |key, value|
    if key == emoticon 
      return value
    end
  end
  return "Sorry, that emoticon was not found"    
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  
  emoticon_hash['get_meaning'].each do |key, value|
    if key == emoticon
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end


