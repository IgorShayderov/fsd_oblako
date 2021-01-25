# frozen_string_literal: true

module Api
  module V1
    class TodosController < BaseController
      before_action :get_or_create_project, only: %i[create]
      before_action :get_todo, only: %i[update]

      def create
        @todo = @project.todos.new(todo_params)

        if @todo.save
          render json: @todo.as_json({
            only: %i[id text is_completed],
            include: { project: { only: %i[id title]}}
          }), status: :created
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

      def get_or_create_project
        @project = Project.find_by(id: params[:project_id]) || Project.create!(title: params[:new_project_title])
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
