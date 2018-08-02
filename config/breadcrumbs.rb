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
