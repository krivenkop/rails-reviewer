require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index with title" do
    @user = users(:one)

    sign_in @user

    get root_path
    assert_select 'section', 'Home'
  end

end
