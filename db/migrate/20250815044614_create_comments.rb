class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text, null: false             # 追記: コメントの本文を保存するカラム
      t.references :user, null: false, foreign_key: true      # 追記: どのユーザーがコメントしたかを紐付ける
      t.references :prototype, null: false, foreign_key: true # 追記: どのプロトタイプにコメントしたかを紐付ける
      t.timestamps
    end
  end
end