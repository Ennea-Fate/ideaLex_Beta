class Book < ApplicationRecord
    has_one :frequency_vocabulary
    has_one :concordance
    has_one :grammar_dictionary
    attr_accessor :book_file
    include PgSearch::Model
end
