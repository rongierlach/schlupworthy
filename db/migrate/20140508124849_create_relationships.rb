class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :prefix_id
      t.integer :suffix_id
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
