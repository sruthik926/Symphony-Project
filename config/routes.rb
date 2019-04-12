Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'about', to: 'static#about'
  get '/', to: 'static#welcome'
  patch '/add_to_cart', to: 'cart#update', as: :add_document_to_cart
  get 'my_students', to: 'instructors#my_students', as: :my_students
  get 'instructor/new_appointment', to: 'appointments#new'
  delete 'cancel/appointments/:id', to: 'appointments#destroy', as: :cancel_appointment
  #patch 'update/appointments/:id',  to: 'appointments#update',  as: :update_appointment

  resources :sessions, only: [:new, :create, :destroy]
  resources :students, only: [:index, :new, :show, :create, :edit, :update]
  resources :instructors, only: [:new, :show]
  resources :appointments, only: [:index, :new, :show, :create, :edit, :update]
  resources :documents, only: [:index, :show]
  resources :instructors, only: [:new, :create]

  # resources :appointments, only: [:destroy]
end
