
RSpec.describe GithubApi do

  describe '#generate_file_from_dinda' do

    it "create a file with github data " do
      filename = described_class.generate_file_from_dinda
      expect(File.readlines(filename).last).to eq("Antonio Filho;antonio.filho@dinda.com.br;;;6\n")
      expect(File.readlines(filename).first).to eq("Carlos Henrique;carlosoteras@gmail.com;soteras;https://avatars3.githubusercontent.com/u/7086520?v=4;1\n")
      File.delete(filename)
    end
  end
end
