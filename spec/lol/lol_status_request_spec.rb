require "spec_helper"
require "lol"

include Lol

describe LolStatusRequest do
  subject { LolStatusRequest.new "api_key", "euw" }

  it 'inherits from Request' do
    expect(LolStatusRequest).to be < Request
  end

  describe '#shard_data' do
    let(:response) { subject.shard_data }

    before(:each) { stub_request(subject, 'lol-status-shard', 'shard-data') }

    it 'returns a Shard' do
      expect(response).to be_a(DynamicModel)
    end

    it 'services returns an array of Services' do
      expect(response.services.map(&:class).uniq).to eq([DynamicModel])
    end
  end

end
