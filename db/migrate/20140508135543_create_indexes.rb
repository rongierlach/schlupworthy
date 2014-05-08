class CreateIndexes < ActiveRecord::Migration
  def change
    add_index :relationships, :prefix_id
    add_index :relationships, :suffix_id
  end
end
