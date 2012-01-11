require 'rspec'
require_relative '../../lib/tipster/heuristics/code_churn_heuristic'
require_relative '../../lib/tipster/history/commit_history'

describe "Code Churn Heuristic" do
  it "should calculate file churn ratio" do
    ratio = CodeChurnHeuristic.new.churn_ratio fake_file
    ratio.should == 0.5
  end
  it "should hold the ratio for each file in the commit" do
    code_churn_heuristic = CodeChurnHeuristic.new
    code_churn_heuristic.process fake_file
    code_churn_heuristic.files["spec/stub/fake_file.txt"].should == 0.5
  end
  it "should fail on high churn" do
    code_churn_heuristic = CodeChurnHeuristic.new
    code_churn_heuristic.apply build_high_churn_commit_history
    code_churn_heuristic.pass?.should be false
  end
  it "should pass on low churn" do
    code_churn_heuristic = CodeChurnHeuristic.new
    code_churn_heuristic.apply build_low_churn_commit_history
    code_churn_heuristic.pass?.should be true
  end
end

def build_high_churn_commit_history
  commit_history = []
  commit_history << CommitHistory.new(6, 0, "spec/stub/fake_file.txt")
end

def build_low_churn_commit_history
  commit_history = []
  commit_history << CommitHistory.new(1, 0, "spec/stub/fake_file.txt")
end

def fake_file
  CommitHistory.new(5, 0, "spec/stub/fake_file.txt")
end

def fake_high_churn_file
  CommitHistory.new(5, 0, "spec/stub/fake_file.txt")
end

def fake_low_churn_file
  CommitHistory.new(5, 0, "spec/stub/fake_file.txt")
end