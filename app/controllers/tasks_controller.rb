class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(message_params)

    if @tasks.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])

    if @tasks.update(message_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end

 private

def set_message
    @tasks = Message.find(params[:id])
end

def message_params
    params.require(:task).permit(:content, :title, :status)
end

end

  
  
