require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) {
    Category.create(name: "testCategory")
  }
  subject {
    category.products.create(
      name: "test_product",
      description: "a_test_product",
      image: "test_image",
      price_cents: 10000,
      quantity: 10,
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).include "Name cannot be empty"
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price cannot be empty"


  end
end