require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }  # usa a factory para criar um usuário "buildado"

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
