class Game < ApplicationRecord
    has_many :reviews
    has_many :user, through: :reviews

    validates :title, presence: true, uniqueness: true
    validates :title, length: { maximum: 35 }
    validate :is_title_case

    def is_title_case
      if title.split.any?{|w|w[0].upcase != w[0]}
        errors.add(:title, "must be in title case")
      end
    end
end
