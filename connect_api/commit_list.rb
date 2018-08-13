class CommitList

  def initialize(query)
    @query = query
  end

  def create_list
    commits = []
    @query.each do |element|
      commit = Commit.new(element,1)
      commit.create_commit
      commits << commit.parse_to_string
    end

    commits.map do |commit|
      commit_array = commit.split(";")
      commit_array[commit_array.size - 1] = commits.count(commit)
      commit_array.join(";")
    end
      .uniq.sort_by {|a| a[a.rindex(";") + 1 ..a.size - 1].to_i }
  end
end
