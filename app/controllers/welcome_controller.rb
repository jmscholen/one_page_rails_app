class WelcomeController < ApplicationController
  def index
  	@tasks = Task.all 
  	@new_task = Task.new 
  end

end
