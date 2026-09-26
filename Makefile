GST := /opt/homebrew/bin/gst 

SRC := \
  lib/main.st \
	lib/sharing_system.st \
	lib/vehicle.st \
	lib/person/persona.st \
	lib/person/driver.st \
	lib/person/rider.st \
	lib/rides/rides.st \
	lib/rides/premium_ride.st \
	lib/rides/standard_ride.st \

run:
	$(GST) $(SRC)

clean:
	rm -f *.im

