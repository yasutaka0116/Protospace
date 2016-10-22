require "rails_helper"
require 'pry-rails'
  # describe Myuploader do
  #       include CarrierWave::Test::Matchers
  #       let(:prototype){double('prototype')}
  #       let(:uploader){Myuploader.new(prototype, :image)}

  #     before do
  #         MyUploader.enable_processing = true
  #         File.open(path_to_file) { |f| uploader.store!(f) }
  #     end

  #     after do
  #        MyUploader.enable_processing = false
  #        uploader.remove!
  #     end

#   it "has the correct format" do
#     expect(uploader).to be_format('png')
#   end
# end
  describe Capturedimage do
    describe "#create" do

      it "has the wrong image format" do
        image = build(:capturedimage, :with_format_test)
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end



      context "with valid attributes" do
        it "has valid factory" do
          image = build(:capturedimage, :with_mainimage)
          expect(image).to be_valid
        end
      end
      context "without image attribute" do
        it "returns error" do
          image = build(:capturedimage, :with_mainimage, image: "")
          image.valid?
          expect(image.errors[:image]).to include("can't be blank")
        end
      end
      context "without role attributes" do
        it "returns error" do
          image = build(:capturedimage, :with_mainimage, role: "")
          image.valid?
          expect(image.errors[:role]).to include("can't be blank")
       end
      end
      end
    end
