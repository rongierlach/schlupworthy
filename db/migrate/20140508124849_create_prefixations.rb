class CreatePrefixations < ActiveRecord::Migration
  def change
    create_table :prefixations do |t|
      t.integer :word_id
      t.integer :prefix_id
      t.integer :count, default: 1
    end
  end
end
