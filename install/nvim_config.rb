module Config
  
  CONFIG_PATH = '~/.config/nvim/init.vim'.freeze

  def Config.sync(file_path)
    File.symlink(file_path, File.expand_path(CONFIG_PATH))
  end

end

