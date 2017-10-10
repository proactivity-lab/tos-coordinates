/**
 * Print coordinates through the logging system for debugging purposes.
 *
 * @author Raido Pahtma
 * @license MIT
 */
#include "Coordinates.h"
module PrintCoordinatesP {
	uses {
		interface GetStruct<coordinates_geo_t> as GetGeo;
		interface GetStruct<coordinates_utm_t> as GetUTM;
		interface GetStruct<orientation_deg_t> as GetOrientation;
		interface Boot;
	}
}
implementation {

	#define __MODUUL__ "coords"
	#define __LOG_LEVEL__ ( LOG_LEVEL_PrintCoordinatesP & BASE_LOG_LEVEL )
	#include "log.h"

	event void Boot.booted() {
		#if __LOG_LEVEL__ & LOG_INFO1
		{
			coordinates_geo_t gps;
			error_t err = call GetGeo.get(&gps);
			logger(err == SUCCESS ? LOG_INFO1: LOG_ERR1, "gps (%"PRIi32";%"PRIi32";%"PRIi32")", gps.latitude, gps.longitude, gps.elevation);
		}
		#endif // GPS
		#if __LOG_LEVEL__ & LOG_INFO2
		{
			coordinates_utm_t utm;
			error_t err = call GetUTM.get(&utm);
			logger(err == SUCCESS ? LOG_INFO2: LOG_ERR2, "utm (%"PRIi32";%"PRIi32";%"PRIi32") %u%c", utm.northing, utm.easting, utm.elevation, utm.zone, utm.band);
		}
		#endif // UTM
		#if __LOG_LEVEL__ & LOG_INFO3
		{
			orientation_deg_t orient;
			error_t err = call GetOrientation.get(&orient);
			logger(err == SUCCESS ? LOG_INFO3: LOG_ERR3, "ypr (%"PRIi32";%"PRIi32";%"PRIi32")", orient.yaw, orient.pitch, orient.roll);
		}
		#endif // Orientation
	}

}
