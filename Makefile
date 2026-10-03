GST := /opt/homebrew/bin/gst 

SRC := \
	lib/person/persona.st \
	lib/person/driver.st \
	lib/person/rider.st \
	lib/vehicle.st \
	lib/rides/rides.st \
	lib/rides/standard_ride.st \
	lib/rides/premium_ride.st \
	lib/sharing_system.st \
  lib/main.st \

run:
	$(GST) $(SRC)

clean:
	rm -f *.im

