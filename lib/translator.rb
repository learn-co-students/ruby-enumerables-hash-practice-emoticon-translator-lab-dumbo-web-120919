require 'yaml'

def load_library(emoticonYAML)
  emoticonLoad = YAML.load_file('./lib/emoticons.yml')

  emoticonExtract = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticonLoad.each do |meaning, value|
   
    english = value[0]
    japanese = value[1]
    
    emoticonExtract['get_meaning'][japanese] = meaning
   
    emoticonExtract['get_emoticon'][english] = japanese
  end
  emoticonExtract
end


def get_japanese_emoticon(emoticonYAML, emoticon)
  emoticonExtract = load_library(emoticonYAML)
  japaneseEmoticon = emoticonExtract['get_emoticon'][emoticon]
  japaneseEmoticon ? japaneseEmoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticonYAML, emoticon)
  emoticonExtract = load_library(emoticonYAML)
  englishEmoticon = emoticonExtract['get_meaning'][emoticon]
  englishEmoticon ? englishEmoticon : 'Sorry, that emoticon was not found'
end