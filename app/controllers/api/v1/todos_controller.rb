# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      before_action :get_project, only: %i[create]
      before_action :get_todo, only: %i[update]

      def create
        @project.create(todo_params)
      end

      def update
        @todo.update(todo_params)
      end

      private

      def get_project
        @project = Project.find(params[:project_id])
      end

      def get_todo
        @todo = Todo.find(params[:id])
      end

      def todo_params
        params.require(:todo).permit(:text, :is_completed)
      end
    end
  end
end
