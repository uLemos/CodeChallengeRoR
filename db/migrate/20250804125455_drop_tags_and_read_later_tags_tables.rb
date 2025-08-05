class DropTagsAndReadLaterTagsTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :article_tags, if_exists: true
    drop_table :read_later_tags, if_exists: true
    drop_table :read_later_tags_laters, if_exists: true
    drop_table :read_laters_tags, if_exists: true

    execute "DROP SEQUENCE IF EXISTS article_tags_id_seq"
    execute "DROP SEQUENCE IF EXISTS read_later_tags_id_seq"
  end
end
