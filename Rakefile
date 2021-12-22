require_relative 'install/nvim_config.rb'

NVIM_PATH = 'src/init.vim'.freeze

task :install do
  Config.sync File.join(__dir__, NVIM_PATH)
end
