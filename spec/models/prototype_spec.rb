require 'rails_helper'
require 'pry-rails'
describe Prototype do


  describe "associations" do

    it "deletes the comments when prototype is deleted" do
      prototype = build(:prototype, :with_comment)
      prototype.destroy
      expect(prototype.comments.empty?).to eq true
    end

    it "dletes the likes when protootype is deleted"  do
      prototype = build(:prototype, :with_like)
      prototype.destroy
      expect(prototype.likes.empty?).to eq true
    end
  end
  describe "validations" do

    it "has a valid factory" do
      prototype = build(:prototype)
      expect(prototype).to be_valid
    end

    it "is missing a title" do
      prototype = build(:prototype, name: "")
      prototype.valid?
      expect(prototype.errors[:name]).to include("can't be blank")
    end

    it "is missing a catchcopy" do
      prototype = build(:prototype, catchcopy:"")
      prototype.valid?
      expect(prototype.errors[:catchcopy]).to include("can't be blank")
    end

    it "is missing a concept" do
      prototype = build(:prototype, content:"")
      prototype.valid?
      expect(prototype.errors[:content]).to include("can't be blank")
    end
  end
  describe "like_usesr(user_id)" do
    context "when liked by a user" do
    it "retutns true" do
      user = create(:user)
      prototype = create(:prototype)
      like = create(:like, user_id: user.id, prototype_id: prototype.id)
      expect(prototype.like_user(user.id)).to be_truthy
    end
  end
    context "when not liked by user" do
      it "returns nill" do
        user = create(:user)
        another_user = create(:user, id: "5")
        prototype = create(:prototype)
        like = create(:like, user_id: user.id, prototype_id: prototype.id)
        expect(prototype.like_user(another_user.id)).to be_nil
      end
    end
  end


end

