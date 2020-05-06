Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  root "items#index"


  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  # 本当はitemにネストする感じだと思いますが、スプリントレビューのため一時的にここに設定。
  resources :purchases

  resources :users do
    collection do
      get 'credit_register'
      get 'logout'
    end
  end
end
