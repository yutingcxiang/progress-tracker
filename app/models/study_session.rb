class Study_session < ActiveRecord::Base
  belongs_to :student
  validates_presence_of :date, :hours, :summary
end
