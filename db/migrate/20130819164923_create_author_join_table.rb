class CreateAuthorJoinTable < ActiveRecord::Migration
  def change
    create_join_table :stories, :authors do |t|
      # t.index [:story_id, :author_id]
      # t.index [:author_id, :story_id]
    end
  end
end
