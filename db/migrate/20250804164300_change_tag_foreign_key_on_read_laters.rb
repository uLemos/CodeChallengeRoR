class ChangeTagForeignKeyOnReadLaters < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :read_laters, :tags
    add_foreign_key :read_laters, :tags, on_delete: :nullify
  end
end
