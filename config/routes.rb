Rails.application.routes.draw do

  scope '/api' do
    post 'user_token' => 'user_token#create'
    get "user_type" => "users#get_user_type"
    get "team_info" => "company#get_team_info"
    get "week_stats" => "company#week_stats"
    get "v_tasks" => "tasks#vendor_tasks"
    get "projection" => "sell#projection"
    get "authorization" => "sell#authorization"
    put "authorize" => "sell#edit_sale"
    resources :sell
    resources :users
    resources :task_admins
    resources :admins
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
