class CategoriesController < ApplicationController
  def index
    @author = current_user
    @categories = Category.all
  end

  def new
      @category = Category.new
  end

   # GET /recipes/1
   def show
    @category = Category.find(params[:id])
    @items = @category.items
    @total_amount = @items.map(&:amount).sum
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was created successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
