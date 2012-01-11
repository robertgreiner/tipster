require_relative '../heuristics/code_ratio_heuristic'
require_relative '../history/commit_history_context'
require_relative '../commands/git/files_changed'
require_relative '../commands/git/latest_commit'
require_relative '../presenters/heuristic_status'

class CodeRatioPresenter

	def initialize(id = current_commit_id)
		@commit_id = id
	end

  def pass?
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply(change_list)
    code_ratio_heuristic.pass?
  end

  def current_commit_id
  	LatestCommit.new.id
  end

  def git_output
  	FilesChanged.new(@commit_id).list
  end

  def change_list
  	CommitHistoryContext.new(git_output).change_list
  end

  def status
    safe = pass?
  	result = 'Warning: Your commit is risky due to a lack of tests.  Consider adding more tests and amending your commit.'
    if safe
      result = 'Your commit has adequate tests and will not be flagged as risky.'
    end
		HeuristicStatus.new(safe ,result)
  end
end