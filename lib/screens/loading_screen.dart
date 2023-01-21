import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hava_durumu_projesi/utils/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationData;
  Future<void> getCurrentLocation() async {
    locationData = LocationHelper();
    locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      print("Konum Bilgileri Gelmiyor");
    } else {
      print("latitude:" + locationData.latitude.toString());
      print("longitude:" + locationData.longitude.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (locationData == null) {
      locationData = LocationHelper();
    }
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueAccent, Colors.pink]),
        ),
        child: Center(
          child: SpinKitFadingCircle(
            // loading animation
            color: Colors.white,
            size: 150.0,
            duration: Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}
