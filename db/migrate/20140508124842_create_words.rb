class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t| 
      t.string  :text # text of the word
      t.string  :pos
      t.integer :alpha, default: 0
      t.integer :omega, default: 0

      t.timestamps
    end
  end
end
