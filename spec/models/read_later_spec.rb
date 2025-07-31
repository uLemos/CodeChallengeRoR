require 'rails_helper'

RSpec.describe ReadLater, type: :model do
  let(:user) { create(:user) }
  let(:article) { create(:article) }

  subject { described_class.new(user: user, article: article) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without an article" do
    subject.article = nil
    expect(subject).not_to be_valid
  end

  it "does not allow duplicate read_laters for the same user and article" do
    subject.save
    duplicate = described_class.new(user: user, article: article)
    expect(duplicate).not_to be_valid
  end
end
