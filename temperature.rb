require "serialport"

port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 115200
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE


sp = SerialPort.open(port_str, baud_rate, data_bits, stop_bits, parity)

sensorNames = ["1a","1b","1c","2a","2b","2c","3a","3b","3c","4a","4b","4c","5a","5b","5c","6a","6b","6c"]

eofCount = 0
serialString = ""

while eofCount < 2

  i = sp.gets.chomp

  unless i.nil?
    serialString << i
    if i.include? "EOF"
      eofCount += 1

    end
  end
end


sp.close

#result = /START>{3}(.*?)\<{3}EOF/.match(serialString)

puts serialString


#sensorNames.each do |sensorName|
# temp = serialString&.split("#{sensorName}:")[1].split(",")[0]
# puts "#{sensorName}:#{temp}\n"
#end

#puts serialString
