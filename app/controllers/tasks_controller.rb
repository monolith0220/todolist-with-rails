class TasksController < ApplicationController

	# リソースの一覧を表示する
	def index
		@tasks = Task.all
	end

	# リソースを新規作成する
	def new
		@task = Task.new
	end

	# リソースを新規作成して追加(保存)する
	def create
		@task = Task.create(task_params)
		@task.save
		redirect_to tasks_path
	end

	# リソースを更新するためのフォームを作成する
	def edit
		@task = Task.find(params[:id])
	end

	# リソースを更新する
	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
		redirect_to tasks_path
	end

	# リソースを削除する
	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end

	private
		def task_params
			params.require(:task).permit(:title)
		end
end
