watch 'lib/.*\.rb|LICENSE|README\.md' do |m|
  system "yardoc", "--files", "LICENSE", "--title", "Jaccard"
end

# vim: ft=ruby
