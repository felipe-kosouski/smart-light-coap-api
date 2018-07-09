Rails.application.routes.draw do
 resources :lamps
 put 'lamps/:id/toggle', to: 'lamps#toggle'
end
