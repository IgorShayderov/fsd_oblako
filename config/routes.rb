# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('projects')

  scope module: 'api' do
    scope module: 'v1' do
      resources :projects, only: %i[index] do
        resources :todos, only: %i[update]
      end

      post '/todos', to: 'todos#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
