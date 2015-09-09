module Lol
  class MatchList < Request
    # Returns the supported API Version
    # @return [String] the supported api version
    def self.api_version
      "v2.2"
    end

    # Returns match list for a summoner
    # @return []
    def get summoner_id, options = {}
      perform_request(api_url("matchlist/by-summoner/#{summoner_id}", options))
    end
  end
end
