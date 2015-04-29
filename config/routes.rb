Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :payloads
      get '/top_urls', to: 'payload_stats#top_urls'
    end
  end
end
