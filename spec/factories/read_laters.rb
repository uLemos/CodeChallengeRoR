FactoryBot.define do
  factory :read_later do
    association :user
    association :article
  end
end
