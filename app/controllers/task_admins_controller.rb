class TaskAdminsController < ApplicationController
  before_action :set_task_admin, only: [:show, :update, :destroy]


  # POST /task_admins
  def create
    @task_admin = TaskAdmin.new(task_admin_params)

    if @task_admin.save
      render json: @task_admin, status: :created, location: @task_admin
    else
      render json: @task_admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_admins/1
  def update
    if @task_admin.update(task_admin_params)
      render json: @task_admin
    else
      render json: @task_admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_admins/1
  def destroy
    @task_admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_admin
      @task_admin = TaskAdmin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_admin_params
      params.require(:task_admin).permit(:admin_id, :title, :description, :time)
    end
end
