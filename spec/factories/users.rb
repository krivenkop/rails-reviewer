FactoryBot.define do
  factory :user do
    email { "test@gmail.com" }
    password { "12345678" }
    first_name { "Alex" }
    last_name { "Jobs" }
    username { "alex_jobs" }
  end

  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
