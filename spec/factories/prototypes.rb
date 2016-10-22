include ActionDispatch::TestProcess


FactoryGirl.define do
  factory :comment do
  end
  factory :like do
  end
  factory :prototype do
    id          "2"
    user_id     "3"
    name        {Faker::Name.title}
    catchcopy    {Faker::Lorem.word}
    content     {Faker::Lorem.sentence}
    created_at   {Faker::Time.forward(23, :morning)}
    updated_at   {Faker::Time.forward(23, :morning)}
    likes_count  {Faker::Number.between(1,10)}


   trait :with_comment do
    after(:build) do |prototype|
      prototype.comments << build(:comment, comment: "すばらしい", prototype_id: "2" )
    end

    end
    trait :with_like  do
      after(:build) do |prototype|
        prototype.likes << build(:like, id: "1", prototype_id: "2")
      end
    end


end
end


