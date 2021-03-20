require 'test_helper'

class RubyDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ruby_documents_index_url
    assert_response :success
  end

end
