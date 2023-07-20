class TasksController < ApplicationController

	# リソースの一覧を表示する
	def index
		# Taskテーブルからallメソッドでカラムの全データ取得
		@tasks = Task.all
	end

	# リソースを新規作成する
	def new
		# newメソッドで初期化で新しいデータ作成
		@task = Task.new
	end

	# リソースを新規作成して追加(保存)する
	def create
		#formのデータを受け取る
		@task = Task.create(task_params)
		# データ保存
		if @task.save
		# 保存完了後、一覧へリダイレクト
		redirect_to tasks_path
		else
			render 'new'
		end
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
			params.require(:task).permit(:title, :description)
		end
end
