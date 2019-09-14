require 'test_helper'

class EditPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get edit_password_edit_url
    assert_response :success
  end

end
