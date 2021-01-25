# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < BaseController
      def index
        all_projects_with_todos = Project.all_projects_with_todos

        render json: all_projects_with_todos, status: :ok
      rescue StandardError => e
        render plain: e, status: :internal_server_error
      end
    end
  end
end
