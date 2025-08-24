class Comment < ApplicationRecord
  belongs_to :user      # 追記: Commentは1つのUserに属します
  belongs_to :prototype # 追記: Commentは1つのPrototypeに属します

  validates :text, presence: true # 追記: コメントのテキストが空ではないことを確認するバリデーション
end