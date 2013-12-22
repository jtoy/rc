require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 1000
 
if defined?(Rails)
  rr = IRB.conf[:LOAD_MODULES].detect{|x| x =~ /environment$/}.gsub(/config\/environment$/, '')
  IRB.conf[:HISTORY_FILE] = File.join(rr, '.irb_history')
else
  IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'], '.irb_history')
end
