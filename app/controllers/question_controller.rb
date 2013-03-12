class QuestionController < ApplicationController
  def create
    @question = Question.new(params{[:question]})
  end
end
