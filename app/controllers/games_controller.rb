class GamesController < Frack::BaseController

  def index
    @game = Game.new
    render 'games/index'
  end

  def start_new_game
    @game = Game.new
    @game.start
    render 'games/started'
  end

  def attempt_to_guess
    # p self.class.methods
    p request
    render 'games/attempt_to_guess'
  end
end