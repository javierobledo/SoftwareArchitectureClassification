Rails.application.routes.draw do
  resources :word_frequencies
  resources :graphs
  resources :valued_pre_parameters
  resources :valued_cla_parameters
  resources :parameters
  resources :words
  resources :cluster_documents
  resources :clusters do
    resources :word_frequencies
  end
  get 'classifications/:id/graph', to: 'classifications#graph'
  resources :classifications do
    resources :clusters
  end
  resources :documents
  resources :preprocessings do
    resources :documents
    get 'documents_csv', to: 'documents#index_csv', defaults: { format: :csv }
  end
  resources :algorithms
  resources :corpora do
    resources :preprocessings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
