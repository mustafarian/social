def project_root
  gemfile_path = ENV['BUNDLE_GEMFILE']
  if !gemfile_path || gemfile_path.empty?
    then fail "can't find the root of your project from $BUNDLE_GEMFILE"
    else File.dirname gemfile_path
  end
end

namespace :ctags do
  desc "generate tags for emacs code hypertext linking aka metadot"
  task create: :environment do
    system "find #{project_root}/app/ -iname \\*.rb -print0 | xargs -0 ctags"
  end

  desc "remove tags for emacs code hypertext linking aka metadot"
  task clean: :environment do
    system "rm #{project_root}/TAGS"
  end
end
