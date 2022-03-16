class CategoriesController < ApplicationController
  def index
    @author = current_user
    @categories = Category.all
  end

  def new
      @category = Category.new
  end

  def create
    @category = Category.new
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_path, notice: 'Category was created successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def category_params
    params.require(:food).permit(:name, :icon)
  end
end
