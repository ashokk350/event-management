Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :events do
    collection do
      post :attend_event
    end

    member do
      delete :leave_event
    end
  end
end
