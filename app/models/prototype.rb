class Prototype < ApplicationRecord
  has_one_attached :image             # 既存の記述
  belongs_to :user
  has_many :comments, dependent: :destroy # 追記: Prototypeは複数のCommentを持ち、Prototypeが削除されたら関連するCommentも削除します

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end