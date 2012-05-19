DbApp::Application.routes.draw do

  root :to => 'lectures#index'

  resources :lectures
  resources :courses
  resources :subjects
  resources :lecturers
  resources :auditorium_types
  resources :auditoria

  resources :queries, :only => [:index] do
    get :get, :on => :collection
  end

end
