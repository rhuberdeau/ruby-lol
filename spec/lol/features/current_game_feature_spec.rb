require "spec_helper"
require "lol"

include Lol

describe "when I make a request for a current game" do
  it "should respond with current games" do
    client = Lol::Client.new ENV.fetch("RIOT_API_KEY"), region: 'na'
    current_game_request = client.current_game
    VCR.use_cassette("current_game4") do
      game = current_game_request.current_game encrypted_summoner_id: 'E0QdW-Snvu1KSMfot8td1wDurrTou1M1YtaeWbQOCwtu6Ho'
      expect(game.game_id).to eql(3015473985)
    end
  end
end
