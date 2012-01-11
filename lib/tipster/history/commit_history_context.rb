require_relative 'commit_history'

class CommitHistoryContext

  attr_reader :change_list

  def initialize(raw_output)
    build_change_list(affected_files(raw_output))
  end

  def affected_files(output)
    output.scan(/^\d.*$/)
  end

  def build_change_list(changed_files)
    @change_list = []
    changed_files.each { |file| @change_list << commit_history(file) }
  end

  def commit_history(line)
    CommitHistory.new(line.split[0].to_i, line.split[1].to_i, line.split[2])
  end

end