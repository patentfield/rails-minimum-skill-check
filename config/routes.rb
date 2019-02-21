Rails.application.routes.draw do
  #devise_for :users
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/, defaults: { locale: "en" } do
    root to: 'home#index'
    get "dashboard", to: 'dashboard#index'
    get "peds" => "peds#index"
    post "peds/search" => "peds#search"
    get "peds/records" => "peds#records"
    post "peds/destroy" => "peds#destroy"


    devise_for :users, controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "users/registrations",
      confirmations: "users/confirmations"
    }
    get "peds", to: 'peds#index'
  end
end
