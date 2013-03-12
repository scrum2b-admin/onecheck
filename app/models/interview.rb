class Interview < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :title, :presence => true
  validates :start_date, :presence => true
  validates :due_date, :presence => true
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  has_many  :questions
  has_many :applies
  attr_accessible :title, :time_test, :start_date, :due_date, :user_id
  def create_questions(params,interview_id)
    if params[:content] != nil
      @question = Question.new(:content => params[:content],:question_type => params[:question_type],:interview_id => interview_id)
      Rails.logger.info "TTTTTTTTTTTTTTTt #{params[:answers]}"
      if @question.save
           params[:answers].each do |key,value|
            @answer = Answer.new(:content => value[:content],:question_id => @question.id ,:is_correct => value[:is_correct])
            unless @answer.save
              Interview.find(interview_id).destroy()
              Question.find(@question.id).destroy()
              redirect_to '/interview/new'
            end
          end
      else
        Interview.find(interview_id).destroy()
        redirect_to '/interview/new'
      end
    end  
  end
  def is_applied?
    return true if Apply.interview_id == Interview.id
    
  end
end
