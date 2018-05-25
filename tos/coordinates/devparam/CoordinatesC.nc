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

	components DevParamCoordinatesP;

	GetUTM = DevParamCoordinatesP.GetUTM;
	GetGeo = DevParamCoordinatesP.GetGeo;
	GetOrientation = DevParamCoordinatesP.GetOrientation;

	components DevicePositionParametersC;
	DevParamCoordinatesP.Latitude  -> DevicePositionParametersC.Latitude;
	DevParamCoordinatesP.Longitude -> DevicePositionParametersC.Longitude;
	DevParamCoordinatesP.Elevation -> DevicePositionParametersC.Elevation;
	DevParamCoordinatesP.FixType   -> DevicePositionParametersC.FixType;

	DevParamCoordinatesP.Pitch     -> DevicePositionParametersC.Pitch;
	DevParamCoordinatesP.Yaw       -> DevicePositionParametersC.Yaw;
	DevParamCoordinatesP.Roll      -> DevicePositionParametersC.Roll;

	DevParamCoordinatesP.Northing  -> DevicePositionParametersC.Northing;
	DevParamCoordinatesP.Easting   -> DevicePositionParametersC.Easting;
	DevParamCoordinatesP.Band      -> DevicePositionParametersC.Band;
	DevParamCoordinatesP.Zone      -> DevicePositionParametersC.Zone;

}
