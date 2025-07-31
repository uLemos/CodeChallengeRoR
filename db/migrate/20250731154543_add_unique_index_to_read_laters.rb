class AddUniqueIndexToReadLaters < ActiveRecord::Migration[7.1]
  def change
    add_index :read_laters, [ :article_id, :user_id ], unique: true
  end
end
