FactoryGirl.define do
  factory :user do
    subscribe true
    sequence(:openid) { |n| "openid#{n}" }
    sequence(:nickname) { |n| "nickname#{n}" }
    sequence(:email) { |n| "email#{n}@top.io" }
    sequence(:password) { |n| "password#{n}" }
    sex { rand 3 }
    language "zh_CN"
    city "city"
    province "province"
    country "country"
    headimgurl "headimgurl"
    sequence(:subscribe_time) { |n| n }
    sequence(:unionid) { |n| "unionid#{n}" }
    remark "remark"
    groupid 0
  end
end
