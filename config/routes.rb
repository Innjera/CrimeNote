Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'top#top'
  get 'about' => 'top#about'
  resources :notes do
    resources :advises, only: [:create]
  end
  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/crime-note/sitemaps/sitemap.xml.gz')
end
