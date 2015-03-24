FactoryGirl.define do
  factory(:user) do
    name("siohofh")
    email("ian@animorphs.gov")
    password("leet_dewd")
    password_hash("leet_dewd")
    password_salt("secret")
  end
end
