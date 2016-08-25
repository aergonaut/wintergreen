FactoryGirl.define do
  factory :identity do
    user ""
    provider "MyString"
    uid "MyString"
    encrypted_access_key "MyString"
    encrypted_access_key_iv "MyString"
  end
end
