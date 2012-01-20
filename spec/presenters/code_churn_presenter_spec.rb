require 'rspec'
require_relative '../../lib/tipster/presenters/code_churn_presenter'

describe "Code Churn Presenter" do

  before do
    CodeChurnHeuristic.stub(:new).and_return double("CodeChurnHeuristic")
    @code_churn_heuristic = CodeChurnHeuristic.new
    @code_churn_heuristic.stub(:apply).and_return nil
  end

  it "should not have a risky commit if churn is low" do
    @code_churn_heuristic.stub(:pass?).and_return true
    commit = CodeChurnPresenter.new 'a77b5e63d1da2436fc4aa5931e3bf54469ab36c5'
    commit.pass?.should be true
  end
  it "should have a risky commit if churn is high" do
    @code_churn_heuristic.stub(:pass?).and_return false
    commit = CodeChurnPresenter.new '2246e9ec9dbc4eb2ffd1fa775d2c64deb11ee8be'
    commit.pass?.should be false
  end
end
