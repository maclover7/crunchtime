class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    # @todo_items = TodoItem.all
    @user = current_user#@user = User.find(params[:id])
    @todo_items = @user.todo_items
  end

  def show
  end

  def new
    @todo_item = current_user.notes.build
  end

  def edit
  end

  def create
    @todo_item = current_user.notes.build(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        redirect_to @todo_item, notice: 'Todo item was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        redirect_to @todo_item, notice: 'Todo item was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @todo_item.destroy
    respond_to do |format|
      redirect_to todo_items_url, notice: 'Todo item was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def correct_user
      @todo_item = current_user.todo_item.find_by(id: params[:id])
      redirect_to root_path, notice: "Not authorized to edit this todo item" if @todo_item.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:body, :course_id)
    end
end
