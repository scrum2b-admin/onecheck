class Anwser < ActiveRecord::Base
  attr_accessible :content, :result_type, :result_comment
  
  belongs_to :application
  belongs_to :question
  belongs_to :user
  
  has_many :selected_options
  
end
