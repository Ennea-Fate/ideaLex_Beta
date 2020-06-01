class ConcWord < ApplicationRecord
  belongs_to :concordance
  
  include PgSearch::Model
  pg_search_scope :search_everywhere, against: [:word]
  multisearchable against: [:word, :content, :pages]

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(ConcWord)
  end
end
