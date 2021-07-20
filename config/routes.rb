Rails.application.routes.draw do

  scope '/api' do
    resources :user
    resources :user_daily

  end
end

