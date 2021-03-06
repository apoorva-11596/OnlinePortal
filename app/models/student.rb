class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   mount_uploader :avatar, AvatarUploader
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :ongoing_project, class_name: 'Project', foreign_key: 'employee_id'
  has_many :completed_projects, class_name: 'Project', foreign_key: 'finisher_id'

  validates_presence_of :encrypted_password #checking presence of email is not required as it is being done by devise
  validates_uniqueness_of :email


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |student|
      student.provider = auth.provider
      student.uid = auth.uid
      student.email = auth.info.email
      #user.username = auth.info.email.split("@").first
      student.password = Devise.friendly_token[0,20]
      #user.first_name = auth.info.name.split.first   # assuming the user model has a name
      #user.last_name = auth.info.name.split.last   # assuming the user model has a name
      student.remote_avatar_url = auth.info.image.gsub('http://','https://') #"http://graph.facebook.com/#{auth.uid}/picture?type=large" # assuming the user model has an image
      byebug
      #user.skip_confirmation!
      #user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |student|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        student.email = data["email"] if student.email.blank?
       student.remote_avatar_url = "http://graph.facebook.com/v2.6/#{@student.uid}/picture" 
      end
    end
  end

end

