LearningCurve::Application.routes.draw do
  resources :answers do
    new do
      post :upload
      get :save_video
    end
  end

  get '/answers/upload' => 'answers#upload'
  root :to => 'answers#index'

end
