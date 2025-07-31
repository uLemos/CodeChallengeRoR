require 'rails_helper'
require 'ostruct'

RSpec.describe "NewsController", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in(user)
  end

  describe "GET /news/search" do
    it "returns success and paginated articles" do
      allow(NewsApiService).to receive(:fetch_all_articles).and_return([
        OpenStruct.new(title: "Test Article", url: "http://example.com", source_name: "Test Source")
      ])

      get search_news_index_path(query: "technology")

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Test Article")
    end

    it "uses 'latest' when query param is missing" do
      expect(NewsApiService).to receive(:fetch_all_articles).with("latest").and_return([])

      get search_news_index_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /news/read_later" do
    it "returns success and lists user's saved articles" do
      article = create(:article)
      read_later = create(:read_later, user: user, article: article)

      get read_later_news_index_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include(article.title)
    end
  end
end
