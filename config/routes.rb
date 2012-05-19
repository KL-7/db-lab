DbApp::Application.routes.draw do

  root :to => 'auditorium_types#index'

  resources :auditorium_types
  resources :auditoria

end
