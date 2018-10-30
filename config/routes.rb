Rails.application.routes.draw do
  get 'posts/index'
  get "/" => "tasks#index"
  # get "/edit" => "tasks#edit"
  get "/done" => "tasks#done"
    resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
