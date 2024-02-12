def random_spinner
  spinners = %w[| / - \\]
  20.times do
    print "\e[36m#{spinners.sample}\e[0m"  # 36 corresponds to cyan
    sleep(0.1)
    print "\b"
  end
end

def print_loading_bar(progress)
  bar_length = 20
  progress_chars = (bar_length * progress).to_i
  bar = "[#{'#' * progress_chars}#{'.' * (bar_length - progress_chars)}][#{(progress * 100).to_i}%]"
  print "\e[K#{bar}\r"
  $stdout.flush
end

def colorize_output(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def simulate_build_process
  modules = rand(10..100)
  modules.times do |i|
    module_name = "Module #{i + 1}"
    module_size = "#{rand(1..1000)} KiB"
    dependency_count = rand(0..10)
    dependencies = "+ #{dependency_count} hidden #{dependency_count == 1 ? 'module' : 'modules'}"

    output = "[1]     [#{i + 1}] ./#{module_name.downcase.tr(' ', '_')}.js #{module_size} {0} [built]"

    if dependency_count.positive?
      output += "\n[1]         #{dependencies}"
    end

    puts colorize_output(output, 32)  # 32 corresponds to green
    sleep(0.1)
  end
end

def hollywood_style
  total_modules = rand(10..100)
  current_module = 0

  loop do
    simulate_build_process
    random_spinner
    print "\r"

    (0..100).each do |i|
  	progress = i / 100.0
  	print_loading_bar(progress)
  	sleep(rand(0.0001..0.15))
    end
    puts "Done!"

    current_module += 1
    break if current_module > total_modules

    sleep(rand(0.1..0.5))
  end
  print "\r"
  puts "\nBuild process complete!"
end

trap('INT') { exit } # handle Ctrl+C gracefully

puts "Starting build process. Press Ctrl+C to exit."
hollywood_style
