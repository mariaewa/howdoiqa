class Test2 < SitePrism::Page
  set_url '/pages/test_2'

  element :textfield, "#example_textfield"
  element :checkbox, "#example_checkbox"
  element :select, "#example_select"
  element :radio_button, "#example_radiobutton_opt_2"
end
