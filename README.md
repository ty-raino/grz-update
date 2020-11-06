# README


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



## What is the Many to many relationship and how is it used?

 Users -< Reviews >- Games

## What is the User Submittable attribute on the join model?

 - Rating
 - Content

## What Validations do we need?

  Users 
 - Username
 - Email
 - Password
 
 Reviews 
 - Rating
 - Content
 
 Comments
 
 - Content

 Games 
 - Title


## How do users fit into the application? How are they related to the other models?
**Users can:**
 - Review games
 - Add games
 - Comment on other user's reviews
 - Upvote or Downvote other user's reviews (maybe)
 
 **Relationships:**
 - User has many Reviews
 - User has many Comments
 - User has many Votes
 - User has many Games through Reviews

## What are our Nested Routes? (We need a nested new route and either a nested index or nested show route)

> **games/game_id/reviews**  => to view all of the reviews made for that specific game
(to be populated...)

## Do we have Non Nested Versions of those nested routes?
(to be populated)

## What Scope Method(s) do we have and how are they used?
(to be populated...)
## What does the schema for our app look like?

```rb
# table migration for: users 
# t.string :username
# t.string :email
# t.string :password_digest

class Users 
	# relationships
	has_many :reviews
	has_many :comments
	has_many :votes
	has_many :games, through: :reviews
	# validations 
	validations :username, presence: true, uniqueness: true
	validations :email, presence: true, uniqueness: true, 
	# scope_methods (if any)
	(to be populated...)
end
```
```rb
# table migration for: reviews 
# t.integer :user_id
# t.integer :game_id
# t.string :rating
# t.string :content

class Reviews 
	# relationships
	belongs_to :user
	belongs_to :game
	# validations 
	validates :rating, :presence: true
	validates :rating, :inclusion => { :in => 1..5, :message => " should be between 1 to 5" }
	validates :rating, :numericality => { :message => " should be a number" }
	validates :content, :presence: true, length: { maximum: 130 }
	# user submittable attributes (if this is a join model)
	Rating and Content
	# scope_methods (if any)
	(to be populated...)
end
```
```rb
# table migration for: comments 
# t.integer :user_id
# t.integer :review_id
# t.string :content
class Comments 
	# relationships
	belongs_to :users
	belongs_to :reviews
	# validations 
	validates :content, presence: true, length: { maximum: 50 }
end
```
```rb
# table migration for: games 
# t.string :title
class Games 
	# relationships
	has_many :games
	has_many :users, through: :reviews
	# validations 
	validates :title, presence: true, uniqueness: true
	validates :title, length: { maximum: 35 }
	validates :is_title_case (custom validation coming soon)
	# scope_methods (if any)
	(to be populated...)
end
```
<!-- root to: "home#index" -->