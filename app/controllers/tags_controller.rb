class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @tasks = @tag.tasks
  end
end
