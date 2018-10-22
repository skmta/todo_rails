class TasksController < ApplicationController

	  # トップページで投稿一覧を表示
  	def index
  		@tasks = Task.all.order(:due_date)
  	end

    #オブジェクトの生成、dbに反映されない
    def new
    end

    #オブジェクトを生成、保存してインサートする
    def create
    	@task = Task.new(create_task_params)
    	if @task.save
    		redirect_to tasks_path
    	else
    		render @task.error
    	end
    end

    #投稿一覧を表示
    def show
    	@task = Task.all
    	# @task = Task.find(params[:id])
    end

    #投稿を削除
    def destroy

    end

    # 
    private
    def create_task_params
        params.permit(:title, :description, :due_date)
    end

end
