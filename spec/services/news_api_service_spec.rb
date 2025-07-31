require 'rails_helper'

RSpec.describe NewsApiService do
  
  let(:query) { 'technology' }

  before do
    stub_request(:get, /newsapi\.org/).to_return(
      status: 200,
      body: {
        status: "ok",
        totalResults: 2,
        articles: [
          {
            title: "Article 1",
            url: "https://example.com/article",
            source: { name: "Article Source" }
          },
          {
            title: "Article 2",
            url: "https://example.com/article2",
            source: { name: "Article Source 2" }
          }
        ]
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  describe '.fetch_all_articles' do
    it 'returns an array of articles' do
      result = described_class.fetch_all_articles(query)

      expect(result).to be_an(Array)
      expect(result.size).to eq(2)
      expect(result.first.title).to eq("Article 1")
    end
  end
end
