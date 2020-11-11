class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_game, only: [:show]

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

private

    def set_game
        @game = Game.find(params[:id])
    end

    def games_params
        params.require(:game).permit(:title)
    end
end


# if @game.errors[:name].any?
# display here