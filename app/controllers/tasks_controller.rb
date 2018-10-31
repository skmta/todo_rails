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
    	#保存できたらトップページへ
        if @task.save
            flash[:notice] = "success"
    		redirect_to("/tasks")   
    	# ＃失敗したら新規作成ページへ
        else
            flash[:notice] = "Error"
    		render("tasks/new")
    	end
    end

    #投稿一覧を表示
    def show
    	@task = Task.find_by(id: params[:id])
    end

    def update
        #保存できたらトップページへ
        if @task.save
           redirect_to("/tasks")
        #失敗したら編集ページへ
        else
            render("tasks/edit")
        end
    end

    def edit
        @task = Task.find_by(id: params[:id])
    end

    def destroy
        @task = Task.find(params[:id])
        if @task.delete
            redirect_to tasks_path
        else
            flash[:notice] = "Error"
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
        params.require(:task).permit(:title, :description, :due_date)
    end

end
