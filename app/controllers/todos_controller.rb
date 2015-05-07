class TodosController < ApplicationController 
  
  before_action :authenticate_user!
  
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.create(todo_params)
    if @todo.persisted?
      redirect_to todos_path, notice:'Item was saved' 
    else 
      render :action => :new
    end
  end

  def destroy
    @todo = Todo.where(user_id: current_user.id).find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: 'Todo was deleted' 
  end

  private

  def todo_params
    params.require(:todo).permit(:description) 
  end


end
