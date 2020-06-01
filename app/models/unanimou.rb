class Unanimou < ApplicationRecord
  belongs_to :author
  belongs_to :user
  has_many :edits, dependent: :destroy



  include PgSearch::Model
  pg_search_scope :search_everywhere, against: [:word, :desc, :pos, :chars]
  multisearchable against: [:word, :desc, :pos, :chars]

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(Unanimou)
  end
  
end
