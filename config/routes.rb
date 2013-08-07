LearningCurve::Application.routes.draw do
  get "profiles/show"

  resources :answers do
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

  get '/answers/upload', to: 'answers#upload'
  get '/profiles/:id', to: 'profiles#show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'questions#index'
end
