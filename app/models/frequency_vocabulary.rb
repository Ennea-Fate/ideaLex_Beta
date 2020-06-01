class FrequencyVocabulary < ApplicationRecord
  belongs_to :book
  has_many :freq_voc_words, dependent: :destroy
  #____________________________________________
  attr_accessor :file
end
