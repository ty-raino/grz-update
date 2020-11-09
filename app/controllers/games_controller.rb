class GamesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_games, only: [:show, :edit, :update, :destroy]

    def index
        @games = Game.all
    end

    def show
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(games_params)
        if @game.save
            redirect_to game_path(@game)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @game.update(games_params)
            redirect_to game_path(@game)
        else
            render :edit
        end
    end

    def destroy
        @game.destroy
        redirect_to games_path(@game)
    end

private

    def set_games
        @game = Game.find(params[:id])
    end

    def games_params
        params.require(:game).permit(:title)
    end
end


# if @game.errors[:name].any?
# display here