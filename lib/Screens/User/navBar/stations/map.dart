import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spot_ev/Screens/connect.dart';

class MarkerData {
  final double latitude;
  final double longitude;

  MarkerData(this.latitude, this.longitude);
}

// void main() {
//   runApp(MaterialApp(
//     home: MapWithMarkers(),
//   ));
// }

class MapWithMarkers extends StatefulWidget {
  @override
  _MapWithMarkersState createState() => _MapWithMarkersState();
}

class _MapWithMarkersState extends State<MapWithMarkers> {
  GoogleMapController? _mapController;
  List<MarkerData> markersData = [];

  @override
  void initState() {
    super.initState();
    fetchMarkersData().then((data) {
      setState(() {
        markersData = data;
      });
    });
  }

 Future<dynamic> fetchMarkersData() async {
  final response = await http.get(Uri.parse('${con.url}/map.php'));
  print(response.body);
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    print('--------------------------------------------$jsonData');
    List<MarkerData> markersData = [];
    for (var marker in jsonData) {
      markersData.add(MarkerData(
        double.parse(marker['latitude'].toString()),
        double.parse(marker['longitude'].toString()),
      ));
      print('********************************************************${marker['latitude'].toString()}');
      print('*********************************************************************${marker['latitude'].toString()}');

    }
    return markersData;
  } else {
    throw Exception('Failed to load data');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearest Stations'),
        backgroundColor:  Color.fromARGB(255, 101, 3, 153),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(markersData.isNotEmpty ? markersData[0].latitude : 11.1112, markersData.isNotEmpty ? markersData[0].longitude : 76.1784),
          zoom: 9,
        ),
        markers: markersData.map((marker) {
          return Marker(
            markerId: MarkerId('${marker.latitude}_${marker.longitude}'),
            position: LatLng(marker.latitude, marker.longitude),
            // You can customize the marker icon here, if needed
          );
        }).toSet(),
      ),
    );
  }
}
