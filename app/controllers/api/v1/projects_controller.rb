# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        begin
          all_projects_with_todos = Project.all_projects_with_todos

          render json: all_projects_with_todos, status: :ok
        rescue => exception
          render plain: exception, status: :internal_server_error
        end
      end
    end
  end
end
