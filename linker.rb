working_dir = File.expand_path(File.dirname(__FILE__))

%w[
  bash_profile
  bashrc
  gitconfig
  tmux.conf
  vim
  vimrc
].each do |file|
  cmd = "ln -s #{File.join(working_dir, file)} ~/.#{file}"
  puts cmd
  `#{cmd}`
end
