
RSpec.describe Commit do

  before(:all) do
    @response = {
      "commit" => {
        "author" => {
          "name" => "nome",
          "email" => "email@email",
        }
      },
      "author" =>
      {
        "login" => "user_login",
        "avatar_url" => "avatar",
      }
    }
    @response_hash = described_class.new(@response, 8)
  end
  describe '#create_commit' do
    it "return a commit on hash" do

      expect(@response_hash.create_commit).to eq({
        name: "nome",
        email: "email@email",
        login: "user_login",
        avatar_url: "avatar",
        commits_count: 8
      })
    end
  end

  describe '#parse_to_string' do
    it "return a string of the commits" do
      expect(@response_hash.parse_to_string).to eq("nome;email@email;user_login;avatar;8")
    end
  end
end
