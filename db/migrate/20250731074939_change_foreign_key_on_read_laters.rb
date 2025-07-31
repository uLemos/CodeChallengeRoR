class ChangeForeignKeyOnReadLaters < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :read_laters, :users

    add_foreign_key :read_laters, :users, on_delete: :cascade, on_update: :cascade
  end
end
