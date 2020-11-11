class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_reviews, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = current_user.reviews
    end

    def show
    end 

    def new
        @review = Review.new
    end

    def create 
        @review = current_user.reviews.build(reviews_params)
        if @review.save 
          redirect_to review_path(@review)
        else 
          render :new
        end
      end 

    def edit
    end

    def update 
        if @review.update(reviews_params)
          redirect_to review_path(@review)
        else 
          render :edit
        end
      end 

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

private

    def set_reviews
        @review = current_user.reviews.find(params[:id])
    end

    def reviews_params
        params.require(:review).permit(:game_id,:rating, :content, :created_at, :updated_at)
    end
end
