class LatestCommit
  attr_reader :id
  def initialize
    @id = `git rev-parse --verify HEAD`.chomp
  end
end