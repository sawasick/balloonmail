class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id #誰のブックマークか
      t.integer :balloon_id #どれをブックマークしているか
      t.timestamps
    end
  end
end
