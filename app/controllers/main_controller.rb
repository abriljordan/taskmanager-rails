class MainController < ApplicationController
  def index
    render('index')
  end

  def about
    @created_by = "Abril"
    @id = params['id']
    @page = params[:page]
    render('about')
  end

end
