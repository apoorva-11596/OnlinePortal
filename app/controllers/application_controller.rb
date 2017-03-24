class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_action :set_user, :set_student

  def set_user
    if user_signed_in?
      @user = current_user
    else
      @user = User.new
    end
  end


  def set_student
    if student_signed_in?
      @student = current_student
    else
      @student = Student.new
    end
  end

end
