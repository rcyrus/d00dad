require 'spec_helper'

RSpec.describe 'First Run', :type => :aruba do

  context 'When run without command' do
    before(:each) { run('d00dad.rb') }
    before(:each) { stop_all_commands }

    it 'should print help information' do
      expect(extract_text(unescape_text(last_command_started.output))).to match(/Commands/)
    end

    it 'should run successfully' do
      expect(last_command_started).to be_successfully_executed
    end
  end

  context 'When running branches command' do

    it 'should show a listing of branches' do
      expect(run('d00dad.rb branches')).to have_output(/develop/)
      expect(last_command_started).to be_successfully_executed
    end

    it 'displays error for bad directory' do
      expect(run('d00dad.rb branches xyz')).to have_output(/No such file or directory/)
      expect(last_command_started).to_not be_successfully_executed
    end

    it 'displays error for non git directory' do
      expect(run('d00dad.rb branches /')).to have_output(/Not a git repository/)
      expect(last_command_started).to_not be_successfully_executed
    end
  end
end
