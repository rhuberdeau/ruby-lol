require "spec_helper"
require "lol"

include Lol

describe "when I make a request for a current game" do
  it "should respond with current games" do
    client = Lol::Client.new ENV.fetch("RIOT_API_KEY"), region: 'na'
    current_game_request = client.current_game
    VCR.use_cassette("current_game1") do
      game = current_game_request.spectator_game_info 'NA1', '47581120'
      expect(game.game_id).to eql(2327296940)
    end
  end
end
