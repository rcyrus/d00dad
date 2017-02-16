#!/usr/bin/env ruby

require 'thor'
require 'tty-command'

class D00dad < Thor

  desc 'branches GIT_DIR', 'Show both local and remote branches from GIT_DIR'

  def branches(git_dir = '.')
    cmd = TTY::Command.new(printer: :quiet, color: true)
    cmd.run('git branch -a', chdir: git_dir)
  rescue TTY::Command::ExitError => e
    exit 1
  end
end

D00dad.start(ARGV)
