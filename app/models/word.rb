class Word < ActiveRecord::Base
  has_many :prefix_relationships, foreign_key: :prefix_id, class_name: 'Relationship'
  has_many :suffix_relationships, foreign_key: :suffix_id, class_name: 'Relationship'
  has_many :prefixes, through: :suffix_relationships, source: :prefix
  has_many :suffixes, through: :prefix_relationships, source: :suffix

  def next_word
    relationships = Relationship.where(prefix_id: self.id).sort_by { |rel| rel.count }.reverse
    num_rels = self.suffixes.count
    num_occurrences = relationships.reduce(0) { |n, rel| rel.count + n }.to_f

    suffixes_array = []
    num_rels.times do |index|
      rel = relationships[index]
      suffix = Word.find(rel.suffix_id)
      suffixes_array << suffix
    end

    rand_no = rand(0.0..1.0)
    suffixes_array.each do |suffix|
      rel = Relationship.where(prefix_id: self.id, suffix_id: suffix.id).first
      probability = rel.count.to_f / num_occurrences.to_f
      if (rand_no < probability)
        return suffix
      end
      rand_no = rand_no - probability
    end


    #   if (rand_no < )

    # rand_no = rand(0,1)
    # for each element in array
    #   if(rand_num < element.probablity)
    #     select and break
    #   rand_num = rand_num - element.probability
  end

  def self.alphas
    Word.where('alpha > 0').sort_by { |word| word.alpha }.reverse
  end

  def self.omegas
    Word.where('omega > 0').sort_by { |word| word.omega }.reverse
  end

  def is_alpha?
    alpha > 0
  end

  def is_omega?
    omega > 0
  end

  def show_prefixes(percent = 100)
    percent = 100 if percent > 100
    relationships = Relationship.where(suffix_id: self.id).sort_by { |rel| rel.count }.reverse
    num_rels = self.prefixes.count / (100 / percent)

    num_rels.times do |index|
      rel = relationships[index]
      prefix = Word.find(rel.prefix_id).text
      occurences = rel.count
      puts "#{occurences} : #{prefix}"
    end
  end

  def show_suffixes(percent = 100)
    percent = 100 if percent > 100
    relationships = Relationship.where(prefix_id: self.id).sort_by { |rel| rel.count }.reverse
    num_rels = self.suffixes.count / (100 / percent)

    num_rels.times do |index|
      rel = relationships[index]
      suffix = Word.find(rel.suffix_id).text
      occurences = rel.count
      puts "#{occurences} : #{suffix}"
    end

  end
end
