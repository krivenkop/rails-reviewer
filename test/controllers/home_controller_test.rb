require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index with title" do
    get home_index_url
    assert_select 'h1', 'create account'
  end

end
