LearningCurve::Application.routes.draw do
  resources :answers do
    new do
      post :upload
      get :save_video
    end
  end

  resources :questions
  
  get '/answers/upload' => 'answers#upload'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'questions#index'
end
