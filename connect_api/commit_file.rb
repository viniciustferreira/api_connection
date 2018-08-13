
class CommitFile

  def self.generate_file(commit_list, project)
    filename = "#{project}+#{Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")}.txt"
    
    begin
      File.open(filename, "w+") do |file|
        commit_list.each { |commit| file.puts(commit) }
      end
      filename
    rescue Exception
      raise "não foi possivel criar o arquivo"
    end
  end
end
