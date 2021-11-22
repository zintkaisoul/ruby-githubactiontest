Rails.application.routes.draw do
    root 'db_sync#index'

    get '/db_sync', to: 'db_sync#index'
    post '/db_sync', to: 'db_sync#synchronize'
    

end
