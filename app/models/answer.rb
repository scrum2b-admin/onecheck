class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :question_id, :is_correct
  belongs_to :question, :class_name => 'Question', :foreign_key => 'question_id'

  def self.count_answers(question_id)
    return Answer.where(:question_id => question_id).count
  end
  
  #TODO: function to parse params to create and return an answer
  #params is Hash object with keys :content, :is_correct, :question (Question object)
  def self.parse(params)
    answer = Answer.new(:content => params[:content], :is_correct => params[:is_correct])
    answer.question = params[:question]
    answer.save
    return answer
  end

end
