require 'rspec'
require_relative '../../lib/tipster/presenters/code_churn_presenter'

describe "Code Churn Presenter" do
  it "should not have a risky commit if churn is low" do
    commit = CodeChurnPresenter.new 'a77b5e63d1da2436fc4aa5931e3bf54469ab36c5'
    commit.pass?.should be true
  end
  it "should have a risky commit if churn is high" do
    commit = CodeChurnPresenter.new '2246e9ec9dbc4eb2ffd1fa775d2c64deb11ee8be'
    commit.pass?.should be false
  end
end