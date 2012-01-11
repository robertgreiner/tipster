class HeuristicStatus

	attr_accessor :status, :description

  def initialize(safe, description)
    @status = safe ? 'Safe' : 'Risky'
    @description = description
  end

end