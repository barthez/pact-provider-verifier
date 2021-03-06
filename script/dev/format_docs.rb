require 'word_wrap'

MAX_LINE_LENGTH = 100
PADDING = ' ' * 10
HASH_WITH_PADDING = "\n#{PADDING}# "
lines = `bundle exec bin/pact-provider-verifier help`.gsub(' # ', HASH_WITH_PADDING).split("\n")

new_lines = []

lines.each do | line |
  if line.start_with?("#{PADDING}#") && line.length > MAX_LINE_LENGTH
    split_lines = WordWrap.ww(line, MAX_LINE_LENGTH - PADDING.length).split("\n").collect{ |l| PADDING + l }
    new_lines << split_lines.delete_at(0).gsub(/^#{PADDING}/, '')
    new_lines.concat(split_lines.collect{ |l| "  #{l}"})
  else
    new_lines << line
  end
end

puts WordWrap.ww(new_lines.join("\n"), MAX_LINE_LENGTH)
