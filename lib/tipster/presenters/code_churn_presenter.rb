require_relative '../heuristics/code_churn_heuristic'
require_relative '../commands/git/files_changed'
require_relative '../commands/git/latest_commit'
require_relative '../presenters/heuristic_status'
require_relative '../history/commit_history_context'

class CodeChurnPresenter

	def initialize(id = current_commit_id)
		@commit_id = id
	end

  def pass?
    code_ratio_heuristic = CodeChurnHeuristic.new
    code_ratio_heuristic.apply change_list
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
  	result = 'Warning: Your commit is risky due to high churn.'
    if safe
      result = 'Your commit does not include any high-churn files.'
    end
		HeuristicStatus.new(safe ,result)
  end
end