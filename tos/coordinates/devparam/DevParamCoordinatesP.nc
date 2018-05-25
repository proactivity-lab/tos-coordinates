/**
 * @author Raido Pahtma
 * @license MIT
 */
#include "Coordinates.h"
module DevParamCoordinatesP {
	provides {
		interface GetStruct<coordinates_utm_t> as GetUTM;
		interface GetStruct<coordinates_geo_t> as GetGeo;
		interface GetStruct<orientation_deg_t> as GetOrientation;
	}
	uses {
		interface Get<int32_t> as Latitude;
		interface Get<int32_t> as Longitude;
		interface Get<int32_t> as Elevation;
		interface Get<char>    as FixType;

		interface Get<int32_t> as Northing;
		interface Get<int32_t> as Easting;
		interface Get<uint8_t> as Zone;
		interface Get<char>    as Band;

		interface Get<int32_t> as Yaw;
		interface Get<int32_t> as Pitch;
		interface Get<int32_t> as Roll;
	}
}
implementation {

	command error_t GetGeo.get(coordinates_geo_t* value) {
		value->latitude  = call Latitude.get();
		value->longitude = call Longitude.get();
		value->elevation = call Elevation.get();
		value->type = call FixType.get();
		return SUCCESS;
	}

	command error_t GetUTM.get(coordinates_utm_t* value) {
		value->easting = call Easting.get();
		value->northing = call Northing.get();
		value->elevation = call Elevation.get();
		value->zone = call Zone.get();
		value->band = call Band.get();
		return SUCCESS;
	}

	command error_t GetOrientation.get(orientation_deg_t* value) {
		value->yaw   = call Yaw.get();
		value->pitch = call Pitch.get();
		value->roll  = call Roll.get();
		return SUCCESS;
	}

}
