require 'os'
module Config
  CONFIG_PATH_LIN = '~/.config/nvim/init.vim'.freeze
  CONFIG_PATH_WIN = '~/AppData/Local/nvim/init.vim'.freeze  
  def self.sync(file_path)
    File.symlink(file_path, File.expand_path(CONFIG_PATH_LIN)) unless OS.windows?
    File.symlink(file_path, File.expand_path(CONFIG_PATH_WIN)) if OS.windows?
  end
end
