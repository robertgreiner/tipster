require 'rspec'
require_relative '../../../lib/tipster/commands/git/files_changed'

describe "git show --numstat" do
  it "should return detailed information about a specified commit" do
    files_changed = double("FilesChanged")
    files_changed.stub(:list).and_return fake_change_list
    files_changed.list.include?("Robert").should be true
  end
end

def fake_change_list
  list = 'commit d229f066bec91f6fc80448f707e7b070c1791631
Author: Robert Greiner <robert@robertgreiner.com>
Date:   Tue Jan 10 15:09:46 2012 -0600

    Execute git command to get the hash of the latest commit in the repository.

6	0	lib/tipster/commands/git/latest_commit.rb
10	0	spec/commands/git/latest_commit_spec.rb
4	0	spec/helper.rb
'
end