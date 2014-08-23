require 'json'
hexagrams = []
hexagram = nil
mode = nil
count = 0
lineno = 0

file = File.open("hexagrams.txt", 'r')
file.read.each_line do |line|
  case line
  # Extract number and name of hexagram.
  when /^\s+(\d+)\.\s+(.*)$/
    hexagrams.push hexagram
    hexagram = {}
    hexagram[:number] = $1
    hexagram[:name] = $2
    mode = :description

  # Extract trigrams.
  when /^\s+(above|below)\s+(\S+)\s+(.*)/
    hexagram[$1.to_sym] = {chinese: $2, translation: $3}

  # Section headers.
  when /(THE JUDGEMENT|THE JUDGMENT)/
    mode = :judgement
  when /THE IMAGE/
    mode = :image
  when /THE LINES/
    mode = :lines
    hexagram[:lines] = []
    lineno = 0
    
  # Ignore whitespace.
  when /^\s+$/
  else 
    if mode and hexagram[mode].nil?
      hexagram[mode] = {translation: '', interpretation: ''}
    end
    # Regexp for extracting translation, which is indented.
    # in contrast to interpretation, which is not. 
    matches = line.match /^(\t| {3,})\s*(.*)/
    if matches || mode == :lines
      if mode != :lines
        hexagram[mode][:translation] += "#{matches[2]}\n"
      else
        case line
        when /(Six|Nine).*(beginning|first|second|third|fourth|fifth|top).*(:|\.)/
          lineno += 1
          hexagram[:lines][lineno] = {type: $1, position: $2, translation: "", interpretation: ""}
        when /^(\t| {3,})\s*(.*)/ 
          hexagram[:lines][lineno][:translation] += "#{$2}\n"
        else
          hexagram[:lines][lineno][:interpretation] += line 
        end
      end
    else
      hexagram[mode][:interpretation] += line
    end
  end
end
file.close
hexagrams.push hexagram
hexagrams.shift
puts hexagrams.to_json
