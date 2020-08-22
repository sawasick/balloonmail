class Bookmark < ApplicationRecord
    #アソシエーション
    belongs_to :user
    belongs_to :balloon
    validates_uniqueness_of :balloon_id, scope: :user_id
end
