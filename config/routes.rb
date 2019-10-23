Rails.application.routes.draw do
  resources :concordances
  resources :key_words
  resources :conc_words
  resources :gramm_dict_words
  resources :grammar_dictionaries
  resources :subj_ind_words
  resources :subject_indices
  resources :freq_voc_words
  resources :frequency_vocabularies
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

