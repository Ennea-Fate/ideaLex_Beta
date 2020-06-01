class GrammDictWord < ApplicationRecord
  belongs_to :grammar_dictionary, optional: true
  has_many :gramm_dict_word_forms, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_everywhere, against: [:word, :chars]
  multisearchable against: [:word, :chars]

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(GrammDictWord)
  end

end
