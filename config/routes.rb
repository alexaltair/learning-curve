LearningCurve::Application.routes.draw do
  get "profiles/show"

  resources :answers, except: :index do
    new do
      post :upload
      get :save_video
    end
  end

  resources :lessons do
    new do
      post :upload
      get :save_video
    end
  end

  resources :questions
  resources :searches, only: :index

  get '/answers/upload', to: 'answers#upload'
  get '/profiles/:id', to: 'profiles#show'
  get '/about' => 'questions#about'


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'questions#index'
end
