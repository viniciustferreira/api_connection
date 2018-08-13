require 'spec_helper'

RSpec.describe ApiConnection do

  describe '#connect' do
    it "connects to a real api" do
      api = described_class.new("https://api.github.com/users/viniciustferreira")

      expect(api.connect).to be_a(String)
    end
  end

  describe '#response' do
    before(:all) do
      @connect_repo = described_class.new("https://api.github.com/users/viniciustferreira")
      @connect_repo.connect
    end

    it "return a string response" do
      expect(@connect_repo.response["login"]).to eq("viniciustferreira")
    end
  end
end
