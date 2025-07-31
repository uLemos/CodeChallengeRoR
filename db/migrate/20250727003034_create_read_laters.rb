class CreateReadLaters < ActiveRecord::Migration[7.1]
  def change
    create_table :read_laters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :article_id

      t.timestamps
    end
  end
end
