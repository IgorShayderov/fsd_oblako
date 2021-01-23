# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true

  has_many :todos

  scope :all_projects_with_todos, lambda {
    includes(:todos)
    .map do |project|
      project_json = project.as_json.except('updated_at', 'created_at')
      project_json[:todos] = project.todos.as_json.map { |item| item.except("created_at", "updated_at", "project_id") }

      project_json
    end
  }
end
