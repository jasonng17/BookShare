require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

  test "user able to add item to cart" do

    codebook = books(:one)

    get "/catalog"
    assert_response :success



    xml_http_request :post, '/line_items', id: codebook.id
    assert_response :success

    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal codebook, cart.line_items[0].book

  end



end
