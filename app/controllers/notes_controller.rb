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
      marker.infowindow address.situation
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
end
