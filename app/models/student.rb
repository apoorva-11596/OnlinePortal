class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :ongoing_project, class_name: 'Project', foreign_key: 'sid'
  has_many :completed_projects, class_name: 'Project', foreign_key: 'fid'

  validates_presence_of :encrypted_password #checking presence of email is not required as it is being done by devise
  validates_uniqueness_of :email
end
