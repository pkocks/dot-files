#!/opt/chef/embedded/bin/ruby
# 
# update vim bundles from git and vim.org

pathogen_dir = "vim-pathogen"
git_tree_top = "#{ENV['HOME']}/dot-files"

vim_org_scripts = [
  %w[IndexedSearch 7062  plugin],
  %w[Rename 7262 plugin],
  %w[taglist 7701  zip],
  %w[YankRing 16536 zip],
  %w[bufexplorer 14208 zip]
]

require 'fileutils'
require 'open-uri'
require 'rubygems'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.mkdir_p(bundles_dir)
FileUtils.cd(bundles_dir)

# get scripts from vim.org
vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.#{script_type == 'zip' ? 'zip' : 'vim'}")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
  if script_type == 'zip'
    %x(unzip -d #{name} #{local_file})
  end
end


FileUtils.cd(git_tree_top)
puts `ls`
puts `git submodule init`
puts `git submodule update`

# Done
  puts "Done"
