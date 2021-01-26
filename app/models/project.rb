# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true

  has_many :todos

  scope :all_projects_with_todos, lambda {
    includes(:todos).as_json({ only: %i[id title], include: { todos: { only: %i[id text is_completed] } } })
  }
end
