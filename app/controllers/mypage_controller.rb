class MypageController < ApplicationController
  before_action :login_required

  def show
    @purchase_historys = OrderItem.eager_load(:product).where(user_id: current_user.id).order(order_id: :desc )
    @order = Order.eager_load(:order_items => :product).where(user_id: current_user.id).order(created_at: :desc)
  end

end
