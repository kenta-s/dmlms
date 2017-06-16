Rails.application.routes.draw do
  resources :news do
    collection do
      post 'upload_file'
    end
  end
end
