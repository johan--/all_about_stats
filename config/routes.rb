Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :payloads
      get '/top_urls', to: 'payload_stats#top_urls'
      get '/top_referrers', to: 'payload_stats#top_referrers'
    end
  end
  root 'application#index'
  get '/*path' => 'ember#bootstrap'
end
