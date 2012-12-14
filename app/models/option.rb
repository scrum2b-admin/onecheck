class Option < ActiveRecord::Base
  attr_accessible :content, :is_correct
  
  belongs_to :user
  belongs_to :question
  
end
