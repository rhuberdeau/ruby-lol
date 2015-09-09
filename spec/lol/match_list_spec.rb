require "spec_helper"
require "lol"

include Lol

describe MatchList do
  it "inherits from Request" do
    expect(MatchList.ancestors[1]).to eq(Request)
  end

  let(:request) { MatchList.new(ENV.fetch("RIOT_API_KEY"), "na") }

  describe "#get" do
    it 'returns an array of hashes' do
      VCR.use_cassette("matchlist") do 
        matches = request.get(20833616, {rankedQueues: "RANKED_SOLO_5x5", season: "SEASON2015"})
        expect(matches.first.last.class).to eql(Array)
        expect(matches.first.last.first.class).to eql(Hash)
      end
    end

    it 'fetches matches from the API' do
      VCR.use_cassette("matchlist") do 
        matches = request.get(20833616, {rankedQueues: "RANKED_SOLO_5x5", season: "SEASON2015"})
        expect(matches.first.last.length).to be >= 471
      end
    end
  end

end
