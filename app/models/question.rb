class Question < ActiveRecord::Base
  attr_accessible :content, :solution, :type
  
  belongs_to :user
  belongs_to :interview
  
  has_many :options

end
