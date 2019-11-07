FactoryBot.define do
  factory :user do
    email { "MyString" }
    first_name { "MyText" }
    last_name { "MyText" }
  end

  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
