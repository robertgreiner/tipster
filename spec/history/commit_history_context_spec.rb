require 'rspec'
require_relative '../../lib/tipster/history/commit_history_context'

describe "Commit History Context" do
  it "should store the list of modified files in memory" do
    commit_history_context = CommitHistoryContext.new raw_output
    change_list = commit_history_context.change_list
    change_list.size.should be 3
  end
  it "should allow retrieval of file information" do
    commit_history_context = CommitHistoryContext.new raw_output
    change_list = commit_history_context.change_list
    change_list[1].file_name.should == "more_production_code.rb"
  end
  it "should filter results from raw output" do
    commit_history_context = CommitHistoryContext.new raw_output
    files = commit_history_context.affected_files raw_output
    files[0] == "75       10       production_code.rb"
  end
  it "should get the number of modified lines for a single file" do
    commit_history_context = CommitHistoryContext.new raw_output
    result = commit_history_context.commit_history "75       10       production_code.rb"
    result.lines_modified.should be 75
  end
  it "should get the number of removed lines for a single file" do
    commit_history_context = CommitHistoryContext.new raw_output
    result = commit_history_context.commit_history "75       10       production_code.rb"
    result.lines_removed.should be 10
  end
  it "should get the file name from raw output" do
    commit_history_context = CommitHistoryContext.new raw_output
    result = commit_history_context.commit_history "75       10       production_code.rb"
    result.file_name.should == "production_code.rb"
  end
end

def raw_output
  numstat = "commit 38776ceb87e27d4de736e1c2f416e0cb50e19c66\n"
  numstat << "Author: Fake Person <contact@ratcheting.org>\n"
  numstat << "Date:   Sun Sep 18 12:09:13 2011 -0500\n"
  numstat << "\n"
  numstat << "    This is a fake commit message.\n"
  numstat << "\n"
  numstat << "75       10       production_code.rb\n"
  numstat << "25       20       more_production_code.rb\n"
  numstat << "40       30       production_code_spec.rb"
end

def filtered_output
  result = "75       10       production_code.rb\n"
  result << "25       20       more_production_code.rb\n"
  result << "40       30       production_code_spec.rb"
end