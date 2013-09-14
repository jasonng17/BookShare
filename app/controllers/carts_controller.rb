class CartsController < ApplicationController


  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @cart = current_cart  #load the current cart based on session[:cart_id]
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to catalog_index_path, notice: 'Your cart is empty'}
      format.json { head :no_content }
    end
  end

  private

    def cart_params
      params[:cart]
    end
end
