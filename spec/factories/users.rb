# include ActionDispatch::TestProcess
FactoryGirl.define do

  factory :user do
      id        {Faker::Number.between(1,10)}
    created_at   {Faker::Time.forward(23, :morning)}
    updated_at    {Faker::Time.forward(23, :morning)}
    works           {Faker::Company.name}
    member         {Faker::Team.creature}
    profile        {Faker::Lorem.word}
    name           {Faker::Name.name}
    avatar          { fixture_file_upload("#{::Rails.root}/spec/fixtures/img/samole.png", 'image/png')}
    password_confirmation  "00000000"
    password       "00000000"
    sequence :email do |n|          "person#{n}@gmail.com"
    end
  end

end
