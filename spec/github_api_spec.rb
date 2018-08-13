
RSpec.describe GithubApi do

  before(:all) do
    connection = URI.parse("https://api.github.com/repos/Dinda-com-br/braspag-rest/commits")
    @data = Net::HTTP.get(connection)
    @commits = CommitList.new(JSON.parse(@data))
    @file = CommitFile.generate_file(@commits.create_list,"teste")
  end

  describe '#generate_file_from_dinda' do

    it "create a file with github data " do
      filename = described_class.generate_file_from_dinda
      expect(File.readlines(filename).last).to eq(File.readlines(@file).last)
      expect(File.readlines(filename).first).to eq(File.readlines(@file).first)
      File.delete(filename)
      File.delete(@file)
    end
  end
end
