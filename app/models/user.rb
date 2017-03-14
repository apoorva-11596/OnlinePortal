class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posted_projects, class_name: 'Project', foreign_key: "poster_id"
  has_many :taken_projects, class_name: 'Project', foreign_key: "employee_id"
  has_many :completed_projects, class_name: 'Project', foreign_key: "finisher_id"

  validates_presence_of :encrypted_password #checking presence of email is not required as it is being done by devise
  validates_uniqueness_of :email
end
