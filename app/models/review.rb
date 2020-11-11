class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :rating, presence: true
  validates :rating, :inclusion => { :in => 1..5, :message => " should be between 1 to 5" }
  validates :content, presence: true, length: { maximum: 130 }

  # sort by good rating and bad rating or filter 

  def posted
    created_at.strftime("Posted: %d.%m.%y")
  end

  def last_updated
    updated_at.strftime("Updated at: %d.%m.%y")
  end
end
