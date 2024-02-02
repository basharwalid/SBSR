import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MapTab extends StatefulWidget {
  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  @override
  void initState() {
    super.initState();
    askUserForPermissionAndService();
  }

  void askUserForPermissionAndService() async {
    await requestService();
    await requestPermission();
    getUserLocation();
    trackUserLocation();
  }

  var locationManager = Location();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

      ],
    );
  }
  void getUserLocation()async{
    var canGetLocation = await canUseGps();
    if(!canGetLocation) return;
    locationManager.changeSettings(
      interval: 1000,
      distanceFilter: 5,
      accuracy: LocationAccuracy.high,
    );
    var locationData = await locationManager.getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }
  StreamSubscription<LocationData>? trackingUserService;
  void trackUserLocation()async{
    var canGetLocation = await canUseGps();
    if(!canGetLocation) return;
    trackingUserService = locationManager.onLocationChanged.listen((locationData) {
      print(locationData.latitude);
      print(locationData.longitude);
    });
  }
  @override
  void dispose(){
    super.dispose();
    trackingUserService?.cancel();
  }

  Future<bool> canUseGps() async {
    var permissionGranted = await isPermissionGranted();
    if (!permissionGranted) {
      return false;
    }
    var isServiceEnabled = await isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return false;
    }
    return true;
  }

  Future<bool> isLocationServiceEnabled() async {
    return await locationManager.serviceEnabled();
  }

  Future<bool> requestService() async {
    var enabled = await locationManager.requestService();
    return enabled;
  }

  Future<bool> isPermissionGranted() async {
    var permissionStatus = await locationManager.hasPermission();
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> requestPermission() async {
    var permissionStatus = await locationManager.requestPermission();
    return permissionStatus == PermissionStatus.granted;
  }
}
