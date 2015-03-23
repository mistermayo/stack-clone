FactoryGirl.define do
  factory(:user) do
    name('example user')
    email('example@example.com')
    password('secret')
  end
end
