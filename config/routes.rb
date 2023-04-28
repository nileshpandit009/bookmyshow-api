Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cities do
    resources :theaters do
      resources :screens do
        resources :screen_seats
      end
    end
  end
  
  resources :movies
  resources :bookings
end
