class AdvisesController < ApplicationController
  def new
    render template: "notes/show"
  end

  def create
    @advise = Advise.new(advise_params)
    @note = Note.find(params[:note_id])
    @advise.note = @note
    if @advise.save
      redirect_to note_path(@note), notice: 'thank you for your advise & comment!'
    else
      redirect_to note_path(@note)
    end
  end

  private def advise_params
    params.require(:advise).permit(:note_id, :user_name, :body)
  end

end
