require 'rails_helper'
require 'ostruct'

RSpec.describe "ReadLaters", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:article_attributes) do
    {
      title: "Sample Article",
      url: "https://example.com/article",
      name: "Example News",
      query: "example"
    }
  end

  before { sign_in(user) } # Devise helper

  describe "POST /read_laters" do
    context "when the article does not exist yet" do
      it "creates a new article and adds it to read later list" do
        expect {
          post read_laters_path, params: article_attributes
        }.to change(Article, :count).by(1)
         .and change(ReadLater, :count).by(1)

        follow_redirect!
        expect(response.body).to include("Article saved for later!")
      end
    end

    context "when the article already exists" do
      let!(:article) { Article.create(title: article_attributes[:title], url: article_attributes[:url], source_name: article_attributes[:name]) }

      it "does not create duplicate article but adds to read later" do
        expect {
          post read_laters_path, params: article_attributes
        }.to change(Article, :count).by(0)
         .and change(ReadLater, :count).by(1)

        follow_redirect!
        expect(response.body).to include("Article saved for later!")
      end

      it "does not add duplicate read later" do
        user.read_laters.create(article: article)

        expect {
          post read_laters_path, params: article_attributes
        }.to change(ReadLater, :count).by(0)

        follow_redirect!
        expect(response.body).to include("You have already saved this article for later!")
      end
    end
  end

  describe "DELETE /read_laters/:id" do
    let!(:article) { create(:article) }
    let!(:read_later) { user.read_laters.create(article: article) }

    it "removes the read later record" do
      expect {
        delete read_later_path(read_later)
      }.to change(ReadLater, :count).by(-1)

      follow_redirect!
      expect(response.body).to include("Article removed from list")
    end
  end
end
