require 'rspec'
require_relative '../../lib/tipster/presenters/code_ratio_presenter'

describe "Code Ratio Presenter" do

  before do
    CodeRatioHeuristic.stub(:new).and_return double("CodeRatioHeuristic")
    @code_ratio_heuristic = CodeRatioHeuristic.new
    @code_ratio_heuristic.stub(:apply).and_return nil
  end

  it "should not have a risky commit if tests pass" do
    @code_ratio_heuristic.stub(:pass?).and_return true
    commit = CodeRatioPresenter.new '451b60a38eecfee6ebee5ec8ceb34ea9c9c77145'
    commit.pass?.should be true
  end
  it "should have a risky commit if tests fail" do
    @code_ratio_heuristic.stub(:pass?).and_return false
    commit = CodeRatioPresenter.new '2246e9ec9dbc4eb2ffd1fa775d2c64deb11ee8be'
    commit.pass?.should be false
  end
end

