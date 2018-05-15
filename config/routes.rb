Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  get 'articles/edit'
  get 'articles/delete'
  get 'articles/show'
  get 'articles/sms'
  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end

  mount KannelRails::Engine => '/sms'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
