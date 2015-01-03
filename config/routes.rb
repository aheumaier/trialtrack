Medicore::Application.routes.draw do


  devise_for :users, :controllers => { :registrations => :registrations, :sessions => :sessions}

  get "welcome/index"
  get "welcome/contact"

  get "/dashboard/:user" => "dashboard#index"

  namespace :api do
    resources :trials
    resources :users do
      collection do
        get 'questions'
      end
    end
  end

  resources :users

  resources :trials_users

  resources :trials_questions

  resources :trials do
    member do
      post 'assign_question'
      delete 'remove_question'
    end
  end

  resources :scalevalues

  resources :scales_scalevalues

  resources :scales

  resources :roles

  resources :questions

  resources :question_types

  resources :organizations

  resources :answers do
    collection do
      put 'answer'
    end
  end

  resources :addresses

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

end
