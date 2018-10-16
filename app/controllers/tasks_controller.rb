class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  #"2017-06-01": [{text: 'item 1 - any js object'}]

  def vendor_tasks
    user = User.first
    user_tasks = Task.where(user_id: user.id)
    tasks = {}

    user_tasks.each do |t|
      tasks[t.idate] = [{text: t.description, start: "10:00 am", end: "10:30 am"}]
    end

    render json: {"tasks": tasks}
  end

  def admin_tasks
    task_admins = TaskAdmin.all
    task_users = Task.all
    all_tasks = [task_admins, task_users].flatten!

    render json: {"allTasks": all_tasks}
  end


  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:description, :type, :time, :client, :user_id, :value)
    end
end
