require 'test_helper'

class EditEmailControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get edit_email_edit_url
    assert_response :success
  end

end
