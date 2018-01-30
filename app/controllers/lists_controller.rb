class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  # GET /LISTS
  def index
    @lists = List.all

    render json: @lists.to_json(include: :tasks)
  end

  # GET /categories/1
  def show
    render json: @list.to_json(include: :tasks)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:task).permit(:name, :task)
    end
end
