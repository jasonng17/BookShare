require 'test_helper'

#ActionController is a subclass of Test::Unit::TestCase => i.e. based on the Test::Unit framework

class BooksControllerTest < ActionController::TestCase

  setup do
    @user = users(:one)
    @book = books(:one)

    @book_attributes = {
        title:  "Ruby on Rails",
        author: "Sam Ruby",
        user: "one"
    }
  end

  test "should get index" do
    get :index, :user_id => @user.id
    assert_response :success
    assert_not_nil assigns(:book)
  end

  #assert_response checks that the get request is successful
  test "should show book" do
    get :show, :user_id => @book.user_id, :id => @book.id
    assert_response :success
  end


  test "should get new" do
    get :new, :user_id => @user.id
    assert_response :success
  end

  test "should edit book" do
    get :edit, :user_id => @user.id, :id => @book.id
    assert_response :success
  end

  #assert_difference is used to
  #Test the difference between the return value of User.count as a result of what is evaluated in the block

  test "should create book" do
    assert_difference('Book.count', difference = 1) do
      post :create, :user_id => @book.user_id, :id => @book.id, :book => @book_attributes
    end
    assert_redirected_to user_book_path(assigns(:user_id),assigns(:id))
    assert_equal 'Book was successfully created.', flash[:notice]
  end

  test "should update book" do
    assert_no_difference('Book.count')do
      put :update, :user_id => @book.user_id, :id =>@book.id , :book => @book_attributes
    end
    assert_redirected_to user_book_path(assigns(:user_id),assigns(:id))
    assert_equal 'Book was successfully updated.', flash[:notice]
  end

  test "should destroy book" do
    assert_difference('Book.count', difference = -1) do
      delete :destroy, :id => @book.id, :user_id => @book.user_id
    end
    assert_redirected_to user_book_path
  end


end
