require_relative 'files_changed'
require_relative 'latest_commit'

class RepositoryContext
  def self.valid_repository?
     LatestCommit.new.id.length == 40
  end
  def self.valid_commit_id?(commit_id)
    FilesChanged.new(commit_id).list.length > 0
  end
end