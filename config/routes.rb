Rails.application.routes.draw do

  scope '/api' do
    resources :user
    resources :user_daily
    resources :user_co2_daily
    resources :travel_total 
    resources :cups_total 
    resources :user_co2_total 

    scope '/auth' do
      post '/sign_up', to: 'user#create' 
      post '/sign_in', to: 'user#sign_in'
      
    end
  end
end

