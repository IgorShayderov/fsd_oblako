# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true

  has_many :todos

  def self.all_projects_with_todos
    includes(:todos)
    .map do |project|
      project_json = project.as_json
      project_json[:todos] = project.todos

      project_json
    end
  end
end
