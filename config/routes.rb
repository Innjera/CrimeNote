Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'top#top'
  get 'about' => 'top#about'

  resources :notes do
    resources :advises, only: [:create]

    collection do
      get "country"

      countries = [
        "Algeria", "Angola",
        "Benin", "Botswana", "BurkinaFaso", "Burundi",
        "CaboVerde", "Cameroon", "CentralAfricanRepublic", "Chad", "Comoros", "DemocraticRepublicOfTheCongo", "RepublicOfTheCongo", "CoteDIvoire",
        "Djibouti", "Egypt", "EquatorialGuinea", "Eritrea", "eSwatini", "Ethiopia",
        "Gabon", "Gambia", "Ghana", "Guinea", "GuineaBissau",
        "Kenya",
        "Lesotho", "Liberia", "Libya",
        "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique",
        "Namibia", "Niger", "Nigeria",
        "Rwanda",
        "SaoTomeAndPrincipe", "Senegal", "Seychelles", "SierraLeone", "Somalia", "Somaliland", "SouthAfrica", "SouthSudan", "Sudan",
        "Tanzania", "Togo", "Tunisia",
        "Uganda",
        "Zambia", "Zimbabwe"
      ]

      countries.each do |item|
        get "#{item}"
      end
    end
  end

  get '/sitemap' => redirect('https://s3-ap-northeast-1.amazonaws.com/crime-note/sitemaps/sitemap.xml.gz')
end
