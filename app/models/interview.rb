class Interview < ActiveRecord::Base
  attr_accessible :due_date, :start_date, :time_test, :title, :user_id
  
  belongs_to :user
  has_many :questions
  
  has_many :applications

end
