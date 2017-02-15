require 'spec_helper'

RSpec.describe 'First Run', :type => :aruba do

  it { expect(run('d00dad.rb')).to have_output(/Commands/) }
end
