# == Schema Information
#
# Table name: notes
#
#  id                   :bigint(8)        not null, primary key
#  latitude             :float
#  longitude            :float
#  address              :string           not null
#  address_city_part    :string           not null
#  address_country_part :string           default("South Africa"), not null
#  situation            :text             not null
#  occured_at           :datetime         not null
#  crime_category       :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Note < ApplicationRecord
  has_many :advises, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :crime_category, format: { with: /[\w\d ]/, allow_blank: true}, length: {minimum: 2, maximum: 100, allow_blank: true}
  validates :address_city_part, presence: true, length: {minimum: 2, maximum: 100, allow_blank: true}
  validates :situation, presence: true, length: {minimum: 2, maximum: 4000, allow_blank: true}

  COUNTRIES_NAMES = [
    "South Africa",
    "Algeria", "Angola",
    "Benin", "Botswana", "Burkina Faso", "Burundi",
    "Cabo Verde", "Cameroon", "Central African Republic", "Chad", "Comoros", "Democratic Republic of the Congo", "Republic of the Congo", "Cote d'Ivoire",
    "Djibouti", "Egypt", "Equatorial Guinea", "Eritrea", "Ethiopia",
    "Gabon", "Gambia", "Ghana", "Guinea", "Guinea-Bissau",
    "Kenya",
    "Lesotho", "Liberia", "Libya",
    "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique",
    "Namibia", "Niger","Nigeria",
    "Rwanda",
    "Sao Tome and Principe", "Senegal", "Seychelles", "Sierra Leone", "Somalia", "South Sudan", "Sudan", "Swaziland",
    "Tanzania", "Togo", "Tunisia",
    "Uganda",
    "Zambia", "Zimbabwe"
  ]

  CRIME_CATEGORIES = [
    "Murder",
    "House Robbery", "Street Robbery", "Parking Robbery", "Robbery",
    "Car Jacking",
    "House burglary",
    "Pickpocket in Restaurant", "Other Pickpocket",
    "Car Theft", "Theft",
    "Assault",
    "Fake Police",
    "Rape", "Sexual Assault",
    "Card Fraud, Skimming, Theft",
    "Others"
  ]

  before_validation do
    if address_city_part && address_country_part
      self.address = "#{address_city_part} #{address_country_part}"
    end
  end

  before_save do
    if occured_at_date_part && occured_at_time_part
      self.occured_at = "#{occured_at_date_part} #{occured_at_time_part}"
    end
  end

  attr_writer :occured_at_date_part, :occured_at_time_part

  def occured_at_date_part
    @occured_at_date_part ||= occured_at&.strftime('%d-%m-%Y')
  end

  def occured_at_time_part
    @occured_at_time_part ||= occured_at&.strftime('%H:%M')
  end

end
