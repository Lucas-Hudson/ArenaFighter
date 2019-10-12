# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'fights#new'

  resources :fighters
  resources :fights
  resources :rankings, only: [:index] 
end
