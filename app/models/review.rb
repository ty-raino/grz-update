class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :rating, presence: true
  validates :rating, :inclusion => { :in => 1..5, :error => " should be between 1 to 5" }
  validates :content, presence: true, length: { maximum: 130 }

  # sort by good rating and bad rating or filter 

  def posted
    created_at.strftime("Posted: %m/%e/%y %l:%M %p")
  end

  def last_updated
  end
end
