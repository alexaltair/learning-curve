LearningCurve::Application.routes.draw do
  resources :answers do
    new do
      post :upload
      get :save_video
    end
  end

  resources :questions
  root to: 'questions#index'
  get '/answers/upload' => 'answers#upload'
  devise_for :users
end
