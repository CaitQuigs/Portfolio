# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        welcome#home
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
#                                       GET    /projects(.:format)                                                                      projects#index
#                                  home GET    /home(.:format)                                                                          welcome#home
#                                 about GET    /about(.:format)                                                                         welcome#about
#                               contact GET    /contact(.:format)                                                                       contacts#new
#                              contacts GET    /contacts(.:format)                                                                      contacts#new
#                  contact_confirmation GET    /contact_confirmation(.:format)                                                          contacts#contact_confirmation
#                         contacts_list GET    /contacts_list(.:format)                                                                 contacts#index
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
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
	root 'welcome#home'

  resources :projects do
    resources :screenshots
  end

  resources :tags

  get 'projects' => 'projects#index'

	get 'home' => 'welcome#home'
  get 'about' =>'welcome#about'

  get 'contact' => 'contacts#new'
  get 'contacts' => 'contacts#new'

  get 'contact_confirmation' => 'contacts#contact_confirmation'

  # Routes below here will only be visible in admin section
  get 'contacts_list' => 'contacts#index'
end
