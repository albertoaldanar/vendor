require 'test_helper'

class TaskAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_admin = task_admins(:one)
  end

  test "should get index" do
    get task_admins_url, as: :json
    assert_response :success
  end

  test "should create task_admin" do
    assert_difference('TaskAdmin.count') do
      post task_admins_url, params: { task_admin: { admin_id: @task_admin.admin_id, description: @task_admin.description, time: @task_admin.time, title: @task_admin.title } }, as: :json
    end

    assert_response 201
  end

  test "should show task_admin" do
    get task_admin_url(@task_admin), as: :json
    assert_response :success
  end

  test "should update task_admin" do
    patch task_admin_url(@task_admin), params: { task_admin: { admin_id: @task_admin.admin_id, description: @task_admin.description, time: @task_admin.time, title: @task_admin.title } }, as: :json
    assert_response 200
  end

  test "should destroy task_admin" do
    assert_difference('TaskAdmin.count', -1) do
      delete task_admin_url(@task_admin), as: :json
    end

    assert_response 204
  end
end
