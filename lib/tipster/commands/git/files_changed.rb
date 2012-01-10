class FilesChanged
  attr_reader :list
  def initialize(commit_id)
    @list = `git show #{commit_id} --numstat`
  end
end