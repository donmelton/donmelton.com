require 'time'

task :clean do
  sh 'rm -rf output'
end

task :build => [:clean] do
  sh 'time magneto'
end

task :deploy => [:build] do
  sh 'rsync -cavzh --delete --stats --progress output/ donmelton.com:donmelton.com && open http://donmelton.com/'
end

task :stage => [:clean] do
  sh 'cat config.yaml | sed \'s/^\(base_url:\).*$/\1 http:\/\/stage.donmelton.com/;s/^\(cdn_url:\).*$/\1 ""/;s/^\(google_analytics_account:\).*$/\1 ""/\' >stage_config.yaml && time magneto --config stage_config.yaml && rsync -cavzh --delete --stats --progress output/ stage.donmelton.com:stage.donmelton.com && open http://stage.donmelton.com/'
end

task :mamp => [:clean] do
  sh 'cat config.yaml | sed \'s/^\(base_url:\).*$/\1 http:\/\/localhost/;s/^\(cdn_url:\).*$/\1 ""/;s/^\(google_analytics_account:\).*$/\1 ""/\' >mamp_config.yaml && time magneto --config mamp_config.yaml && rsync -cavzh --delete --stats --progress output/ /Applications/MAMP/htdocs/ && open http://localhost/'
end

task :draft do
  print "Title for post? "
  title = STDIN.gets.chomp.strip
  slug = title_to_slug(title)
  raise "Empty title" if slug.empty?

  draft = "drafts/#{slug}.md"
  raise "#{draft} exists" if File.exists?(draft)

  mkdir_p "drafts"

  open(draft, 'w') do |f|
    f.write <<EOF
---
published: #{Time.now.xmlschema}
title: #{title}
---
EOF
  end

  sh "open #{draft}"
end

task :post do
  drafts = Dir["drafts/*"]
  raise "No drafts to post" if drafts.empty?

  drafts.each_with_index { |f, i| puts "#{i + 1}: #{f}" }
  print "Which draft? "
  index = STDIN.gets.chomp.to_i
  raise "Invalid index" if index < 1 || index > drafts.count

  draft = drafts[index - 1]
  raise "#{draft} does not exist" unless File.exists?(draft)

  content = File.read(draft)
  raise "#{draft} missing title" unless content =~ /^---\s*\n.*?\n?title:\s?(.*)\s*\n.*?\n?^---\s*$\n?/m

  title = $1
  slug = title_to_slug(title)
  raise "#{draft} empty title" if slug.empty?

  timestamp = Time.now
  post = "items/#{timestamp.strftime("%Y/%m-%d")}-#{slug}.md"
  raise "#{post} exists" if File.exists?(post)

  mkdir_p File.dirname(post)
  content.sub!(/^published:\s?.*$/, "published: #{timestamp.xmlschema}")

  open(post, 'w') do |f|
    f.print content
  end

  raise "#{post} does not exist" unless File.exists?(post)

  rm draft
  File.utime(timestamp, timestamp, post)
  puts post
end

def title_to_slug(title)
  title.downcase.gsub(/[_\s]+/, '-').gsub(/[^-\w]/, '').gsub(/-+/, '-').sub(/^-/, '').sub(/-$/, '')
end
