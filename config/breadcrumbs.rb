crumb :root do
  link "Home", root_path
end

crumb :notes do
  link "Crime Notes", notes_path
end

crumb :note do |note|
  link "#{note.crime_category} at #{note.address}", note
  parent :notes
end

crumb :about do
  link "About", about_path
end

crumb :new do
  link "Create New Report", new_note_path
end
