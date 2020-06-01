class FreqVocWord < ApplicationRecord
  belongs_to :frequency_vocabulary

  include PgSearch::Model
  pg_search_scope :search_everywhere, against: [:word, :occurrence_rate]
  multisearchable against: [:word,  :occurrence_rate]

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(FreqVocWord)
  end
  
end
