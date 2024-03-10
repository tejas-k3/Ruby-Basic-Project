class TodosController < ApplicationController
    # before_action :todo, only: [:show, :edit, :update, :destroy]
    before_action :todo, only: [:show, :update]
  
    def index
        @todos = Todo.all
        render json: @todos
    end
    
    def show
      render json: @todo
    end
  
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        render json: @todo, status: :created
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @todo.update(todo_params)
        render json: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
        @todo.destroy
        head :no_content
    end

    private
  
    def todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:name, :description, :state)
    end
end