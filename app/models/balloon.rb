class Balloon < ApplicationRecord
    #バリデーション
    validates :title, length: {maximum:20, message: "タイトルは20字までです。"}#最大文字数
    validates :content, presence: {message: "は入力必須です。"},length: {maximum:750, message: "は750文字までです。"}

    #アソシエーション
    belongs_to :user
    has_many :bookmarks
    has_many :bookmarked_users, through: :bookmarks, source: :user
end
