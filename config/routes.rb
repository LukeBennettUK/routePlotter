Rails.application.routes.draw do
  get 'edit_password/edit'
  get 'edit_email/edit'
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root 'home#index'

	resources :users
	resources :sessions
	resources :password_resets
	resources :edit_email
	resources :edit_password

	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'
	get 'profile', to: 'profile#profile_page', as: 'profile_page'

	# Profile page
	# get 'profile', to: 'profile#profile_page', as: 'profile_page'
	# get 'profile/edit-email', to: 'profile#edit_email', as: 'edit_email'
	# get 'profile/edit-password', to: 'profile#edit_password', as: 'edit_password'
end
