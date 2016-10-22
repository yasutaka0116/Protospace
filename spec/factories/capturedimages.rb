include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :capturedimage do
    prototype_id   "2"
    image      { fixture_file_upload("#{::Rails.root}/spec/fixtures/img/samole.png", 'image/png')}
    created_at   {Faker::Time.forward(23, :morning)}
    updated_at    {Faker::Time.forward(23, :morning)}
    association :prototype
    trait :with_mainimage do
      id        {Faker::Number.between(1,10)}
      role     :mainimage
      end
    trait :with_subimage do
      id        {Faker::Number.between(1.10)}
      role        :subimage
      end
    trait :with_format_test do
      id        {Faker::Number.between(1.10)}
      role         :mainimage
      image      { fixture_file_upload("#{::Rails.root}/spec/fixtures/img/icon_heart.svg", 'image/svg')}
end



  end

end
