TalksApp::Application.routes.draw do
  resources :projects
  resources :files
  devise_for :users
  
  root :to => 'main#dashboard'
  get 'auth' => 'main#auth'

  
  get 'challenge1/' => "users#edit", :as => "edit_user"
  put 'account/' => "users#update", :as => "update_user"

  get 'challenge2' => "challenges#challenge_two", :as => "challenge_two"
  match 'challenge2/like' => "challenges#challenge_two_action", :as => "challenge_two_action"
  get 'challenge2/hack' => "challenges#hack2", :as => "hack_two"
  
  get 'challenge3/:id' => "challenges#challenge_three", :as => "challenge_three"
  
  get 'challenge5/' => "credit_cards#form", :as => "cc_form"
  post 'challenge5/' => "credit_cards#process_cc", :as => "cc_process"
  
  get 'challenge8' => 'files#index', :as => "challenge_eight"
  get 'challenge9' => 'challenges#challenge_nine', :as => "challenge_nine"
  
  #get 'challenge2' => "comments#index", :as => "comments"
  #match 'create-comment' => "comments#create", :as => "create_comment"
end
