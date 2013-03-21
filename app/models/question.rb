class Question < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :solution, :question_type,:interview_id,:user_id

  belongs_to :user
  belongs_to :interview, :class_name => 'Interview', :foreign_key => 'interview_id'

  has_many :options
  has_many :answers

  def self.count_questions(interview_id)
    return Question.where(:interview_id => interview_id).count
  end
    
  #TODO: function to parse params to create and return an Question object
  #params is Hash object with keys :content, :solution (String object), :question_type (String object), :interview (Interview object), :answers (array of Hash objects store information of Answer)
  def self.parse(params)
    #return Question object
  end

end
