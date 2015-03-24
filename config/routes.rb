Rails.application.routes.draw do
  Rails.application.routes.draw do
    root :to => 'users#index'

    resources :sessions
    resources :user_mailer

    resources :users

    resources :answers do
      member do
        put "Like", to: "answers#upvote"
        put "Dislike", to: "answers#downvote"
      end
    end

    resources :questions do
      resources :answers


    end
    get "/log-in" => "sessions#new"
    post "/log-in" => "sessions#create"
    get "/log-out" => "sessions#destroy", as: :log_out

  end
end
