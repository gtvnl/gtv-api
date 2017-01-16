#include<OneWire.h>
#include<DallasTemperature.h>
#include <PrintEx.h>

using namespace ios;


OneWire gpio1a(2);  // Sensor 1a
OneWire gpio1b(3);  // Sensor 1b
OneWire gpio1c(4);  // Sensor 1c

OneWire gpio2a(5);  // Sensor 2a
OneWire gpio2b(6);  // Sensor 2b
OneWire gpio2c(7);  // Sensor 2c

OneWire gpio3a(8);  // Sensor 3a
OneWire gpio3b(9);  // Sensor 3b
OneWire gpio3c(10); // Sensor 3c

OneWire gpio4a(11); // Sensor 4a
OneWire gpio4b(12); // Sensor 4b
OneWire gpio4c(13); // Sensor 4c

OneWire gpio5a(14); // Sensor 5a
OneWire gpio5b(15); // Sensor 5b
OneWire gpio5c(16); // Sensor 5c

OneWire gpio6a(17); // Sensor 6a
OneWire gpio6b(18); // Sensor 6b
OneWire gpio6c(19); // Sensor 6c

OneWire gpioBinnen(20); // Sensor Binnen
OneWire gpioBuiten(21); // Sensor Buiten

DallasTemperature sensor1a(&gpio1a);
DallasTemperature sensor1b(&gpio1b);
DallasTemperature sensor1c(&gpio1c);

DallasTemperature sensor2a(&gpio2a);
DallasTemperature sensor2b(&gpio2b);
DallasTemperature sensor2c(&gpio2c);

DallasTemperature sensor3a(&gpio3a);
DallasTemperature sensor3b(&gpio3b);
DallasTemperature sensor3c(&gpio3c);

DallasTemperature sensor4a(&gpio4a);
DallasTemperature sensor4b(&gpio4b);
DallasTemperature sensor4c(&gpio4c);

DallasTemperature sensor5a(&gpio5a);
DallasTemperature sensor5b(&gpio5b);
DallasTemperature sensor5c(&gpio5c);

DallasTemperature sensor6a(&gpio6a);
DallasTemperature sensor6b(&gpio6b);
DallasTemperature sensor6c(&gpio6c);

DallasTemperature sensorBinnen(&gpioBinnen);
DallasTemperature sensorBuiten(&gpioBuiten);


void setup(void)
{
 Serial.begin(9600);
 sensor1a.begin();
 sensor1b.begin();
 sensor1c.begin();

 sensor2a.begin();
 sensor2b.begin();
 sensor2c.begin();

 sensor3a.begin();
 sensor3b.begin();
 sensor3c.begin();

 sensor4a.begin();
 sensor4b.begin();
 sensor4c.begin();

 sensor5a.begin();
 sensor5b.begin();
 sensor5c.begin();

 sensor6a.begin();
 sensor6b.begin();
 sensor6c.begin();

 sensorBinnen.begin();
 sensorBuiten.begin();

}

void loop()
{
 // send command to get temperatures
 sensor1a.requestTemperatures();
 sensor1b.requestTemperatures();
 sensor1c.requestTemperatures();

 sensor2a.requestTemperatures();
 sensor2b.requestTemperatures();
 sensor2c.requestTemperatures();

 sensor3a.requestTemperatures();
 sensor3b.requestTemperatures();
 sensor3c.requestTemperatures();

 sensor4a.requestTemperatures();
 sensor4b.requestTemperatures();
 sensor4c.requestTemperatures();

 sensor5a.requestTemperatures();
 sensor5b.requestTemperatures();
 sensor5c.requestTemperatures();

 sensor6a.requestTemperatures();
 sensor6b.requestTemperatures();
 sensor6c.requestTemperatures();

 sensorBinnen.requestTemperatures();
 sensorBuiten.requestTemperatures();


 float sensor1aTemp = sensor1a.getTempCByIndex(0);
 float sensor1bTemp = sensor1b.getTempCByIndex(0);
 float sensor1cTemp = sensor1c.getTempCByIndex(0);

 float sensor2aTemp = sensor2a.getTempCByIndex(0);
 float sensor2bTemp = sensor2b.getTempCByIndex(0);
 float sensor2cTemp = sensor2c.getTempCByIndex(0);

 float sensor3aTemp = sensor3a.getTempCByIndex(0);
 float sensor3bTemp = sensor3b.getTempCByIndex(0);
 float sensor3cTemp = sensor3c.getTempCByIndex(0);

 float sensor4aTemp = sensor4a.getTempCByIndex(0);
 float sensor4bTemp = sensor4b.getTempCByIndex(0);
 float sensor4cTemp = sensor4c.getTempCByIndex(0);

 float sensor5aTemp = sensor5a.getTempCByIndex(0);
 float sensor5bTemp = sensor5b.getTempCByIndex(0);
 float sensor5cTemp = sensor5c.getTempCByIndex(0);

 float sensor6aTemp = sensor6a.getTempCByIndex(0);
 float sensor6bTemp = sensor6b.getTempCByIndex(0);
 float sensor6cTemp = sensor6c.getTempCByIndex(0);

 float sensorBinnenTemp = sensorBinnen.getTempCByIndex(0);
 float sensorBuitenTemp = sensorBuiten.getTempCByIndex(0);

delay(1000);

   Serial << "1a:" << precision(2) << sensor1aTemp << ","
          << "1b:" << precision(2) << sensor1bTemp << ","	  
 	  << "1c:" << precision(2) << sensor1cTemp << ","
	  << "2a:" << precision(2) << sensor2aTemp << ","
	  << "2b:" << precision(2) << sensor2bTemp << ","
	  << "2c:" << precision(2) << sensor2cTemp << ","
	  << "3a:" << precision(2) << sensor3aTemp << ","
	  << "3b:" << precision(2) << sensor3bTemp << ","
	  << "3c:" << precision(2) << sensor3cTemp << ","
	  << "4a:" << precision(2) << sensor4aTemp << ","
	  << "4b:" << precision(2) << sensor4bTemp << ","
	  << "4c:" << precision(2) << sensor4cTemp << ","
	  << "5a:" << precision(2) << sensor5aTemp << ","
	  << "5b:" << precision(2) << sensor5bTemp << ","
	  << "5c:" << precision(2) << sensor5cTemp << ","
 	  << "6a:" << precision(2) << sensor6aTemp << ","
	  << "6b:" << precision(2) << sensor6bTemp << ","
	  << "6c:" << precision(2) << sensor6cTemp << ","
	  << "Binnen:" << precision(2) << sensorBinnenTemp << ","
	  << "Buiten:" << precision(2) << sensorBuitenTemp << "\r"

;


}
