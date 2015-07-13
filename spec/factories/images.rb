FactoryGirl.define do
  factory :image do
    album
    sequence(:name) { |n| "image#{n}" }
    sequence(:src) { |n| "src#{n}" }
    sequence(:alt) { |n| "alt#{n}" }
    sequence(:desc) { |n| "desc#{n}" }
    sequence(:pic_url) { |n| "http://placehold.it/640X1008/#{(n%10).to_s*6}/000000" }
    sequence(:msg_id) { |n| "msg_id_#{n}" }
    sequence(:media_id) { |n| "media_id_#{n}" }
  end
end
