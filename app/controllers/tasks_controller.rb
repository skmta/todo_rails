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
    		redirect_to("tasks/index")   
    	else
    		render("tasks/new")
    	end
    end

    #投稿一覧を表示
    def show
    	@task = Task.all
    	# @task = Task.find(params[:id])
    end

    #投稿を削除
    def destroy
        @task = Task.find(params[:id])
        if @task.delete
            redirect_to tasks_path
        else
            flush[:notice] = "Error"
        end
    end

    def done
    end

    # タスクの情報
    private
    def create_task_params
        #DB追加を許可するカラムを設定
        params.permit(:title, :description, :due_date)
    end

    #編集
    def update_task_params
        params.permit(:title, :description, :due_date)
    end

end
