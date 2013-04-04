class Question < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :solution, :question_type,:interview_id,:user_id

  belongs_to :user
  belongs_to :interview, :class_name => 'Interview', :foreign_key => 'interview_id'

  has_many :options
  has_many :answers
  #after_save :new_answer

  def self.count_questions(interview_id)
    return Question.where(:interview_id => interview_id).count
  end
    
  def self.parse(params)
    #return Question object
    params[:questions].each do |key,param|
      @question = Question.new(:content => param[:content],:question_type => param[:question_type])
      @question.interview_id = params[:id]
      @question.save
      @answer_ar = param[:answers]
      @answer_ar.merge!(:question_id => @question.id)
      Answer.parse(@answer_ar)
      Rails.logger.info "params answer1111#{param[:answers]}"
      return @question
    end
  end
  
  # def new_answer(params)
    # params = @answer_ar
      # Rails.logger.info "params answer1111#{param[:answers]}"
    # answer_ar.each do |key,answer|
    # answer = Answer.new(:content => answer[:content])
    # end
  # end

  
end
