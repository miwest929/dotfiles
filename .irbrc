require 'irb/completion'
require 'time'
#require 'wirble'

# load wirble
Wirble.init
Wirble.colorize

IRB.conf[:AUTO_INDENT] = true

Thread.current[:user_id] = -1

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000

def j(obj)
  puts obj.to_json
end

class Object
  def gvim(method_name)
    file, line = method(method_name).source_location
    `gvim +#{line} #{file}`
  end

  # Return only the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end

Kernel.at_exit {
  File.open("irb.log", "w") do |f|
    f << Readline::HISTORY.to_a.join("\n")
  end
}

=begin
>> a.each_with_index.map {|i, index| "#{i}:#{index}"}
=> ["1:0", "2:1", "3:2", "4:3", "5:4", "6:5", "7:6", "8:7", "9:8", "10:9"]>> a.each.map {|i, index| "#{i}:#{index}"}
=> ["1:", "2:", "3:", "4:", "5:", "6:", "7:", "8:", "9:", "10:"]>> a.each_with_index.select {|i, index| index < 3}
=> [[1, 0], [2, 1], [3, 2]]
>> a.each_with_index.select {|i, index| index < 3}.map {|i, _| i}
=> [1, 2, 3]
=end

if defined? Rails
  begin
    require 'awesome_print'
  rescue LoadError
  end
end
