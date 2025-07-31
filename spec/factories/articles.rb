FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Example Article #{n}" }
    sequence(:url) { |n| "https://example.com/article#{n}" }
    source_name { "Example Source" }
  end
end
