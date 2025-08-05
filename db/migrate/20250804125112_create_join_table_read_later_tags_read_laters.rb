class CreateJoinTableReadLaterTagsReadLaters < ActiveRecord::Migration[7.1]
  def change
    create_join_table :read_laters, :tags do |t|
      t.index [:read_later_id, :tag_id]
      t.index [:tag_id, :read_later_id]
    end
  end
end
