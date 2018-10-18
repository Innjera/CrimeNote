class NotesController < ApplicationController

  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def show
    @note = Note.find(params[:id])
    @advise = Advise.new
    @advise.note = @note
    @hash = Gmaps4rails.build_markers(@note) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def new
    @note = Note.new
    time0 = Time.current.beginning_of_hour
    @note.occured_at = time0.advance(hours: -1)
    @note.embassy = false
    @note.general = false
    @note.profile_age = nil
    @note.profile_sex = nil
    @note.profile_type = nil
    @note.profile_supplement = nil
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to :root, notice: 'thank you! succesfully created the new report.'
    else
      render 'new'
    end
  end

  def country
    @notes = Note.country_find(params[:country])
    @count = (params[:count])
    @country = (params[:country])
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
    render "index"
  end

  private def note_params
    attrs = [
      :crime_category, :address_city_part, :address_country_part, :address,
      :situation, :occured_at_date_part, :occured_at_time_part, :embassy, :source_url, :general,
      :profile_sex, :profile_age, :profile_type, :profile_supplement
    ]
    params[:note].permit(attrs)
  end

  #### 各国個別ページ

  countries = [
    "Algeria"=> "Algeria（アルジェリア）", "Angola"=> "Angola（アンゴラ）",
    "Benin" => "Benin（ベナン）", "Botswana" => "Botswana（ボツワナ）", "BurkinaFaso" =>  "Burkina Faso（ブルキナファソ）", "Burundi" => "Burundi（ブルンジ）",
    "CaboVerde" => "Cabo Verde（カーボベルデ）", "Cameroon" => "Cameroon（カメルーン）", "CentralAfricanRepublic" => "Central African Republic（中央アフリカ）", "Chad" => "Chad（チャド）", "Comoros" => "Comoros（コモロ）",
    "DemocraticRepublicOfTheCongo" => "DR Congo（コンゴ民主共和国）", "RepublicOfTheCongo" => "Republic of the Congo（コンゴ共和国）", "CoteDIvoire" => "Cote d'Ivoire（コートジボワール）",
    "Djibouti" => "Djibouti（ジブチ）", "Egypt" => "Egypt（エジプト）", "EquatorialGuinea" => "Equatorial Guinea（赤道ギニア）", "Eritrea" => "Eritrea（エリトリア）", "eSwatini" => "eSwatini(エスワティニ)", "Ethiopia" => "Ethiopia（エチオピア）",
    "Gabon" => "Gabon（ガボン）", "Gambia" => "Gambia（ガンビア）", "Ghana" => "Ghana（ガーナ）", "Guinea" => "Guinea（ギニア）", "GuineaBissau" => "Guinea Bissau（ギニアビザウ）",
    "Kenya" => "Kenya（ケニア）",
    "Lesotho" => "Lesotho（レソト）", "Liberia" => "Liberia（リベリア）", "Libya" => "Libya（リビヤ）",
    "Madagascar" => "Madagascar（マダガスカル）", "Malawi" => "Malawi（マラウィ）", "Mali" => "Mali（マリ）", "Mauritania" => "Mauritania（モーリタニア）", "Mauritius" => "Mauritius（モーリシャス）", "Morocco" => "Morocco（モロッコ）", "Mozambique" => "Mozambique（モザンビーク）",
    "Namibia" => "Namibia（ナミビア）", "Niger" => "Niger（ニジェール）", "Nigeria" => "Nigeria（ナイジェリア）",
    "Rwanda" => "Rwanda（ルワンダ）",
    "SaoTomeAndPrincipe" => "Sao Tome and Principe（サントメプリンシペ）", "Senegal" => "Senegal（セネガル）", "Seychelles" => "Seychelles（セイシェル）", "SierraLeone" => "Sierra Leone（シエラレオネ）", "Somalia" =>"Somalia（ソマリア）", "Somaliland" =>  "Somaliland（ソマリランド）",
    "SouthAfrica" => "South Africa（南アフリカ）", "SouthSudan" => "South Sudan（南スーダン）", "Sudan" => "Sudan（スーダン）", "Swaziland" => "Swaziland（スワジランド）",
    "Tanzania" => "Tanzania（タンザニア）", "Togo" => "Togo（トーゴ）", "Tunisia" => "Tunisia（チュニジア）",
    "Uganda" => "Uganda（ウガンダ）",
    "Zambia" => "Zambia（ザンビア）", "Zimbabwe" => "Zimbabwe（ジンバブエ）"
  ]

  def SouthAfrica
    @notes = Note.where(address_country_part: "South Africa（南アフリカ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Angola
    @notes = Note.where(address_country_part: "Angola（アンゴラ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Botswana
    @notes = Note.where(address_country_part: "Botswana（ボツワナ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def eSwatini
    @notes = Note.where(address_country_part: "eSwatini（エスティワニ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Lesotho
    @notes = Note.where(address_country_part: "Lesotho（レソト）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Madagascar
    @notes = Note.where(address_country_part: "Madagascar（マダガスカル）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Malawi
    @notes = Note.where(address_country_part: "Malawi（マラウィ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Mauritius
    @notes = Note.where(address_country_part: "Mauritius（モーリシャス）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Mozambique
    @notes = Note.where(address_country_part: "Mozambique（モザンビーク）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Namibia
    @notes = Note.where(address_country_part: "Namibia（ナミビア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Seychelles
    @notes = Note.where(address_country_part: "Seychelles（セイシェル）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Zambia
    @notes = Note.where(address_country_part: "Zambia（ザンビア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Zimbabwe
    @notes = Note.where(address_country_part: "Zimbabwe（ジンバブエ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Comoros
    @notes = Note.where(address_country_part: "Comoros（コモロ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Kenya
    @notes = Note.where(address_country_part: "Kenya（ケニア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Djibouti
    @notes = Note.where(address_country_part: "Djibouti（ジブチ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Eritrea
    @notes = Note.where(address_country_part: "Eritrea（エリトリア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Ethiopia
    @notes = Note.where(address_country_part: "Ethiopia（エチオピア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Rwanda
    @notes = Note.where(address_country_part: "Rwanda（ルワンダ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Somalia
    @notes = Note.where(address_country_part: "Somalia（ソマリア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Somaliland
    @notes = Note.where(address_country_part: "Somaliland（ソマリランド）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Tanzania
    @notes = Note.where(address_country_part: "Tanzania（タンザニア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Togo
    @notes = Note.where(address_country_part: "Togo（トーゴ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Uganda
    @notes = Note.where(address_country_part: "Uganda（ウガンダ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Benin
    @notes = Note.where(address_country_part: "Benin（ベナン）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def BurkinaFaso
    @notes = Note.where(address_country_part: "Burkina Faso（ブルキナファソ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Burundi
    @notes = Note.where(address_country_part: "Burundi（ブルンジ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def CaboVerde
    @notes = Note.where(address_country_part: "Cabo Verde（カーボベルデ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def CaboVerde
    @notes = Note.where(address_country_part: "Cabo Verde（カーボベルデ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def CoteDIvoire
    @notes = Note.where(address_country_part: "Cote d'Ivoire（コートジボワール）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Gambia
    @notes = Note.where(address_country_part: "Gambia（ガンビア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Ghana
    @notes = Note.where(address_country_part: "Ghana（ガーナ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Guinea
    @notes = Note.where(address_country_part: "Guinea（ギニア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def GuineaBissau
    @notes = Note.where(address_country_part: "Guinea Bissau（ギニアビザウ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Liberia
    @notes = Note.where(address_country_part: "Liberia（リベリア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Mali
    @notes = Note.where(address_country_part: "Mali（マリ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Mauritania
    @notes = Note.where(address_country_part: "Mauritania（モーリタニア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Niger
    @notes = Note.where(address_country_part: "Niger（ニジェール）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Nigeria
    @notes = Note.where(address_country_part: "Nigeria（ナイジェリア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Senegal
    @notes = Note.where(address_country_part: "Senegal（セネガル）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def SierraLeone
    @notes = Note.where(address_country_part: "Sierra Leone（シエラレオネ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Cameroon
    @notes = Note.where(address_country_part: "Cameroon（カメルーン）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def CentralAfricanRepublic
    @notes = Note.where(address_country_part: "Central African Republic（中央アフリカ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Chad
    @notes = Note.where(address_country_part: "Chad（チャド）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def DemocraticRepublicOfTheCongo
    @notes = Note.where(address_country_part: "DR Congo（コンゴ民主共和国）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def RepublicOfTheCongo
    @notes = Note.where(address_country_part: "Republic of the Congo（コンゴ共和国）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def EquatorialGuinea
    @notes = Note.where(address_country_part: "Equatorial Guinea（赤道ギニア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Gabon
    @notes = Note.where(address_country_part: "Gabon（ガボン）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def SaoTomeAndPrincipe
    @notes = Note.where(address_country_part: "Sao Tome and Principe（サントメプリンシペ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def SouthSudan
    @notes = Note.where(address_country_part: "South Sudan（南スーダン）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Algeria
    @notes = Note.where(address_country_part: "Algeria（アルジェリア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Egypt
    @notes = Note.where(address_country_part: "Egypt（エジプト）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Sudan
    @notes = Note.where(address_country_part: "Sudan（スーダン）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Sudan
    @notes = Note.where(address_country_part: "Sudan（スーダン）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Tunisia
    @notes = Note.where(address_country_part: "Tunisia（チュニジア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Tunisia
    @notes = Note.where(address_country_part: "Tunisia（チュニジア）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Morocco
    @notes = Note.where(address_country_part: "Morocco（モロッコ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Morocco
    @notes = Note.where(address_country_part: "Morocco（モロッコ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end

  def Libya
    @notes = Note.where(address_country_part: "Libya（リビヤ）")
    @hash = Gmaps4rails.build_markers(@notes) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: address })
    end
  end


end
