module Matchers
  def assert_current_path(expected_path)
    assert_equal current_path, expected_path
  end

  def assert_text(text)
    page.assert_text text
  end

  def assert_button(locator)
    assert page.has_button?(locator)
  end
end
