Rails.application.routes.draw do
  get "index" => 'engineer#index'
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
end
