require "serialport"
class Temp
  class << self

    def read

    port_str = "/dev/ttyACM0"  #may be different for you
    baud_rate = 115200
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    h = Hash.new
    sp = SerialPort.open(port_str, baud_rate, data_bits, stop_bits, parity)

    sensorNames = ["1a","1b","1c","2a","2b","2c","3a","3b","3c","4a","4b","4c","5a","5b","5c","6a","6b","6c"]

    eofCount = 0
    serialString = ""

    while eofCount < 5

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

    array = serialString.split(",")

      array.each do |value|

        name = value.split(":")[0]
        temp = value.split(":")[1].to_f

        h = {"#{name}":  temp}

        puts h

      end

    end
  end
end
