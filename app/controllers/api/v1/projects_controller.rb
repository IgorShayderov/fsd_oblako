# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      def index
        all_projects_with_todos = Project.all_projects_with_todos

        render json: all_projects_with_todos
      end
    end
  end
end
