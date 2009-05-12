task :git_submodules do
  puts `git submodule init 2>&1`
  puts `git submodule update 2>&1`
end