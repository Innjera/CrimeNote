crumb :root do
  link "Home", root_path
end

crumb :notes do
  link "過去の治安・犯罪情報を全て見る", notes_path
end

crumb :note do |note|
  link "#{note.address}で発生した#{note.crime_category}", note
  parent :notes
end

crumb :about do
  link "ミッション", about_path
end

crumb :new do
  link "治安・犯罪情報を作成する", new_note_path
end

crumb :SouthAfrica_notes do |country|
  link country, :SouthAfrica_notes
  parent :root
end

crumb :Angola_notes do |country|
  link country, :Angola_notes
  parent :root
end

crumb :Botswana_notes do |country|
  link country, :Botswana_notes
  parent :root
end

crumb :eSwatini_notes do |country|
  link country, :eSwatini_notes
  parent :root
end

crumb :Lesotho_notes do |country|
  link country, :Lesotho_notes
  parent :root
end

crumb :Madagascar_notes do |country|
  link country, :Madagascar_notes
  parent :root
end

crumb :Malawi_notes do |country|
  link country, :Malawi_notes
  parent :root
end

crumb :Mauritius_notes do |country|
  link country, :Mauritius_notes
  parent :root
end

crumb :Mozambique_notes do |country|
  link country, :Mozambique_notes
  parent :root
end

crumb :Namibia_notes do |country|
  link country, :Namibia_notes
  parent :root
end

crumb :Seychelles_notes do |country|
  link country, :Seychelles_notes
  parent :root
end

crumb :Zambia_notes do |country|
  link country, :Zambia_notes
  parent :root
end

crumb :Zimbabwe_notes do |country|
  link country, :Zimbabwe_notes
  parent :root
end

crumb :Comoros_notes do |country|
  link country, :Comoros_notes
  parent :root
end

crumb :Kenya_notes do |country|
  link country, :Kenya_notes
  parent :root
end

crumb :Djibouti_notes do |country|
  link country, :Djibouti_notes
  parent :root
end

crumb :Eritrea_notes do |country|
  link country, :Eritrea_notes
  parent :root
end

crumb :Ethiopia_notes do |country|
  link country, :Ethiopia_notes
  parent :root
end

crumb :Rwanda_notes do |country|
  link country, :Rwanda_notes
  parent :root
end

crumb :Somalia_notes do |country|
  link country, :Somalia_notes
  parent :root
end

crumb :Somaliland_notes do |country|
  link country, :Somaliland_notes
  parent :root
end

crumb :Tanzania_notes do |country|
  link country, :Tanzania_notes
  parent :root
end

crumb :Togo_notes do |country|
  link country, :Togo_notes
  parent :root
end

crumb :Uganda_notes do |country|
  link country, :Uganda_notes
  parent :root
end

crumb :Benin_notes do |country|
  link country, :Benin_notes
  parent :root
end

crumb :BurkinaFaso_notes do |country|
  link country, :BurkinaFaso_notes
  parent :root
end

crumb :Burundi_notes do |country|
  link country, :Burundi_notes
  parent :root
end

crumb :CaboVerde_notes do |country|
  link country, :CaboVerde_notes
  parent :root
end

crumb :CoteDIvoire_notes do |country|
  link country, :CoteDIvoire_notes
  parent :root
end

crumb :Gambia_notes do |country|
  link country, :Gambia_notes
  parent :root
end

crumb :Ghana_notes do |country|
  link country, :Ghana_notes
  parent :root
end

crumb :Guinea_notes do |country|
  link country, :Guinea_notes
  parent :root
end

crumb :GuineaBissau_notes do |country|
  link country, :GuineaBissau_notes
  parent :root
end

crumb :Liberia_notes do |country|
  link country, :Liberia_notes
  parent :root
end

crumb :Mali_notes do |country|
  link country, :Mali_notes
  parent :root
end

crumb :Mauritania_notes do |country|
  link country, :Mauritania_notes
  parent :root
end

crumb :Niger_notes do |country|
  link country, :Niger_notes
  parent :root
end

crumb :Nigeria_notes do |country|
  link country, :Nigeria_notes
  parent :root
end

crumb :Senegal_notes do |country|
  link country, :Senegal_notes
  parent :root
end

crumb :SierraLeone_notes do |country|
  link country, :SierraLeone_notes
  parent :root
end

crumb :Cameroon_notes do |country|
  link country, :Cameroon_notes
  parent :root
end

crumb :CentralAfricanRepublic_notes do |country|
  link country, :CentralAfricanRepublic_notes
  parent :root
end

crumb :Chad_notes do |country|
  link country, :Chad_notes
  parent :root
end

crumb :DemocraticRepublicOfTheCongo_notes do |country|
  link country, :DemocraticRepublicOfTheCongo_notes
  parent :root
end

crumb :RepublicOfTheCongo_notes do |country|
  link country, :RepublicOfTheCongo_notes
  parent :root
end

crumb :EquatorialGuinea_notes do |country|
  link country, :EquatorialGuinea_notes
  parent :root
end

crumb :Gabon_notes do |country|
  link country, :Gabon_notes
  parent :root
end

crumb :SaoTomeAndPrincipe_notes do |country|
  link country, :SaoTomeAndPrincipe_notes
  parent :root
end

crumb :SouthSudan_notes do |country|
  link country, :SouthSudan_notes
  parent :root
end

crumb :Algeria_notes do |country|
  link country, :Algeria_notes
  parent :root
end

crumb :Egypt_notes do |country|
  link country, :Egypt_notes
  parent :root
end

crumb :Sudan_notes do |country|
  link country, :Sudan_notes
  parent :root
end

crumb :Tunisia_notes do |country|
  link country, :Tunisia_notes
  parent :root
end

crumb :Morocco_notes do |country|
  link country, :Morocco_notes
  parent :root
end

crumb :Libya_notes do |country|
  link country, :Libya_notes
  parent :root
end
