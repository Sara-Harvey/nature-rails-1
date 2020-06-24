Rails.application.routes.draw do

	root :to => "static#home"
	get '/login' => "sessions#new"
	post '/sessions' => "sessions#create"
	get '/logout' => "sessions#destroy"

	resources :birds
	resources :categories

	resources :users do
		resources :birds, only: [:show, :index]
	end

	get "/:page" => "static#show"

	get '/auth/:provider/callback' => 'sessions#omniauth'
end
