Rails.application.routes.draw do

  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :posts do
      resources :comments
    end
  end

  root to: 'posts#index'

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
