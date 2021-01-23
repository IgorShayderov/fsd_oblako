# frozen_string_literal: true

module Api
  module V1
    class TodosController < BaseController
      before_action :get_project, only: %i[create]
      before_action :get_todo, only: %i[update]

      def create
        @todo = @project.todos.new(todo_params)

        if @todo.save
          render json: @todo, status: :created
        else
          render json: { errors: @todo.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @todo.update(is_completed: !@todo.is_completed)
          head :no_content, status: :accepted
        else
          render json: { errors: @todo.errors }, status: :unprocessable_entity
        end
      end

      private

      def get_project
        @project = Project.find(params[:project_id])
      end

      def get_todo
        @todo = Todo.find(params[:id])
      end

      def todo_params
        params.require(:todo).permit(:text)
      end
    end
  end
end
