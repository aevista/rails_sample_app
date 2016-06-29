require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal base_title,         base_title 
    assert_equal base_title("Help"),  "Help | Ruby on Rails Sample App"
  end
end