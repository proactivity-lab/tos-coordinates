/**
 * @author Raido Pahtma
 * @license MIT
 */
#include "Coordinates.h"
configuration CoordinatesC {
	provides {
		interface GetStruct<coordinates_utm_t> as GetUTM;
		interface GetStruct<coordinates_geo_t> as GetGeo;
		interface GetStruct<orientation_deg_t> as GetOrientation;
	}
}
implementation {

	components ConfCoordinatesP;

	GetUTM = ConfCoordinatesP.GetUTM;
	GetGeo = ConfCoordinatesP.GetGeo;
	GetOrientation = ConfCoordinatesP.GetOrientation;

	components new ConfInt32C(1) as Latitude;
	ConfCoordinatesP.Latitude -> Latitude;
	ConfCoordinatesP.Defaults -> Latitude;

	components new ConfInt32C(2) as Longitude;
	ConfCoordinatesP.Longitude -> Longitude;
	ConfCoordinatesP.Defaults -> Longitude;

	components new ConfInt32C(3) as Elevation;
	ConfCoordinatesP.Elevation -> Elevation;
	ConfCoordinatesP.Defaults -> Elevation;

	components new ConfInt32C(4) as UtmEasting;
	ConfCoordinatesP.UtmEasting -> UtmEasting;
	ConfCoordinatesP.Defaults -> UtmEasting;

	components new ConfInt32C(5) as UtmNorthing;
	ConfCoordinatesP.UtmNorthing -> UtmNorthing;
	ConfCoordinatesP.Defaults -> UtmNorthing;

	components new ConfInt32C(6) as UtmZone;
	ConfCoordinatesP.UtmZone -> UtmZone;
	ConfCoordinatesP.ZoneDefaults -> UtmZone;

	components new ConfInt32C(7) as UtmBand;
	ConfCoordinatesP.UtmBand -> UtmBand;
	ConfCoordinatesP.BandDefaults -> UtmBand;

	components new ConfInt32C(8) as Yaw;
	ConfCoordinatesP.Yaw -> Yaw;
	ConfCoordinatesP.AngleDefaults -> Yaw;

	components new ConfInt32C(9) as Pitch;
	ConfCoordinatesP.Pitch -> Pitch;
	ConfCoordinatesP.AngleDefaults -> Pitch;

	components new ConfInt32C(10) as Roll;
	ConfCoordinatesP.Roll -> Roll;
	ConfCoordinatesP.AngleDefaults -> Roll;
}
