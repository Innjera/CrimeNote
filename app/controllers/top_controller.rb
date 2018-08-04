class TopController < ApplicationController
  def top
    @notes = Note.order(updated_at: :desc).limit(10)
    @countries_count = Note.group(:address_country_part).count
    @notes_all = Note.all
    @hash = Gmaps4rails.build_markers(@notes_all) do |note, marker|
      marker.lat note.latitude
      marker.lng note.longitude
      marker.infowindow render_to_string(partial: "shared/infowindow", locals: { note: note })
    end
  end

  def about
  end
end
