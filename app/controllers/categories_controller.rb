class CategoriesController < ApplicationController
  def index
    @author = current_user
    @categories = Category.all
    @total_amount = @author.items.includes(:category).map(&:amount).sum if user_signed_in?
  end

  def new
    @category = Category.new
  end

  # GET /category/1
  def show
    @category = Category.find(params[:id])
    @items = @category.items.order('created_at DESC')
    @total_amount = @items.map(&:amount).sum
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'category was successfully destroyed.' }
    end
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

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
