Source::Application.routes.draw do
  get  '/offers', to: 'offers#index'
  post '/offers/fetch', to: "offers#fetch"
end
