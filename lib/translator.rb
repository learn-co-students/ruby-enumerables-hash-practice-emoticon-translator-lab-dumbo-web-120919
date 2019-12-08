require 'yaml'
require 'pry'

def load_library(file_path)
  translation = {'get_meaning' => {}, 'get_emoticon' => {}}
  file = YAML.load_file(file_path)
  file.each do |trans, mote|
    translation['get_meaning'][mote[1]] = trans
    translation['get_emoticon'][mote[0]] = mote[1]
  end
  return translation             
end

def get_japanese_emoticon(file_path, emote)
  file = load_library(file_path)
  translation = nil 
  file['get_emoticon'].each do |eng, jpn|
    if emote == eng
      translation = jpn
    end
  end
  if translation == nil 
    return "Sorry, that emoticon was not found"
  else
    return translation
  end
end
  

def get_english_meaning(file_path, j_emote)
  file = load_library(file_path)
  translation = nil
  file['get_meaning'].each do |emote, meaning|
    if emote == j_emote
      translation = meaning
    end
  end
  if translation == nil
    return "Sorry, that emoticon was not found"
  else
    return translation
  end
end