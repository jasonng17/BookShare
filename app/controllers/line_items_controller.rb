class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_item = LineItem.all
  end
 def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    @cart = current_cart
    book = Book.find(params[:id])
    @line_item = @cart.line_items.new
    @line_item.book = book

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to catalog_index_path, notice: 'Line item was successfully created.' }
        format.js   #send javascript in respond to AJAX request based on the template
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

   def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }
    end
  end

  private
     def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:book, :cart_id)
    end
end
