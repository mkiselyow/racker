class HistoryController < Frack::BaseController

  def index(env)
    @history_played_games = History.new.played_games
    render 'history/index'
  end
end