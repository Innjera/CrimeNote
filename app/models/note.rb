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
#  general              :boolean          default(FALSE), not null
#  profile_sex          :string
#  profile_age          :string
#  profile_type         :string
#  profile_supplement   :text
#

class Note < ApplicationRecord
  has_many :advises, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :address_city_part, presence: true, length: {minimum: 2, maximum: 100, allow_blank: true}
  validates :situation, presence: true, length: {minimum: 2, maximum: 4000, allow_blank: true}

  COUNTRIES_NAMES = [
    "South Africa（南アフリカ）",
    "Algeria（アルジェリア）", "Angola（アンゴラ）",
    "Benin（ベナン）", "Botswana（ボツワナ）", "Burkina Faso（ブルキナファソ）", "Burundi（ブルンジ）",
    "Cabo Verde（カーボベルデ）", "Cameroon（カメルーン）", "Central African Republic（中央アフリカ）", "Chad（チャド）", "Comoros（コモロ）", "DR Congo（コンゴ民主共和国）", "Republic of the Congo（コンゴ共和国）", "Cote d'Ivoire（コートジボワール）",
    "Djibouti（ジブチ）", "Egypt（エジプト）", "Equatorial Guinea（赤道ギニア）", "Eritrea（エリトリア）", "eSwatini(エスワティニ)","Ethiopia（エチオピア）",
    "Gabon（ガボン）", "Gambia（ガンビア）", "Ghana（ガーナ）", "Guinea（ギニア）", "Guinea Bissau（ギニアビザウ）",
    "Kenya（ケニア）",
    "Lesotho（レソト）", "Liberia（リベリア）", "Libya（リビヤ）",
    "Madagascar（マダガスカル）", "Malawi（マラウィ）", "Mali（マリ）", "Mauritania（モーリタニア）", "Mauritius（モーリシャス）", "Morocco（モロッコ）", "Mozambique（モザンビーク）",
    "Namibia（ナミビア）", "Niger（ニジェール）","Nigeria（ナイジェリア）",
    "Rwanda（ルワンダ）",
    "Sao Tome and Principe（サントメプリンシペ）", "Senegal（セネガル）", "Seychelles（セイシェル）", "Sierra Leone（シエラレオネ）", "Somalia（ソマリア）", "Somaliland（ソマリランド）",  "South Sudan（南スーダン）", "Sudan（スーダン）",
    "Tanzania（タンザニア）", "Togo（トーゴ）", "Tunisia（チュニジア）",
    "Uganda（ウガンダ）",
    "Zambia（ザンビア）", "Zimbabwe（ジンバブエ）"
  ]

  CRIME_CATEGORIES = [
    "住宅侵入強盗（House Robbery）", "路上強盗（Street Robbery）", "駐車場での強盗（Parking Robbery）", "強盗（Robbery）",
    "誘拐（Abduction）",
    "カージャック（Car Jacking）",
    "住宅侵入（House burglary）",
    "レストランでの盗難（theft in Restaurant）", "スリ（Other Pickpocket）",
    "車上荒らし（Breaking ito car）", "車両盗難（Car Theft）", "窃盗（Theft）",
    "暴行（Assault）",
    "ニセ警官（Fake Police）",
    "クレジットカード盗難、スキミング",
    "贈賄要求（bribe）",
    "レイプ（Rape）", "性的暴行（Sexual Assault）",
    "殺人（Murder）",
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

  def self.country_find(country)
    rel = order("updated_at")
    if country.present?
      rel = rel.where(address_country_part: country)
    end
    rel
  end
end
