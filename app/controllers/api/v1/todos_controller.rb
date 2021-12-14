class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    if logged_in? && current_user
      @todos = current_user.todos
      render json: @todos
    else
      render json: {msg: 'Not logged in'}
    end
  end

  # GET /todos/1
  def show
    if logged_in? && current_user
      #TODO 1ER PART :AJOUTER UNE CONDITION POUR VERIFIER QUE LE CURRENT_USER.ID (SI CETTE VALEUR EXISTE BIEN, SINON JSP QUOI PRENDRE), SOIT BIEN ÉGALE AU USER_ID DE LA TODO
      #TODO 2E PART : RENVOYER UN JSON DISANT QU'ON EST PAS LE BON UTILISATEUR SI CETTE CONDITION EST FAUSSE
      render json: @todo
    else
      render json: {msg: 'Not logged in'}
    end
  end

  # POST /todos
  def create
    if logged_in? && current_user
      @todo = Todo.new(todo_params.merge(user: current_user))
      if @todo.save
        render json: @todo, status: :created, location: api_v1_todos_path(@todo)
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    else
      render json: {msg: 'Not logged in'}
    end
  end

  # PATCH/PUT /todos/1
  def update
    if logged_in? && current_user
      #TODO 1ER PART :AJOUTER UNE CONDITION POUR VERIFIER QUE LE CURRENT_USER.ID (SI CETTE VALEUR EXISTE BIEN, SINON JSP QUOI PRENDRE), SOIT BIEN ÉGALE AU USER_ID DE LA TODO
      #TODO 2E PART : RENVOYER UN JSON DISANT QU'ON EST PAS LE BON UTILISATEUR SI CETTE CONDITION EST FAUSSE
      if @todo.update(todo_params)
        render json: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    else
      render json: {msg: 'Not logged in'}
    end
  end

  # DELETE /todos/1
  def destroy
    if logged_in? && current_user
      #TODO 1ER PART :AJOUTER UNE CONDITION POUR VERIFIER QUE LE CURRENT_USER.ID (SI CETTE VALEUR EXISTE BIEN, SINON JSP QUOI PRENDRE), SOIT BIEN ÉGALE AU USER_ID DE LA TODO
      #TODO 2E PART : RENVOYER UN JSON DISANT QU'ON EST PAS LE BON UTILISATEUR SI CETTE CONDITION EST FAUSSE
      @todo.destroy
    else
      render json: {msg: 'Not logged in'}
    end
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
