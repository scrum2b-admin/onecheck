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
             if  value[:content] != nil
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
end
