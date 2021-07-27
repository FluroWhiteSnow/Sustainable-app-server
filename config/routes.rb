Rails.application.routes.draw do

  scope '/api' do
    resources :user
    get '/user_all', to: 'user#index_all'
    resources :user_daily
    get '/user_daily_all', to: 'user_daily#index_all'
    resources :user_co2_daily
    get '/user_co2_daily_all', to: 'user_co2_daily#index_all'
    resources :travel_total 
    get '/travel_total_all', to: 'travel_total#index_all'
    resources :cups_total 
    get '/cups_total_all', to: 'cups_total#index_all'
    resources :user_co2_total 
    get '/user_co2_total_all', to: 'user_co2_total#index_all'

    scope '/auth' do
      post '/sign_up', to: 'user#create' 
      post '/sign_in', to: 'user#sign_in'
      
    end
  end
end

