import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/data/model/direction_model.dart';
import 'package:taxi_app/data/repository/direction_repository.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
import 'package:taxi_app/presentation/views/home/_widget/bottom_container.dart';

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

  final Marker _origin1 = const Marker(
      markerId: MarkerId("origin"), position: LatLng(41.2995, 69.2401));

  final Marker _destination1 = const Marker(
      markerId: MarkerId("destination"), position: LatLng(41.2995, 69.1223));
  final Directions _info1 = Directions(
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
    SizeConfig().init(context);
    return SlideInLeft(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: {
                if (_origin != _origin1) _origin,
                if (_destination != _destination1) _destination
              },
              polylines: {
                if (_info != _info1)
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
            const Positioned(
              bottom: 0,
              child: BottomContainer()),
          ],
        ),
      ),
    );
  }

  Future<void> _addMarker(LatLng pos) async {
    if (_origin == _origin1 ||
        (_origin != _origin1) && _destination != _destination1) {
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
      _destination == _destination1;
      _info = _info1;
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
