class ProjectMailer < ApplicationMailer


	def post_email(user, project)
		@user=user
		@project=project
		byebug
    	mail(:to => "<#{@user.email}>", :subject => "New Project")
   end
end
