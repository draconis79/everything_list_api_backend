class TasksController < ApplicationController

  # GET /TASKS
  def index
    @tasks = Task.all.reverse

    render json: @tasks
  end

  # POST /TASKS
  def create
    @task = Task.new(task_params)
    @task.category_id = params[:category_id]


    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    find_task.update(task_params)
    render(json: { task: find_task })
  end

  def destroy
    find_task.destroy
    render(status: 204)
  end

  private

  def find_task
    @task ||= Task.find(params[:id])
  end
    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :task)
    end
end
