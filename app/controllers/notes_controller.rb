class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        redirect_to @note, notice: 'Note was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        redirect_to @note, notice: 'Note was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      redirect_to notes_url, notice: 'Note was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
