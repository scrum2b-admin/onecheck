class Interview < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :title, :presence => true
  validates :start_date, :presence => true
  validates :due_date, :presence => true
  
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  has_many  :questions
  has_many :applies
  attr_accessible :title, :time_test, :start_date, :due_date, :user_id  
  
  #TODO: function to parse params to create and return an Interview object
  #params is Hash object with keys :content, :start_date (String object), :due_date (String object), :questions (array of Hash objects store information of Questions)
  def self.parse(params)
    #return Interview object    
  end
  
  def is_applied?
    return true if Apply.interview_id == Interview.id    
  end
  
end
