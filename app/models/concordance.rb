class Concordance < ApplicationRecord
  belongs_to :book
  has_many :conc_words, dependent: :destroy
  attr_accessor :file
end
