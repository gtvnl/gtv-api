require "serialport"

port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE


sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

sensors = 20
count = 0

hash = Hash.new
begin
  i = sp.gets.chomp unless sp.gets.nil?
  if i.include? "Sensor"
    name = i.split(": ")[0]
    temp = i.split(": ")[1].to_f
    hash[name] = temp
  end
end while count < sensors

puts hash

sp.close
