class CreateBalloons < ActiveRecord::Migration[6.0]
  def change
    create_table :balloons do |t|
      t.integer :user_id, null: false #どのユーザーが発信したものか,userモデルのuser_idに結びつける
      t.text :title, null: true #タイトル
      t.text :content, null: false #内容
      t.datetime :date, null: false #書いた日時(YYYY/MM/DD)
      t.integer :paperType, null: false #用紙の種類
      t.timestamps
    end
  end
end
