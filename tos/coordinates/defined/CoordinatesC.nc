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

	components DefinedCoordinatesP;

	GetUTM = DefinedCoordinatesP.GetUTM;
	GetGeo = DefinedCoordinatesP.GetGeo;
	GetOrientation = DefinedCoordinatesP.GetOrientation;

}
