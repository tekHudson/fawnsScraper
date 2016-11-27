Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#scrape_fawns'

  get "/fawn/:fawn_id" => "fawns#scrape_fawn"
end
