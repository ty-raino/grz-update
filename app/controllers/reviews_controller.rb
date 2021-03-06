class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :review_owner, only: [:edit, :update, :destroy]

  def index
    @game = Game.find_by_id(params[:game_id])
    if @game
      @reviews = @game.reviews
    else
      @reviews = Review.all
    end
    sort_options 
  end  

  def show
  end 

  def new
    @game = Game.find_by_id(params[:game_id])
    if @game
      @review = @game.reviews.build
    else
    @review = Review.new
    end
  end

  def create 
    @review = current_user.reviews.build(review_params)
    if @review.save 
      redirect_to review_path(@review)
    else 
      render :new
    end
  end   

  def edit
  end

  def update 
    if @review.update(review_params)
      flash[:success] = "Review updated"
      redirect_to review_path(@review)
    else 
      render :edit
    end
  end   

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to reviews_path
  end

private

  def set_review
    @review = Review.find(params[:id])
  end

  def sort_options
    if params[:sort] == "most_recent"
      @reviews = @reviews.most_recent
    elsif params[:sort] == "oldest"
      @reviews = @reviews.oldest
    end
  end

  def review_params
    params.require(:review).permit(:game_id, :user_id, :rating, :content, :created_at, :updated_at)
  end
  
  def review_owner
  unless @review.user_id == current_user.id
    flash[:error] = 'Access denied'
    redirect_to reviews_path
   end
  end  
end
