/**
 * @author Raido Pahtma
 * @license MIT
 */
#include "Coordinates.h"
module ConfCoordinatesP {
	provides {
		interface GetStruct<coordinates_utm_t> as GetUTM;
		interface GetStruct<coordinates_geo_t> as GetGeo;
		interface GetStruct<orientation_deg_t> as GetOrientation;
	}
	uses {
		interface Conf<int32_t> as Latitude;
		interface Conf<int32_t> as Longitude;
		interface Conf<int32_t> as Elevation;
		interface Conf<int32_t> as UtmEasting;
		interface Conf<int32_t> as UtmNorthing;
		interface Conf<int32_t> as UtmZone;
		interface Conf<int32_t> as UtmBand;
		interface Conf<int32_t> as Yaw;
		interface Conf<int32_t> as Pitch;
		interface Conf<int32_t> as Roll;

		interface ConfDefaults<int32_t> as Defaults;
		interface ConfDefaults<int32_t> as AngleDefaults;
		interface ConfDefaults<int32_t> as ZoneDefaults;
		interface ConfDefaults<int32_t> as BandDefaults;
	}
}
implementation {

	#define __MODUUL__ "coord"
	#define __LOG_LEVEL__ ( LOG_LEVEL_ConfCoordinatesP & BASE_LOG_LEVEL )
	#include "log.h"

	command error_t GetGeo.get(coordinates_geo_t* value) {
		value->latitude  = call Latitude.get();
		value->longitude = call Longitude.get();
		value->elevation = call Elevation.get();
		value->type = "F";
		return SUCCESS;
	}

	command error_t GetUTM.get(coordinates_utm_t* value) {
		value->easting = call UtmEasting.get();
		value->northing = call UtmNorthing.get();
		value->elevation = call Elevation.get();
		value->zone = call UtmZone.get();
		value->band = call UtmBand.get();
		return SUCCESS;
	}

	command error_t GetOrientation.get(orientation_deg_t* value) {
		value->yaw   = call Yaw.get();
		value->pitch = call Pitch.get();
		value->roll  = call Roll.get();
		return SUCCESS;
	}

	event void Latitude.changed(int32_t value) { debug1("Latitude %"PRIi32, value); }
	event void Longitude.changed(int32_t value) { debug1("Longitude %"PRIi32, value); }
	event void Elevation.changed(int32_t value) { debug1("Elevation %"PRIi32, value); }
	event void UtmEasting.changed(int32_t value) { debug1("UtmEasting %"PRIi32, value); }
	event void UtmNorthing.changed(int32_t value) { debug1("UtmNorthing %"PRIi32, value); }
	event void UtmZone.changed(int32_t value) { debug1("UtmZone %"PRIi32, value); }
	event void UtmBand.changed(int32_t value) { debug1("UtmBand %c (%"PRIu32")", (char)value, value); }
	event void Yaw.changed(int32_t value) { debug1("Yaw %"PRIi32, value); }
	event void Pitch.changed(int32_t value) { debug1("Pitch %"PRIi32, value); }
	event void Roll.changed(int32_t value) { debug1("Roll %"PRIi32, value); }

	event int32_t Defaults.minValue() { return INT32_MIN; }
	event int32_t Defaults.maxValue() { return INT32_MAX; }
	event int32_t Defaults.defaultValue() { return 0; }

	event int32_t ZoneDefaults.minValue() { return 1; }
	event int32_t ZoneDefaults.maxValue() { return 60; }
	event int32_t ZoneDefaults.defaultValue() { return 0; }

	event int32_t BandDefaults.minValue() { return 'A'; }
	event int32_t BandDefaults.maxValue() { return 'Z'; }
	event int32_t BandDefaults.defaultValue() { return 0; }

	event int32_t AngleDefaults.minValue() { return -360*1000L; }
	event int32_t AngleDefaults.maxValue() { return 360*1000L; }
	event int32_t AngleDefaults.defaultValue() { return 0; }

}
