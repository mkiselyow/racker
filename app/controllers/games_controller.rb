class GamesController < Frack::BaseController

  def index(env)
    @game = Game.new
    render 'games/index'
  end

  def start_new_game(env)
    @game = Game.new
    @game.start
    render 'games/started'
  end

  def attempt_to_guess(env)
    p params(env)
    render 'games/attempt_to_guess'
  end
end