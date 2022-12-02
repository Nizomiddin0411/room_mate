import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talaba_uy/core/const/app_colors.dart';

import '../../provider/favorite_provider.dart';



class MapEdit extends StatefulWidget {
  String? location;
  double lat;
  double long;
  MapEdit({Key? key,required this.location,required this.lat,required this.long}) : super(key: key);

  @override
  State<MapEdit> createState() => _MapEditState();
}
//20.42796133580664, 80.885749655962
class _MapEditState extends State<MapEdit> {
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
    // String map = '41.311081, 69.240562';
    final map = context.read<FavoriteProvider>();
    String lat = widget.location!.split(',').first.toString();
    String long = widget.location!.split(',').last.toString();
    // double Lat = double.parse(lat).toDouble();
    // double Long = double.parse(long).toDouble();
    if(map.locationFor == true)  {
      mymarker.add(
        Marker(
            markerId: MarkerId('1'),
            position: LatLng(widget.lat, widget.long),
            infoWindow: InfoWindow(
              title: 'My Position',
            )
        ),
      );
    }
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: AppColors.backgroundWhite,
        title: const Text("Joylashuv",style: TextStyle(color: AppColors.textColor),).tr(),
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
      body: SafeArea(
        // on below line creating google maps
        child: GoogleMap(
          onTap: _handlerTap,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          // on below line setting camera position
          // initialCameraPosition: _kGoogle,
          initialCameraPosition:  CameraPosition(
            target: LatLng(widget.lat, widget.long),
            zoom: 14,

          ),
          // on below line we are setting markers on the map
          markers: Set<Marker>.of(mymarker),

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
      // on pressing floating action button the camera will take to user current location

      floatingActionButton: map.locationFor == false ?InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:30.h,horizontal:90.w),
          child: Container(
            width: 280.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.mainColor,
            ),
            child: Center(child: Text('Saqlash',style: TextStyle(color: AppColors.backgroundWhite,fontSize: 18.sp),).tr()),
          ),
        ),
      ):Container()
      // InkWell(
      //   onTap: () async{
      //
      //     Navigator.pop(context);
      //   },
      //   // label: const Text("Joylashuvimni jo'natish",),
      //   // icon: const Icon(Icons.location_history),
      // ),
    );
  }
  _handlerTap(LatLng tappadPoint){
    final mapLatitude = context.read<FavoriteProvider>();
    mapLatitude.isTapMap = true;
    mapLatitude.locationFor = false;
    mapLatitude.forMap =(tappadPoint.toString());
    print(tappadPoint);
    print(mapLatitude.forMap);

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

