class StudentsController < ApplicationController

  before_filter :authenticate_student!,  only: [:dashboard]

  def dashboard
  	  
  end
end