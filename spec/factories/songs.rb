FactoryGirl.define do
  factory :song do
    sequence(:name) { |n| "image#{n}" }
    sequence(:desc) { |n| "desc#{n}" }
    sequence(:src) { |n| "src#{n}" }
    sequence(:singer) { |n| "singer#{n}" }
    sequence(:collection) { |n| "collection#{n}" }
    sequence(:duration) { |n| n }
  end

end
