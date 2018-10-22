class PostsController < ApplicationController
  
  # 投稿一覧を表示
  def index
  	@tasks = Task.all.order(:due_date)
  end

  def new
  end

end
