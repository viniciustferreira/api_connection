
RSpec.describe CommitFile do

  describe '#create_file' do
    before(:all) do
      @list = ["nome;email@email;user_login;avatar;2","nome2;email2@email;user_login2;avatar2;3"]
    end

    it "create a file" do
      filename = described_class.generate_file(@list,"projeto")
      expect(File.read(filename)).to eq("nome;email@email;user_login;avatar;2\nnome2;email2@email;user_login2;avatar2;3\n")
      File.delete(filename)
    end
  end
end
