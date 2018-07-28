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
      marker.infowindow address.situation
    end
  end

  def new
    @note = Note.new
    time0 = Time.current.beginning_of_hour
    @note.occured_at = time0.advance(hours: -1)
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to :root, notice: 'thank you! succesfully created the new report.'
    else
      render 'new'
    end
  end

  private def note_params
    params[:note].permit(:crime_category, :address_city_part, :address_country_part, :address, :situation, :occured_at_date_part, :occured_at_time_part, :embassy, :source_url)
  end
end
