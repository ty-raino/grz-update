class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :rating, presence: true
  validates :rating, :inclusion => { :in => 1..5, :message => " should be between 1 to 5" }
  validates :content, presence: true, length: { maximum: 130 }

  # sort by good rating and bad rating or filter <= 3 = bad rating, >= 3 = good rating

  def posted
    created_at.in_time_zone("America/Chicago").strftime("Posted: %b %e, %l:%M %p")
  end

  def last_updated
    updated_at.in_time_zone("America/Chicago").strftime("Updated at: %b %e, %l:%M %p")
  end

  def self.most_recent
    order(created_at: :desc)
  end

  def self.oldest
    order(created_at: :asc)
  end
end
