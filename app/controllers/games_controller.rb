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
    begin
      @answer = params(env)['answer']
      @game = env['rack.session'][:game]
      @game.try_to_guess(@answer) if @game && @answer
    rescue ArgumentError => e
      @error = e
      p e
      # render '/users/index' if (@error.to_s == "YOU win THE GAME, THE GAME IS ENDED")
      return(render '/users/index' if (@error.to_s == "YOU win THE GAME, THE GAME IS ENDED"))
      # render 'games/started'
      # p e
      # env['rack.session'][:error] = e
      # render 'games' if e == "YOU win THE GAME, THE GAME IS ENDED"
    end
    # render 'games/index' if @error
    render 'games/started'

    # my_request = request(env)
    # my_response = response(env)
    # my_response.redirect('/users/index') if e == "YOU win THE GAME, THE GAME IS ENDED"
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
  end

  # def clear_params(env)
  #   my_request.delete_param('answer')
  # end
end