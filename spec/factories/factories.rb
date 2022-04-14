FactoryBot.define do
    factory :admin do
      sequence(:email) { |n| "test#{n}@uccs.edu"}
      password {"password"}

    end
  
  end