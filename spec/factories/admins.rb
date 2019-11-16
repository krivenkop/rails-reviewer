FactoryBot.define do
  factory :admin do
    email { "admin@gmail.com" }
    password { "12345678" }
    first_name { "Steve" }
    last_name { "Voznyak" }
    username { "admin" }
  end

  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
