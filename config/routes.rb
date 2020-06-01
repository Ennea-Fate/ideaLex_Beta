Rails.application.routes.draw do

  get 'search_engine/index', to: 'search_engine#index', as: 'search_engine_index'
  get 'search_engine/unanimous', to: 'search_engine#unanimous', as: 'search_engine_unanimous'
  get 'search_engine/concordance', to: 'search_engine#concordance', as: 'search_engine_concordance'
  get 'search_engine/freqvoc', to: 'search_engine#freqvoc', as: 'search_engine_freqvoc'
  get 'search_engine/grammdict', to: 'search_engine#grammdict', as: 'search_engine_grammdict'
  root 'welcome#index'
  get 'welcome/index'
  
  resources :notes
  resources :edits
  resources :unanimous
  resources :authors
  resources :users
  resources :roles
  resources :concordances
  resources :key_words
  resources :conc_words
  resources :gramm_dict_words
  resources :grammar_dictionaries
  resources :subj_ind_words
  resources :subject_indices
  resources :freq_voc_words
  resources :frequency_vocabularies
  resources :gramm_dict_word_forms
  resources :books
  resources :sessions, only: [:new, :create, :destroy]
 
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

