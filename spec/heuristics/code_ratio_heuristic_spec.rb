require 'rspec'
require_relative '../../lib/tipster/heuristics/code_ratio_heuristic'
require_relative '../../lib/tipster/history/commit_history'

describe "Code Ratio Heuristic" do
  it "should calculate ratio based on test lines of code over production lines of code" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_history_with_tests
    code_ratio_heuristic.ratio.should == 0.1
  end
  it "should return the number of production lines of code" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_history_with_tests
    code_ratio_heuristic.production_lines_of_code.should be 100
  end
  it "should return the number of test lines of code" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_history_with_tests
    code_ratio_heuristic.test_lines_of_code.should be 10
  end
  it "should pass when test code is checked in" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_history_with_tests
    code_ratio_heuristic.pass?.should be true
  end
  it "should pass regardless of type case" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_history_with_capital_letters_in_the_test_names
    code_ratio_heuristic.pass?.should be true
  end
  it "should not pass when no code is checked in" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_history_without_tests
    code_ratio_heuristic.pass?.should be false
  end
  it "should not count web changes as production code" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_with_web_changes_only
    code_ratio_heuristic.has_production_code?.should be false
  end
  it "should pass if only web changes are made" do
    code_ratio_heuristic = CodeRatioHeuristic.new
    code_ratio_heuristic.apply build_commit_with_web_changes_only
    code_ratio_heuristic.pass?.should be true
  end
end

def build_commit_history_with_tests
  commit_history = []
  commit_history << CommitHistory.new(75, 10, "production_code.java")
  commit_history << CommitHistory.new(25, 20, "more_production_code.rb")
  commit_history << CommitHistory.new(10, 40, "some_test_code_spec.rb")
end

def build_commit_history_without_tests
  commit_history = [CommitHistory.new(75, 10, "production_code.rb")]
end

def build_commit_with_web_changes_only
  commit_history = []
  commit_history << CommitHistory.new(75, 10, "style.css")
  commit_history << CommitHistory.new(25, 20, "index.html")
end

def build_commit_history_with_capital_letters_in_the_test_names
  commit_history = []
  commit_history << CommitHistory.new(75, 10, "SomeClass.cs")
  commit_history << CommitHistory.new(25, 20, "AnotherClass.cs")
  commit_history << CommitHistory.new(10, 40, "ComeClassTests.cs")
end