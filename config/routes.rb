Rails.application.routes.draw do

  scope '/api' do
    resources :user
    resources :user_daily
    scope '/auth' do
      post '/sign_up', to: 'user#create' 
      post '/sign_in', to: 'user#sign_in'
    end
  end
end

