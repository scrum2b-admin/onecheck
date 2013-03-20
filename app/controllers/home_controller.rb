class HomeController < ApplicationController
  def index
    @inprogress_interview = Interview.where("start_date <= ?",Time.zone.now.to_date)
    @next_interview = Interview.where("start_date > ?" ,Time.zone.now.to_date)
  end
 
end
