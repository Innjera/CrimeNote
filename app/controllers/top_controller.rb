class TopController < ApplicationController
  def top
    @notes = Note.order(created_at: :desc).limit(4)
    @notes_all = Note.all
    @hash = Gmaps4rails.build_markers(@notes_all) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow address.situation
    end
  end

  def about
  end
end
