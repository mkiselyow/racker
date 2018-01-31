class UsersController < Frack::BaseController

  def index(env)
    @users = User.all
    render 'users/index'
  end
end