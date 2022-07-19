import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/data/model/direction_model.dart';
import 'package:taxi_app/data/repository/direction_repository.dart';

class MapViews extends StatefulWidget {
  const MapViews({Key? key}) : super(key: key);

  @override
  State<MapViews> createState() => _MapViewsState();
}

class _MapViewsState extends State<MapViews> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.2995, 69.2401),
    zoom: 14.5,
    tilt: 50.0,
  );
  late GoogleMapController _googleMapController;
  late Marker _origin = const Marker(
      markerId: MarkerId("origin"), position: LatLng(41.2995, 69.2401));
  late Marker _destination = const Marker(
      markerId: MarkerId("destination"), position: LatLng(41.2995, 69.1223));

  late Directions _info = Directions(
      bounds: LatLngBounds(
        northeast: const LatLng(41.2995, 69.2401),
        southwest: const LatLng(41.2995, 69.2401),
      ),
      polylinePoints: PolylinePoints().decodePolyline(""),
      totalDistance: "",
      totalDuration: "");

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: false,
          elevation: 1,
          title: const Text(
            'Google Maps',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            if (_origin !=
                const Marker(
                    markerId: MarkerId("origin"),
                    position: LatLng(41.2995, 69.2401)))
              TextButton(
                onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _origin.position,
                      zoom: 14.5,
                      tilt: 50.0,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text('ORIGIN'),
              ),
            if (_destination !=
                const Marker(
                    markerId: MarkerId("destination"),
                    position: LatLng(41.2995, 69.1223)))
              TextButton(
                onPressed: () => _googleMapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _destination.position,
                      zoom: 14.5,
                      tilt: 50.0,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text('DEST'),
              )
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: {
                if (_origin !=
                    const Marker(
                        markerId: MarkerId("origin"),
                        position: LatLng(41.2995, 69.2401)))
                  _origin,
                if (_destination !=
                    const Marker(
                        markerId: MarkerId("destination"),
                        position: LatLng(41.2995, 69.1223)))
                  _destination
              },
              polylines: {
                if (_info !=
                    Directions(
                        bounds: LatLngBounds(
                          northeast: const LatLng(41.2995, 69.2401),
                          southwest: const LatLng(41.2995, 69.2401),
                        ),
                        polylinePoints: PolylinePoints().decodePolyline(""),
                        totalDistance: "",
                        totalDuration: ""))
                  Polyline(
                    polylineId: const PolylineId('overview_polyline'),
                    color: Colors.red,
                    width: 5,
                    points: _info.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
              onTap: _addMarker,
            ),
            if (_info !=
              Directions(
                    bounds: LatLngBounds(
                      northeast: const LatLng(41.2995, 69.2401),
                      southwest: const LatLng(41.2995, 69.2401),
                    ),
                    polylinePoints: PolylinePoints().decodePolyline(""),
                    totalDistance: "",
                    totalDuration: ""))
              Positioned(
                top: 20.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: Text(
                      '${_info.totalDistance}${_info.totalDuration}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.black,
              onPressed: () {
                _googleMapController.animateCamera(
                  _info !=
                          Directions(
                              bounds: LatLngBounds(
                                northeast: const LatLng(41.2995, 69.2401),
                                southwest: const LatLng(41.2995, 69.2401),
                              ),
                              polylinePoints:
                                  PolylinePoints().decodePolyline(""),
                              totalDistance: "",
                              totalDuration: "")
                      ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
                      : CameraUpdate.newCameraPosition(_initialCameraPosition),
                );
              },
              child: const Icon(Icons.center_focus_strong),
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  _origin = const Marker(
                      markerId: MarkerId("origin"),
                      position: LatLng(41.2995, 69.2401));
                  _destination = const Marker(
                      markerId: MarkerId("destination"),
                      position: LatLng(41.2995, 69.1223));
                });
              },
              child: const Icon(Icons.clear_all),
            ),
          ],
        ));
  }

  Future<void> _addMarker(LatLng pos) async {
    if (_origin ==
            const Marker(
                markerId: MarkerId("origin"),
                position: LatLng(41.2995, 69.2401)) ||
        (_origin !=
                const Marker(
                    markerId: MarkerId("origin"),
                    position: LatLng(41.2995, 69.2401)) &&
            _destination !=
                const Marker(
                    markerId: MarkerId("destination"),
                    position: LatLng(41.2995, 69.1223)))) {
      // Origin is not set OR Origin/Destination are both set
      // Set origin
      setState(() {
        _origin = Marker(
            markerId: const MarkerId("origin"),
            infoWindow: const InfoWindow(title: "origin"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);
      });
      // Reset destination
      _destination ==
          const Marker(
              markerId: MarkerId("destination"),
              position: LatLng(41.2995, 69.1223));
      _info = Directions(
          bounds: LatLngBounds(
            northeast: const LatLng(41.2995, 69.2401),
            southwest: const LatLng(41.2995, 69.2401),
          ),
          polylinePoints: PolylinePoints().decodePolyline(""),
          totalDistance: "",
          totalDuration: "");
    } else {
      setState(() {
        _destination = Marker(
            markerId: const MarkerId("destination"),
            infoWindow: const InfoWindow(title: "destination"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });
      // Get directions
      final directions = await DirectionsRepository()
          .getDirections(origin: _origin.position, destination: pos);
      setState(() => _info = directions!);
    }
  }
}
