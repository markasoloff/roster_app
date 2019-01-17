Rails.application.routes.draw do
  get "index" => 'engineer#index'
  namespace :api do
     get "/vote/:id" => "vote#show"
     # get "/tasks" => "tasks#index"
     # post "/tasks" => "tasks#create"
     # patch "/tasks/:id" => "tasks#update"
     # delete "/tasks/:id" => "tasks#destroy"
   end  
  # post "api/vote/:id" => 'engineer#vote'

  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
end
