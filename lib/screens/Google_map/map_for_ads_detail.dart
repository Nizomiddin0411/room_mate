import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talaba_uy/core/const/app_colors.dart';



class MapDetail extends StatefulWidget {
  String? location;
  MapDetail({Key? key,required this.location}) : super(key: key);

  @override
  State<MapDetail> createState() => _MapDetailState();
}
//20.42796133580664, 80.885749655962
class _MapDetailState extends State<MapDetail> {
  // double lat = .first.parse();
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle =  CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[

  ];
  List<Marker> mymarker = [];
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    String map = '41.311081, 69.240562';

    // String ls = widget.location.split(',').first.toString();
    // String ls1 = widget.location.split(',').last.toString();
    // double mapDouble = double.parse('${ls}');
    // double mapDouble1 = double.parse('${ls1}');
    _markers.add(
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(41.314995966135704, 69.2348812893033),
          infoWindow: InfoWindow(
            title: 'My Position',
          )
      ),
    );
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: const Text("User current location"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            // on below line setting camera position
            // initialCameraPosition: _kGoogle,
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.30343928785916, 69.2437744885683),
              zoom: 14,

            ),
            // on below line we are setting markers on the map
            markers: Set<Marker>.of(_markers),

            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
      // on pressing floating action button the camera will take to user current location
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async{
      //     getUserCurrentLocation().then((value) async {
      //       final mapLatitude = context.read<FavoriteProvider>();
      //       print(value.latitude.toString() +" "+value.longitude.toString());
      //       // print(mapDouble);
      //       // print(mapDouble1);
      //       mapLatitude.forMap = value.latitude.toString()+','+value.longitude.toString();
      //       // marker added for current users location
      //       _markers.add(
      //           Marker(
      //             markerId: MarkerId("2"),
      //             position: LatLng(value.latitude, value.longitude),
      //             infoWindow: const InfoWindow(
      //               title: 'My Current Location',
      //             ),
      //           )
      //       );
      //
      //       // specified current users location
      //       CameraPosition cameraPosition = CameraPosition(
      //         target: LatLng(value.latitude, value.longitude),
      //         zoom: 14,
      //       );
      //
      //       final GoogleMapController controller = await _controller.future;
      //       controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      //       setState(() {
      //       });
      //     });
      //     // Navigator.pop(context);
      //   },
      //   label: const Text("Joylashuvimni jo'natish",),
      //   icon: const Icon(Icons.location_history),
      //   // child: Icon(Icons.local_activity),
      // ),
    );
  }
}
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}

