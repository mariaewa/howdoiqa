class Test5 < SitePrism::Page
  set_url '/pages/test_5'

  element :user_email, '#user_email'
  element :user_password, '#user_password'
  element :checkbox, '#user_remember_me'
end
