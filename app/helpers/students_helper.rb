module StudentsHelper
	 def student_image_url student
	 	
    if @student.avatar.url.nil?
      "thumb_default_pic.jpg"
    else
      @student.avatar.url
    end
  end
end