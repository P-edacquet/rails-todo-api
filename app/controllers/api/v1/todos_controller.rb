class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    if logged_in? && current_user
      @todos = current_user.todos
      render json: @todos
    end
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    #TODO comparer current_user avec le user donné par react
    if logged_in? && current_user
      @todo = Todo.new(todo_params.merge(user: current_user))
      if @todo.save
        render json: @todo, status: :created, location: api_v1_todos_path(@todo)
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:task, :body)
    end
end
