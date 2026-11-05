# The original Koans runner prints failures but does not set a failing exit code.
# This entry point keeps the original assertions and makes CI failures visible.
require_relative 'path_to_enlightenment'

at_exit do
  failures = []
  count = 0
  Neo::ThePath.new.each_step do |step|
    count += 1
    step.meditate
    failures << "#{step.koan_file}##{step.name}: #{step.failure.message}" unless step.passed?
  end
  if failures.empty?
    puts "Verified #{count} koans: all passed."
  else
    warn failures.join("\n")
    exit! 1
  end
end
