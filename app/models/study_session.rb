class StudySession < ActiveRecord::Base
  belongs_to :student
  validates_presence_of :date, :hours, :summary
end
