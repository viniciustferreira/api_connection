
class GithubApi

  def self.generate_file_from_dinda
    gh_connection = ApiConnection.new "https://api.github.com/repos/Dinda-com-br/braspag-rest/commits"
    gh_connection.connect
    @commits = CommitList.new(gh_connection.response)
    CommitFile.generate_file(@commits.create_list,"braspag-rest")
  end
end
