Rails.application.routes.draw do
	root 'welcome#home'

  resources :projects

  get 'projects' => 'projects#index'

  get 'contacts/index' => 'contacts#index'
  get 'contacts/new' =>  'contacts#new'
  get 'home' => 'welcome#home'
  get 'about' =>'welcome#about'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
