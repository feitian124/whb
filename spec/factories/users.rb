FactoryGirl.define do
  factory :user do
    subscribe true
    sequence(:openid) { |n| "openid#{n}" }
    sequence(:nickname) { |n| "nickname#{n}" }
    sex { rand 3 }
    language "zh_CN"
    city "city"
    province "province"
    country "country"
    headimgurl "headimgurl"
    subscribe_time { Time.now }
    sequence(:unionid) { |n| "unionid#{n}" }
    remark "remark"
    groupid 0
  end
end
