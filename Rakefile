require 'rake'
require 'rake/clean'
require 'pathname'


# load topic specific rake tasks
Dir.glob('**/rake.rb').each do |rakefile|
    require('./' + rakefile)
end

desc "Hook our dotfiles into system-standard positions."
task :install => [:build, :patch] do
  linkables = Dir.glob('**/*.symlink')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    relative_path = '.' + linkable.sub(/.*?\//,'').split('.symlink').last
    target = "#{ENV["HOME"]}/#{relative_path}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then skip = true
        end
      end
      next if skip || skip_all
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "#{target}"{,.bak}` if backup || backup_all
    end

    parent = Pathname.new(target).dirname
    FileUtils.mkdir_p parent unless File.exists? parent
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    relative_path = '.' + linkable.sub(/.*?\//,'').split('.symlink').last
    target = "#{ENV["HOME"]}/#{relative_path}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{target}.bak")
      `mv "#{target}"{.bak,}`
    end

  end
end

desc "Apply local patches to the config files."
task :patch do
  Dir.glob("#{ENV["HOME"]}/.files-patches/**/*.patch") do |patch|
    relative_path = patch.sub(/.*?\/.files-patches\//,'').split('.patch').last
    patch_target = relative_path + '.symlink'
    if File.executable?(patch) and File.exists?(patch_target)
      `"#{patch}" "#{patch_target}"`
    end
  end
end

desc "Execute topic specific build tasks."
task :build do
    Rake::Task.tasks().each do |buildtask|
      Rake::Task[buildtask].invoke() if buildtask.to_s.start_with? 'build_'
  end
end

task :default => :install
