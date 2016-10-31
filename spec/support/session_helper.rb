require "pry-rails"

module Features
  module SessionHelpers
    def sign_up_with
      fill_in "Username", with: 'taro'
      fill_in "E-mail", with: 'taaa@gmail.com'
      fill_in "Password", with: '00000000'
      fill_in "passwordconfirmation", with:'00000000'
      click_on 'Save'
    end

  def post_prototype
    visit current_path
    fill_in "Title", with: "testteest"
    fill_in "Catch Copy", with: "test"
    fill_in "Concept", with: "asdffff"
    attach_file "prototype_capturedimages_attributes_0_image", "#{Rails.root}/spec/fixtures/img/samole.png"
    attach_file "prototype_capturedimages_attributes_1_image", "#{Rails.root}/spec/fixtures/img/samole.png"
    attach_file "prototype_capturedimages_attributes_2_image","#{Rails.root}/spec/fixtures/img/samole.png"
    find('#add_new_form').click
    attach_file "prototype_capturedimages_attributes_3_image", "#{Rails.root}/spec/fixtures/img/samole.png"
    click_on "publish"
  end
end
end
