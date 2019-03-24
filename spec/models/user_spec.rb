require 'rails_helper'

#RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe User do
    context "when user is present" do
      let(:user) {User.create!(email: "test@gmail.com", password: "password")}

        it "is valid with email and password" do
            expect(User.new(email: "test@gmail.com", password: "password")).to be_valid
        end

        it "is not valid without email" do
            expect(User.new(email: "", password: "password")).to_not be_valid
        end

        it "is not valid without password" do
            expect(User.new(email: "testgmail.com", password: "")).to_not be_valid
        end

    end
end
