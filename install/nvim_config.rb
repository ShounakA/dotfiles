module Config
  
  CONFIG_PATH = '~/.config/nvim/init.vim'.freeze

  def Config.sync(file_path)
    File.symlink(CONFIG_PATH, file_path)    
  end

end

