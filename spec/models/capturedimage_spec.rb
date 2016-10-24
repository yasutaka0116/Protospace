require "rails_helper"

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
