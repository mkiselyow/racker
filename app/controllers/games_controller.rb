class GamesController < Frack::BaseController

  def index(env)
    @game = Game.new
    render 'games/index'
  end

  def start_new_game(env)
    @game = Game.new
    @game.start
    env['rack.session'][:game] = @game
    render 'games/started'
  end

  def attempt_to_guess(env)
    @answer = params(env)['answer']
    @game = env['rack.session'][:game]
    @game.try_to_guess(@answer) if @game && @answer
    # my_request = request(env)
    # my_response = response(env)
    # p @answer
    # @game = env['rack.session'][:msg]
    # @game = Game.new
    # p @game
    # p env['rack.session'][:msg]
    # p '================'
    # p my_request.session[:msg]
    # my_response.set_cookie("key", :value => "value", :domain => my_request.host == "localhost" ? "" : my_request.host)
    # my_response.set_cookie('answer', '1111')
    # my_response.finish
    # my_request.delete_param('answer')
    # p params(env)['answer']
    render 'games/started'
  end

  def clear_params(env)
    params(env)['answer'] = nil
  end
end