class CreateCategoryJoinTable < ActiveRecord::Migration
  def change
    create_join_table :stories, :categories do |t|
      # t.index [:story_id, :category_id]
      # t.index [:category_id, :story_id]
    end
  end
end
