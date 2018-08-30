class Student < ActiveRecord::Base
  has_many :study_sessions
  has_secure_password
  validates_presence_of :name, :username, :password, :email

  def slug
    self.username.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |user|
    user.slug == slug
  end
end
end
