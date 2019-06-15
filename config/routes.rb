Rails.application.routes.draw do

    get '/plates', to 'plates#index'
    get '/plates/:id', to 'plates#show'
    post '/plates', to 'plates#create'
    delete 'plates/:id', to 'plates#delete'

end
