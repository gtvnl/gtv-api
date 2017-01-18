class Serial
  class << self

    def read

    serialString = File.open('temp.dat', 'r') { |file| file.read }


    h = Hash.new

    sensorNames = ["1a","1b","1c","2a","2b","2c","3a","3b","3c","4a","4b","4c","5a","5b","5c","6a","6b","6c","Binnen","Buiten"]

    array = serialString.split("\t")[1].split("\r")[0].split(",")

      array.each do |value|

        name = value.split(":")[0]
        temp = value.split(":")[1].to_f

        unless name.include? "EOF"
          h["#{name}"] = temp
        end

      end

      if h.count == 20
        puts serialString
        return h.sort.to_h
        File.delete(serialString) if File.exist?(serialString)

      else
        puts "Incomplete data"
      end

    end
  end
end
