import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../../provider/favorite_provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

//20.42796133580664, 80.885749655962
class _MapScreenState extends State<MapScreen> {
   bool isButton = false;
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(41.311081, 69.240562),
      infoWindow: InfoWindow(
        title: 'My Position',
      ),
    ),
  ];
  List<Marker> mymarker = [];
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    late GoogleMapController googleMapController;
    return Scaffold(
      appBar: AppBar(
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
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onTap: _handlerTap,
            zoomControlsEnabled: false,

            // on below line setting camera position
            // initialCameraPosition: _kGoogle,
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.311081, 69.240562),
              zoom: 14,
            ),
            markers: Set.from(mymarker),
            // on below line we are setting markers on the map
            // markers: Set<Marker>.of(_markers),
            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.

            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),

      floatingActionButton: Row(
        children: [
          isButton == true ? Padding(
            padding:  EdgeInsets.fromLTRB(25.w,5.h,0.w,10.h),
            child: FloatingActionButton.extended(
              onPressed: () async {
                Fluttertoast.showToast(
                    msg: tr('Saqlandi'),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white
                );
                Navigator.pop(context);

              },
              label: const Text(
                "Saqlash",style: TextStyle(fontWeight: FontWeight.bold),
              ),
              // icon: const Icon(Icons.location_history),
              // child: Icon(Icons.local_activity),
            ),
          ):SizedBox(),
          Padding(
            padding: EdgeInsets.fromLTRB(25.w,5.h,10.w,10.h),
            child: FloatingActionButton.extended(
              onPressed: () async {
                final maps = context.read<FavoriteProvider>();
                Position position = await _determinePosition();
                final GoogleMapController controller = await _controller.future;
                controller
                    .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));
                maps.forMap = LatLng(position.latitude,position.longitude).toString();
                print(maps.forMap+'helllllllll');

                mymarker.clear();

                mymarker.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));
                isButton = true;
                  setState(() {

                  });

                // Navigator.pop(context);
              },
              label: const Text(
                "Joylashuvni aniqlash",
              ),
              icon: const Icon(Icons.location_history),
              // child: Icon(Icons.local_activity),
            ),
          ),
        ],
      ),
    );
  }

  _handlerTap(LatLng tappadPoint) {
    final mapLatitude = context.read<FavoriteProvider>();
    mapLatitude.forMap = (tappadPoint.toString());
    print(tappadPoint);
    print(mapLatitude.forMap);
    isButton = true;
    setState(() {
      mymarker = [];
      mymarker.add(Marker(
        markerId: MarkerId(tappadPoint.toString()),
        position: tappadPoint,
      ));
    });
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
