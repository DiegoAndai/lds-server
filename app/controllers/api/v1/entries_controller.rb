class Api::V1::EntriesController < Api::V1::BaseController
  def index
    respond_with Entry.all
  end

  def show
    respond_with entry
  end

  def create
    respond_with Entry.create!(entry_params)
  end

  def update
    respond_with entry.update!(entry_params)
  end

  def destroy
    respond_with entry.destroy!
  end

  private

  def entry
    @entry ||= Entry.find_by!(id: params[:id])
  end

  def entry_params
    params.require(:entry).permit(
      :concept,
      :video_data
    )
  end
end
