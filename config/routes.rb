Rails.application.routes.draw do
  resources :valued_pre_parameters
  resources :valued_cla_parameters
  resources :parameters
  resources :words
  resources :cluster_documents
  resources :clusters
  resources :classifications
  resources :documents
  resources :preprocessings
  resources :algorithms
  resources :corpora
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
