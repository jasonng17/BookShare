require 'test_helper'

class UsersControllerTest < ActionController::TestCase

    setup do
      @user = users(:one)

      @user_attributes = {
          department: "HCI",
          contact:    "4125557777",
          password:   "private",
          password_confirmation: "private"
      }

    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:user)  #check that a user variable is being assigned
    end

    #assert_response checks that the get request is successful
    test "should show user" do
      get :show, :id => @user.id
      assert_response :success
    end


    test "should get new" do
      get :new
      assert_response :success
    end

    test "should edit user" do
      get :edit, :id => @user.id
      assert_response :success
    end

    #assert_difference is used to
    #Test the difference between the return value of User.count as a result of what is evaluated in the block

    test "should create user" do
      assert_difference('User.count', difference = 1) do
       post :create, :user => @user_attributes
       end
      assert_redirected_to users_path
      assert_equal 'Thank you for signing up.', flash[:notice]
      end

    test "should update user" do
      assert_no_difference('User.count')do
      put :update, :id => @user.id, :user => @user_attributes
        end
      assert_redirected_to user_path
      assert_equal 'User was successfully updated.', flash[:notice]
      end

    test "should destroy user" do
      assert_difference('User.count', difference = -1) do
      delete :destroy, :id => @user.id
      end
    assert_redirected_to users_path
    end



end
