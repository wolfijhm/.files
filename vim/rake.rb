require 'rake/clean'

desc "Build ruby c-binding for the Command-T vim plugin."
task :build_commandt do
  buildcmd = <<-EOF
    cd vim/vim/bundle/Command-T.symlink/ruby/command-t
    ruby extconf.rb
    make
    EOF

  `#{buildcmd}`
end

CLEAN.include('vim/vim/bundle/Command-T.symlink/ruby/command-t/*.o')
CLOBBER.include('vim/vim/bundle/Command-T.symlink/ruby/command-t/ext.so')
