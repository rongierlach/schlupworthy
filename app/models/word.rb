class Word < ActiveRecord::Base
  has_many :prefix_relationships, foreign_key: :prefix_id, class_name: 'Relationship'
  has_many :suffix_relationships, foreign_key: :suffix_id, class_name: 'Relationship'
  has_many :prefixes, through: :suffix_relationships, source: :prefix
  has_many :suffixes, through: :prefix_relationships, source: :suffix

  def self.alphas 
    Word.where('alpha > 0').sort_by { |word| word.alpha }.reverse
  end

  def self.omegas
    Word.where('omega > 0').sort_by { |word| word.omega }.reverse
  end

end
