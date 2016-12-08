require "serialport"
require "set"

port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE


sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

sensorNames = ["1a","1b","1c","2a","2b","2c","3a","3b","3c","4a","4b","4c","5a","5b","5c","6a","6b","6c","Binnen","Buiten"]


begin
  i = sp.gets.chomp unless sp.gets.nil?

  sensorNames.each do |sensorName|

    if i.include? "Sensor #{sensorName}"
      sensorNames.delete(sensorName)

      name = i.split(": ")[0]
      temp = i.split(": ")[1].to_f

      puts "[#{sensorName}/#{sensorNames.count}]#{name}: #{temp}"
    end
  end

  puts i

end while (sensorNames.count != 0)


sp.close
