class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
     @cart_items = current_cart.cart_items
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(product_id: params[:product_id],user_id: current_user.id)
    end

    @cart_item.quantity = 0 if @cart_item.quantity.blank?
    @cart_item.quantity += 1
    @cart_item.save!
    redirect_to current_cart
  end

  def delete_item
    if @cart_item.quantity == 1
      @cart_item.destroy
    else
      @cart_item.quantity -= 1
      @cart_item.save
    end
      redirect_to current_cart
  end

  private

   def setup_cart_item!
     @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
   end

end
