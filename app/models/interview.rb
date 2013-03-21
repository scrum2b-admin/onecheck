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
    if params[:content] != ""
      @question = Question.new(:content => params[:content],:question_type => params[:question_type],:interview_id => interview_id)
      if @question.save
           params[:answers].each do |key,value|
             if  value[:content] != nil
                @answer = Answer.new(:content => value[:content],:question_id => @question.id ,:is_correct => value[:is_correct])
                unless @answer.save
                  Interview.find(interview_id).destroy()
                  Question.find(@question.id).destroy()
                  redirect_to '/interview/new'
                end
             end 
          end
      else
        Interview.find(interview_id).destroy()
        redirect_to '/interview/new'
      end
    end  
  end
  def create_questions_on_edit(params,interview_id)
    if params[:content] != ""
      @question = Question.new(:content => params[:content],:question_type => params[:question_type],:interview_id => interview_id)
      if @question.save
           params[:answers].each do |key,value|
             if  value[:content] != ""
                @answer = Answer.new(:content => value[:content],:question_id => @question.id ,:is_correct => value[:is_correct])
                unless @answer.save
                  Question.find(@question.id).destroy()
                  redirect_to :controller => "interview", :action => "edit", :id => interview_id
                end
             end 
          end
      else
         redirect_to :controller => "interview", :action => "edit", :id => interview_id
      end
    end  
  end
  def update_questions_on_edit(params)
      @question = Question.find(params[:id])
      if params[:content] != ""
        @question.update_attributes(:content => params[:content],:question_type => params[:question_type])
      end
      params[:answers].each do |key,value|
         if  value[:id] == "" && value[:content] != ""
           Rails.logger.info "TTTTTTTTTTT #{value[:content]}"    
           @answer = Answer.new(:content => value[:content],:question_id => @question.id ,:is_correct => value[:is_correct])
           @answer.save
         else
           @answer = Answer.find(value[:id])
           @answer.update_attributes(:content => value[:content],:is_correct => value[:is_correct])
         end
      end  
  end
  def is_applied?
    return true if Apply.interview_id == Interview.id
    
  end
end
