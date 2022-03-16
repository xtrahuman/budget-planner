class ItemsController < ApplicationController
def new
    @item = Item.new
end

def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.category_id = params[:category_id]

    respond_to do |format|
        if @item.save
          format.html { redirect_to category_items_path(category), notice: 'Category was created successfully.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
end

def item_params
    params.require(:item).permit(:name,:amount)
end
end
