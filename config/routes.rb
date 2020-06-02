# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                      new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#                     new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                       PUT    /users/password(.:format)                                                                devise/passwords#update
#                                       POST   /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#                 new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#                edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#                     user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                                       PUT    /users(.:format)                                                                         devise/registrations#update
#                                       DELETE /users(.:format)                                                                         devise/registrations#destroy
#                                       POST   /users(.:format)                                                                         devise/registrations#create
#                                  root GET    /                                                                                        welcome#home
#                               contact GET    /contact(.:format)                                                                       contacts#new
#                  contact_confirmation GET    /contact_confirmation(.:format)                                                          contacts#contact_confirmation
#                                  home GET    /home(.:format)                                                                          welcome#home
#                                 about GET    /about(.:format)                                                                         welcome#about
#                   project_screenshots GET    /projects/:project_id/screenshots(.:format)                                              screenshots#index
#                                       POST   /projects/:project_id/screenshots(.:format)                                              screenshots#create
#                new_project_screenshot GET    /projects/:project_id/screenshots/new(.:format)                                          screenshots#new
#               edit_project_screenshot GET    /projects/:project_id/screenshots/:id/edit(.:format)                                     screenshots#edit
#                    project_screenshot GET    /projects/:project_id/screenshots/:id(.:format)                                          screenshots#show
#                                       PATCH  /projects/:project_id/screenshots/:id(.:format)                                          screenshots#update
#                                       PUT    /projects/:project_id/screenshots/:id(.:format)                                          screenshots#update
#                                       DELETE /projects/:project_id/screenshots/:id(.:format)                                          screenshots#destroy
#                              projects GET    /projects(.:format)                                                                      projects#index
#                                       POST   /projects(.:format)                                                                      projects#create
#                           new_project GET    /projects/new(.:format)                                                                  projects#new
#                          edit_project GET    /projects/:id/edit(.:format)                                                             projects#edit
#                               project GET    /projects/:id(.:format)                                                                  projects#show
#                                       PATCH  /projects/:id(.:format)                                                                  projects#update
#                                       PUT    /projects/:id(.:format)                                                                  projects#update
#                                       DELETE /projects/:id(.:format)                                                                  projects#destroy
#                                  tags GET    /tags(.:format)                                                                          tags#index
#                                       POST   /tags(.:format)                                                                          tags#create
#                               new_tag GET    /tags/new(.:format)                                                                      tags#new
#                              edit_tag GET    /tags/:id/edit(.:format)                                                                 tags#edit
#                                   tag GET    /tags/:id(.:format)                                                                      tags#show
#                                       PATCH  /tags/:id(.:format)                                                                      tags#update
#                                       PUT    /tags/:id(.:format)                                                                      tags#update
#                                       DELETE /tags/:id(.:format)                                                                      tags#destroy
#                              contacts GET    /contacts(.:format)                                                                      contacts#index
#                                       POST   /contacts(.:format)                                                                      contacts#create
#                           new_contact GET    /contacts/new(.:format)                                                                  contacts#new
#                          edit_contact GET    /contacts/:id/edit(.:format)                                                             contacts#edit
#                                       GET    /contacts/:id(.:format)                                                                  contacts#show
#                                       PATCH  /contacts/:id(.:format)                                                                  contacts#update
#                                       PUT    /contacts/:id(.:format)                                                                  contacts#update
#                                       DELETE /contacts/:id(.:format)                                                                  contacts#destroy
#                                       GET    /projects(.:format)                                                                      projects#index
#                    show_project_modal GET    /projects/:id/show_project_modal(.:format)                                               projects#show_project_modal
#                         contacts_list GET    /contacts_list(.:format)                                                                 contacts#index
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users
	root 'welcome#home'

  get 'contact' => 'contacts#new'
  get 'contact_confirmation' => 'contacts#contact_confirmation'
  
  get 'home' => 'welcome#home'
  get 'about' =>'welcome#about'



  resources :projects do
    resources :screenshots
  end

  resources :tags

  resources :contacts

  get 'projects' => 'projects#index'

	get 'projects/:id/show_project_modal' => 'projects#show_project_modal', :as => :show_project_modal

  # Routes below here will only be visible in admin section
  get 'contacts_list' => 'contacts#index'
end
