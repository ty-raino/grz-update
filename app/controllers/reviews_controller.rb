class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_reviews, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = current_user.reviews
    end

    def show
    end 

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

private

    def set_reviews
        @review = current_user.reviews.find(params[:id])
    end

    def reviews_params
        params.require(:review).permit(:rating, :content, :start_time, :end_time)
    end
end
