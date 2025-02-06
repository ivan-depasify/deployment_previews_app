Rails.application.routes.draw do
  root "pages#home"
  post "articles", to: "pages#create"
end
