include ActionDispatch::TestProcess


FactoryGirl.define do

  factory :comment do
    association :prototype
  end

  factory :like do
    association :prototype
  end

  factory :prototype do
    association :user
    name        {Faker::Name.title}
    catchcopy    {Faker::Lorem.word}
    content     {Faker::Lorem.sentence}
    created_at   {Faker::Time.forward(23, :morning)}
    updated_at   {Faker::Time.forward(23, :morning)}
    likes_count  {Faker::Number.between(1,10)}

    # association :user

    trait :with_comment do
      after(:build) do |prototype|
        prototype.comments << build(:comment, comment: "すばらしい" )
    end

    end
    trait :with_like  do
      after(:build) do |prototype|
        prototype.likes << build(:like)
      end
    end

  end

   factory :capturedimage do
    association :prototype, strategy: :build
    image      { fixture_file_upload("#{::Rails.root}/spec/fixtures/img/samole.png", 'image/png')}
    created_at   {Faker::Time.forward(23, :morning)}
    updated_at    {Faker::Time.forward(23, :morning)}


    trait :with_mainimage do
      role     :mainimage
    end

    trait :with_subimage do

      role        :subimage
    end

    trait :with_format_test do
      role         :mainimage
      image      { fixture_file_upload("#{::Rails.root}/spec/fixtures/img/icon_heart.svg", 'image/svg')}
    end

  end


end


