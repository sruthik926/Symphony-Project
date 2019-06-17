Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'about', to: 'static#about'
  get '/', to: 'static#welcome'
  patch '/add_to_cart', to: 'cart#update', as: :add_document_to_cart
  get 'my_students', to: 'instructors#my_students', as: :my_students
  get 'instructor/new_appointment', to: 'appointments#new'
  delete 'cancel/appointments/:id', to: 'appointments#destroy', as: :cancel_appointment
  get 'search/appointment', to: 'appointments#search', as: :search_appointment
  get 'send_data', to: 'documents#show', as: :send_data
  get 'all_students', to: 'students#all_students', as: :all_students
  get '/search', to: 'searches#search', as: :search
  post '/search', to: 'searches#foursquare'
  get '/admin', to: 'admin#index'
  # get 'admin/show_students', to: 'admin#show_students'

  #patch 'update/appointments/:id',  to: 'appointments#update',  as: :update_appointment

  #get ‘auth/:provider/callback’, to: 'sessions#googleAuth’
  #get ‘auth/failure’, to: redirect(‘/’)

  get '/auth/facebook/callback' => 'sessions#omniauth_create'





  resources :sessions, only: [:new, :create, :destroy]
  resources :students, only: [:index, :new, :show, :create, :edit, :update]
  resources :instructors, only: [:new, :show]
  resources :appointments, only: [:index, :new, :show, :create, :edit, :update]
  resources :instructors, only: [:new, :create]
  resources :documents, only: [:index, :new, :create, :edit]
  # resources :admin, only: [:index]

  resources :students, only: [:show] do
   # nested resource for documents
   resources :documents, only: [:show, :index]
 end

 resources :instructors, only: [:show] do
  # nested resource for documents
  resources :documents, only: [:show, :new]
end


end
