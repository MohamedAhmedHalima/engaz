import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AutoLocationPage extends StatefulWidget {
  @override
  _AutoLocationPageState createState() => _AutoLocationPageState();
}

class _AutoLocationPageState extends State<AutoLocationPage> {
  Position? _position;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    try {
      // 1. Check service
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw 'Location services are disabled.';
      }

      // 2. Check/request permission
      LocationPermission perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
        if (perm == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }
      if (perm == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied.';
      }

      // 3. Get position
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() => _position = pos);
    } catch (e) {
      print(_error);
      setState(() => _error = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_error != null) {
      print(_error);

      body = Text('Error: $_error', style: TextStyle(color: Colors.red));
    } else if (_position == null) {
      body = CircularProgressIndicator();
    } else {
      body = Text(
        'Lat: ${_position!.latitude}\nLng: ${_position!.longitude}',
        textAlign: TextAlign.center,
      );
    }

    return body;
  }
}
