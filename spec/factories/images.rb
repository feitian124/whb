FactoryGirl.define do
  factory :image do
    album
    user
    sequence(:name) { |n| "name#{n}" }
    sequence(:src) { |n| "http://localhost:3000/src#{n}" }
    sequence(:alt) { |n| "alt#{n}" }
    sequence(:desc) { |n| "desc#{n}" }
    sequence(:pic_url) { |n| "pic_url#{n}" }
    sequence(:msg_id) { |n| "msg_id_#{n}" }
    sequence(:media_id) { |n| "media_id_#{n}" }
  end
end
