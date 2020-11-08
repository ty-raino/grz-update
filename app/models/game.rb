class Game < ApplicationRecord
    has_many :reviews
    has_many :user, through: :reviews

    validates :title, presence: true, uniqueness: true
    validates :title, length: { maximum: 35 }
    # validates :is_title_case
end
