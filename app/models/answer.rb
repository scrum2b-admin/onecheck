class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :question_id, :is_correct
  belongs_to :question, :class_name => 'Question', :foreign_key => 'question_id'
  def self.count_answers(question_id)
    return Answer.where(:question_id => question_id).count
  end
end
