class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :number
      t.integer :story_id

      t.timestamps
    end
    add_index :chapters, :story_id
  end
end
