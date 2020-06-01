class GrammDictWordForm < ApplicationRecord
  belongs_to :gramm_dict_words, optional: true
  
  include PgSearch::Model
  multisearchable against: [:word, :chars]

  after_save :reindex

  private

  def reindex
    PgSearch::Multisearch.rebuild(GrammDictWordForm)
  end
end
