class MainController < ApplicationController
  def index
 
    @tasks = Task.all
    @users = User.all
    render('index')
  end

  def about
    @created_by = "Abril"
    @id = params['id']
    @page = params[:page]
    render('about')
  end

end
