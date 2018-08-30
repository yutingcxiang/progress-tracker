class Student < ActiveRecord::Base
  has_many :study_sessions
  has_secure_password
  validates_presence_of :name, :username, :password, :email
  validates :username, uniqueness: true
end
