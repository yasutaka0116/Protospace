# include ActionDispatch::TestProcess
FactoryGirl.define do

  factory :user do
    created_at   {Faker::Time.forward(23, :morning)}
    updated_at    {Faker::Time.forward(23, :morning)}
    works           {Faker::Company.name}
    member         {Faker::Team.creature}
    profile        {Faker::Lorem.word}
    name           {Faker::Name.name}
    avatar          { fixture_file_upload("#{::Rails.root}/spec/fixtures/img/samole.png", 'image/png')}
    password       {Faker::Internet.password(8)}
    password  = password
    password_confirmation = password
    email          {Faker::Internet.email}

  end
end
