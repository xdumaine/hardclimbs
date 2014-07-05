desc "This task updates habtm counter caches"
task :update_counters => :environment do
  
  puts "Updating Area counters..."
  Area.first.update_counters
  puts "done."
  
  puts "Updating Ascent counters..."
  Ascent.first.update_counters
  puts "done."
  
  puts "Updating Climber counters..."
  Climber.first.update_counters
  puts "done."
  
  puts "Updating Climb counters..."
  Climb.first.update_counters
  puts "done."
  
end