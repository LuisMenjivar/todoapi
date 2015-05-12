class Api::V1::TodosController < ApiController
  before_action :restrict_access   

  def index
    todos = @current_user.todos
    # render json: todos
    render json: todos, each_serializer: TodoSerializer 
  end                          

  def create
    todo = @current_user.todos.create(todo_params)
    if todo.save
      render json: todo, status: :created
    else
      render json: {error: "Problem saving!"}, status: :unprocessable_entity
    end
  end

  def destroy
    if todo = @current_user.todos.find_by_id(params[:id])
    todo.destroy    
    render json: :accepted
    else
    render json: :bad_request
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description) 
  end
    
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      if ApiKey.exists?(access_token: token)
        @current_user = ApiKey.find_by_access_token(token).user
      else
         render json: :bad_request
      end
    end 
  end
end