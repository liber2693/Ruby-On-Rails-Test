Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :referrals, only: [:create] do
    collection do
      get '/:code' => 'referrals#show', :as => :show_referral
    end
  end
end
