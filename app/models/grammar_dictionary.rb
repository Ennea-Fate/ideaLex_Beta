class GrammarDictionary < ApplicationRecord
  belongs_to :book
  has_many :gramm_dict_words, dependent: :destroy
  has_many :gramm_dict_word_forms, through: :gramm_dict_words
  attr_accessor :file

end
