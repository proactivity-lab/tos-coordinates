/**
 * @author Raido Pahtma
 * @license MIT
 */
#include "Coordinates.h"
module DefinedCoordinatesP {
	provides {
		interface GetStruct<coordinates_utm_t> as GetUTM;
		interface GetStruct<coordinates_geo_t> as GetGeo;
		interface GetStruct<orientation_deg_t> as GetOrientation;
	}
}
implementation {

	command error_t GetGeo.get(coordinates_geo_t* value) {
		value->latitude  = DEFINED_DEVICE_LATITUDE;
		value->longitude = DEFINED_DEVICE_LONGITUDE;
		value->elevation = DEFINED_DEVICE_ELEVATION;
		return SUCCESS;
	}

	command error_t GetUTM.get(coordinates_utm_t* value) {
		value->x = DEFINED_DEVICE_UTM_X;
		value->y = DEFINED_DEVICE_UTM_Y;
		value->elevation = DEFINED_DEVICE_ELEVATION;
		value->zone = DEFINED_DEVICE_UTM_ZONE;
		value->band = DEFINED_DEVICE_UTM_BAND;
		return SUCCESS;
	}

	command error_t GetOrientation.get(orientation_deg_t* value) {
		value->yaw   = DEFINED_DEVICE_YAW;
		value->pitch = DEFINED_DEVICE_PITCH;
		value->roll  = DEFINED_DEVICE_ROLL;
		return SUCCESS;
	}

}
