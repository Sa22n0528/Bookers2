require 'test_helper'

class BookersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookers_new_url
    assert_response :success
  end

end
