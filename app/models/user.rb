class User < ApplicationRecord
  # バリデーション
  validates :username, presence: true, uniqueness: true, length: {maximum: 50}

  # アソシエーション
  has_many :balloons
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_balloons, through: :bookmarks, source: :balloon


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  #すでにバルーンをブックマークしているかどうか
  def already_bookmarked?(balloon)
    self.bookmarks.exists?(balloon_id: balloon.id)
  end
end
