class UsersController < ApplicationController
  def index
    @user_lists = User.all
  end
end
