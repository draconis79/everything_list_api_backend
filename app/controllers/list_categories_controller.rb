class ListCategoriesController < ApplicationController
  before_action :set_list_category, only: [:show, :update, :destroy]


  # GET / list_categories
  def index
    @list_categories = ListCategory.all
    render json: @list_categories.to_json(include: [:user, :list_item)
  end


  # GET /list_categories/1
  def show
    render json: @list_categories.to_json(include: [:user, :list_item)
  end


  # POST /list_categories
  def create
    @list_category = ListCategory.new(list_category_params)

    if @list_category.save
      render json: @list_category, status: :created, location: @list_category
    else
      render json: @list_category.errors, status: :unprocessable_entity
    end
end


  # PUT /list_categories/1
  def update
    if @list_category.update(list_category_params)
      render json: @list_category
    else
      render json: @list_category.errors, status: :unprocessable_entity
    end
  end


  # DELETE /list_categories/1
  def destroy
    @list_category.destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_category
      @list_category = ListCategory.find(params[:id])
    end

  # USER REQUIREMENT
    def list_category_params
      params.require(:list_category).permit(:user_id, :list_item_id)
    end
end
