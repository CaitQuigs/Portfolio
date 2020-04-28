Rails.application.routes.draw do
	root 'welcome#home'

  resources :projects

  get 'projects' => 'projects#index'

	get 'home' => 'welcome#home'
  get 'about' =>'welcome#about'

  get 'contact' => 'contacts#new'
  get 'contacts' => 'contacts#new'

  get 'contact_confirmation' => 'contacts#contact_confirmation'

  # Routes below here will only be visible in admin section
  get 'contacts_list' => 'contacts#index'
end
