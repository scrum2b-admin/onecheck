class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :question_id, :is_correct
  belongs_to :question, :class_name => 'Question', :foreign_key => 'question_id'
end
