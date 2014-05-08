class Word < ActiveRecord::Base
  has_many :prefix_relationships, foreign_key: :prefix_id, class_name: 'Relationship'
  has_many :suffix_relationships, foreign_key: :suffix_id, class_name: 'Relationship'
  has_many :prefixes, through: :suffix_relationships, source: :prefix
  has_many :suffixes, through: :prefix_relationships, source: :suffix
end
