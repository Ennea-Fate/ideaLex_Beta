class Author < ApplicationRecord
    has_many :unanimous
    include PgSearch::Model
end
