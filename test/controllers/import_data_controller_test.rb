require 'test_helper'

class ImportDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get import_data_index_url
    assert_response :success
  end

end
