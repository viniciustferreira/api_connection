
class Commit

  def initialize(api_response, commits_count)
    @response = api_response
    @commits_count = commits_count
  end

  def create_commit
    author = @response["commit"]["author"]
    @avatar_url = @response["author"] ? @response["author"]["avatar_url"] : nil
    @login = @response["author"] ? @response["author"]["login"] : nil

    { name: author["name"] , email: author["email"], login: @login, avatar_url: @avatar_url, commits_count: @commits_count  }
  end

  def parse_to_string
    create_commit.map do |key, value|
      value
    end.join(";")
  end
end
