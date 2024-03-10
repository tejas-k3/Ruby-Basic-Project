class TodosController < ApplicationController
    # before_action :todo, only: [:show, :edit, :update, :destroy]
    before_action :todo, only: [:show, :update]
    STATUS_MAPPING = {
    "created" => 0,
    "in_progress" => 1,
    "done" => 2
    }.freeze

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

    def get_by_state(status)
        db_value = TodosController::STATUS_MAPPING[status]
        @todos = Todo.where(state: STATUS_MAPPING[status])
        render json: @todos
    end

    def created
        get_by_state("created")
    end
    
    def inprogress
        get_by_state("in_progress")
    end
    
    def done
        get_by_state("done")
    end
 
    private
  
    def todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:name, :description, :state)
    end
end