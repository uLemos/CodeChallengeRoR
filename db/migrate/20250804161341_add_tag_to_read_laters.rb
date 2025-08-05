class AddTagToReadLaters < ActiveRecord::Migration[7.1]
  def change
    add_reference :read_laters, :tag, foreign_key: true
  end
end
