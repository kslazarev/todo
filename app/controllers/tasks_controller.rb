class TasksController < ApplicationController
  before_filter :find_task, :only => [:show, :edit, :destroy, :update]
  before_filter :build_filter_params, :only => :index

  def index
    @tasks = Task.search(@filter_params).all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to @task, :notice => 'Task was successfully created.'
    else
      render action => 'new'
    end
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to @task, :notice => 'Task was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_url
  end

  private

  def build_filter_params
    @filter_params = {
      :due_date => current_due_date || Date.today,
      :important => condition(:important),
      :complete => condition(:complete)
    }
  end

  def condition status
    ('true' == params[status] ? true : false) unless params[status].nil?
  end

  def current_due_date
    Date.parse(params[:due_date]) if params[:due_date]
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
