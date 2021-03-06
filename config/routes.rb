Rails.application.routes.draw do
  root to: 'news#index'
  resources :news do
    collection do
      post 'upload_file'
      get 'quick_labelling'
    end
    member do
      patch 'update_label'
    end
  end
end
