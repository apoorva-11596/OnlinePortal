class UsersController < ApplicationController

  before_filter :authenticate_user!,  only: [:dashboard]

  def dashboard
    
  end
end