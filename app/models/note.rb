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
#  embassy              :boolean          default(FALSE), not null
#  source_url           :text
#

class Note < ApplicationRecord
  has_many :advises, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

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
    "殺人（Murder）",
    "住宅侵入強盗（House Robbery）", "路上強盗（Street Robbery）", "駐車場での強盗（Parking Robbery）", "強盗（Robbery）",
    "カージャック（Car Jacking）",
    "住宅侵入（House burglary）",
    "レストランでのスリ（Pickpocket in Restaurant）", "スリ（Other Pickpocket）",
    "車両盗難（Car Theft）", "窃盗（Theft）",
    "Assault",
    "ニセ警官（Fake Police）",
    "レイプ（Rape）", "性的侮辱（Sexual Assault）",
    "クレジットカード盗難、スキミング",
    "その他"
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
