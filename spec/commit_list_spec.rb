
RSpec.describe CommitList do

  before(:all) do
    @responses = [{
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
    },
    {
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
    }]
    @list = described_class.new(@responses)
  end

  describe '#create_list' do
    it "return a list of commits" do
      expect(@list.create_list).to eq(["nome;email@email;user_login;avatar;2"])
    end
  end
end
