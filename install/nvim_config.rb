require 'os'
require 'fileutils'
module Config
  CONFIG_PATH_LIN = '~/.config/nvim/init.vim'.freeze
  CONFIG_PATH_WIN = '~/AppData/Local/nvim/init.vim'.freeze  
  
  def self.sync(file_path)
  
    windows = OS.windows?
    install_vim_plug_manager(windows) unless has_vim_plug?(windows)

    File.symlink(file_path, File.expand_path(CONFIG_PATH_LIN)) unless windows or File.exists?(CONFIG_PATH_LIN)

    FileUtils.mkdir("#{ENV['USERPROFILE']}/AppData/Local/nvim") unless File.exists?("#{ENV['USERPROFILE']}/AppData/Local/nvim")
    File.symlink(file_path, File.expand_path(CONFIG_PATH_WIN)) if windows and not File.exists?(CONFIG_PATH_WIN)
  end

  VIM_PLUG_INSTALL_WIN = "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni \"$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim\" -Force".freeze
  VIM_PLUG_INSTALL_LIN = "sh -c 'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'".freeze
  
  def Config.install_vim_plug_manager(windows)
    system(VIM_PLUG_INSTALL_WIN) if windows
    system(VIM_PLUG_INSTALL_LIN) unless windows
  end

  VIM_PLUG_LIN = '~/.config/nvim/site/autoload/plug.vim'.freeze
  VIM_PLUG_WIN = '~/AppData/Local/nvim-data/site/autoload/plug.vim'.freeze
  
  def Config.has_vim_plug?(windows)
    vim_plug_path = windows ? VIM_PLUG_WIN : VIM_PLUG_LIN
    Dir.exists?(vim_plug_path)
  end
  

end
