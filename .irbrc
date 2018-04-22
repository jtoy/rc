require 'irb/completion'
require 'irb/ext/save-history'
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 1000
 
if defined?(Rails)
  IRB.conf[:HISTORY_FILE] = File.join(Rails.root, '.irb_history')
else
  IRB.conf[:HISTORY_FILE] = File.join(ENV['HOME'], '.irb_history')
end
