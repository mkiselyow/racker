class Game
  require 'codebreaker'

  def self.new
    Codebreaker::Game.new
  end

  class Codebreaker::Game
    def to_s
      "#{self.secret_code} - secret_code; #{self.is_this_winning_game} - is_this_winning_game; #{self.hints.count} - hints.count; "
    end
  end
end