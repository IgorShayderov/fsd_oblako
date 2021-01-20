# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_todos_for_project(tasks_list, project)
  tasks_list.each do |task|
    Todo.find_or_create_by(text: task[:text]) do |todo|
      todo.is_completed = task[:is_completed] if task.key?(:is_completed)
      todo.project_id = project[:id]
    end
  end
end

[
  [
    [
      { text: 'Купить молоко' },
      { text: 'Заменить масло в двигателе до 23 апреля' },
      { text: 'Отправить письмо бабушке', is_completed: true },
      { text: 'Заплатить за квартиру' },
      { text: 'Забрать обувь из ремонта' }
    ],
    Project.find_or_create_by(title: 'Семья')
  ],
  [
    [
      { text: 'Позвонить заказчику', is_completed: true },
      { text: 'Отправить документы', is_completed: true },
      { text: 'Заполнить отчет' }
    ],
    Project.find_or_create_by(title: 'Работа')
  ],
  [
    [
      { text: 'Позвонить другу' },
      { text: 'Подготовиться к поездке' }
    ],
    Project.find_or_create_by(title: 'Прочее')
  ]
].each { |(tasks_list, project)| create_todos_for_project(tasks_list, project) }
