require "serialport"

port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 115200
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE


sp = SerialPort.open(port_str, baud_rate, data_bits, stop_bits, parity)

sensorNames = ["1a","1b","1c","2a","2b","2c","3a","3b","3c","4a","4b","4c","5a","5b","5c","6a","6b","6c","Binnen","Buiten"]

startCount = 0
endCount = 0
serialString = ""

while startCount < 2 && endCount < 2

  i = sp.gets.chomp

  unless i.nil?
    serialString << i
    if i.include? "START"
      startCount += 1

    elsif i.include? "EOF"
      endCount += 1

    end
  end
end


sp.close

result = /START>{3}(.*?)\<{3}EOF/.match(serialString)
puts result
