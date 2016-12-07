/**
 * Print coordinates through the logging system for debugging purposes.
 *
 * @author Raido Pahtma
 * @license MIT
 */
configuration PrintCoordinatesC { }
implementation {

	components PrintCoordinatesP;

	components CoordinatesC;
	PrintCoordinatesP.GetGeo -> CoordinatesC.GetGeo;
	PrintCoordinatesP.GetUTM -> CoordinatesC.GetUTM;
	PrintCoordinatesP.GetOrientation -> CoordinatesC.GetOrientation;

	components MainC;
	PrintCoordinatesP.Boot -> MainC;

}
