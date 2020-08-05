# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                           PUT    /users(.:format)                                                                         users/registrations#update
#                           DELETE /users(.:format)                                                                         users/registrations#destroy
#                           POST   /users(.:format)                                                                         users/registrations#create
#                      root GET    /                                                                                        welcome#home
#                      home GET    /home(.:format)                                                                          welcome#home
#                     about GET    /about(.:format)                                                                         welcome#about
#                  contacts GET    /contacts(.:format)                                                                      contacts#index
#                           POST   /contacts(.:format)                                                                      contacts#create
#               new_contact GET    /contacts/new(.:format)                                                                  contacts#new
#              edit_contact GET    /contacts/:id/edit(.:format)                                                             contacts#edit
#                   contact GET    /contacts/:id(.:format)                                                                  contacts#show
#                           PATCH  /contacts/:id(.:format)                                                                  contacts#update
#                           PUT    /contacts/:id(.:format)                                                                  contacts#update
#                           DELETE /contacts/:id(.:format)                                                                  contacts#destroy
#      contact_confirmation GET    /contact_confirmation(.:format)                                                          contacts#contact_confirmation
#       project_screenshots GET    /projects/:project_id/screenshots(.:format)                                              screenshots#index
#                           POST   /projects/:project_id/screenshots(.:format)                                              screenshots#create
#    new_project_screenshot GET    /projects/:project_id/screenshots/new(.:format)                                          screenshots#new
#   edit_project_screenshot GET    /projects/:project_id/screenshots/:id/edit(.:format)                                     screenshots#edit
#        project_screenshot GET    /projects/:project_id/screenshots/:id(.:format)                                          screenshots#show
#                           PATCH  /projects/:project_id/screenshots/:id(.:format)                                          screenshots#update
#                           PUT    /projects/:project_id/screenshots/:id(.:format)                                          screenshots#update
#                           DELETE /projects/:project_id/screenshots/:id(.:format)                                          screenshots#destroy
#                  projects GET    /projects(.:format)                                                                      projects#index
#                           POST   /projects(.:format)                                                                      projects#create
#               new_project GET    /projects/new(.:format)                                                                  projects#new
#              edit_project GET    /projects/:id/edit(.:format)                                                             projects#edit
#                   project GET    /projects/:id(.:format)                                                                  projects#show
#                           PATCH  /projects/:id(.:format)                                                                  projects#update
#                           PUT    /projects/:id(.:format)                                                                  projects#update
#                           DELETE /projects/:id(.:format)                                                                  projects#destroy
#                      tags GET    /tags(.:format)                                                                          tags#index
#                           POST   /tags(.:format)                                                                          tags#create
#                   new_tag GET    /tags/new(.:format)                                                                      tags#new
#                  edit_tag GET    /tags/:id/edit(.:format)                                                                 tags#edit
#                       tag GET    /tags/:id(.:format)                                                                      tags#show
#                           PATCH  /tags/:id(.:format)                                                                      tags#update
#                           PUT    /tags/:id(.:format)                                                                      tags#update
#                           DELETE /tags/:id(.:format)                                                                      tags#destroy
#        show_project_modal GET    /projects/:id/show_project_modal(.:format)                                               projects#show_project_modal
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" } 
	root 'welcome#home'

  get 'home' => 'welcome#home'
  get 'about' =>'welcome#about'

  resources :contacts

  get 'contact_confirmation' => 'contacts#contact_confirmation'
  
  resources :projects do
    resources :screenshots
  end

  resources :tags

	get 'projects/:id/show_project_modal' => 'projects#show_project_modal', :as => :show_project_modal
end
