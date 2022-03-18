class ItemsController < ApplicationController
  def new
    @item = Item.new
    @category = Category.find(params[:category_id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to category_path(@item.category_id), notice: 'item was successfully destroyed.' }
    end
  end

  def create
    @item = current_user.items.new(item_params)
    @category = Category.find(params[:category_id])
    @item.user_id = current_user.id
    @item.category_id = @category.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to category_path(@category), notice: 'items was created successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
