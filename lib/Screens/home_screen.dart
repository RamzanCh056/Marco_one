import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  List<Marker> markers = [];

  bool isLoading = true;
  var mapData = [];

  Future<void> mapDataGet() async {
    final String jsonData = await rootBundle.loadString('assets/data.json');
    final data = json.decode(jsonData);
    mapData = data['features'];

    for (var item in mapData) {
      final properties = item['properties'];
      final lat = properties['Latitudine'];
      final lng = properties['Longitudine'];
      final marker = Marker(
        markerId: MarkerId(
            lat.toString() + lng.toString()), // Generate a unique marker ID
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: properties['Categoria'],
          snippet: properties['Indirizzo'],
        ),
      );
      markers.add(marker);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    mapDataGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1A3C7B),
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'indirizzo'),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    minWidth: 50,
                    color: Color(0xff1A3C7B),
                    onPressed: () {},
                    child: Text(
                      'Localizzami',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    color: Color(0xff1A3C7B),
                    onPressed: () {},
                    child: Text(
                      'Bar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    minWidth: 50,
                    color: Color(0xff1A3C7B),
                    onPressed: () {},
                    child: Text(
                      'Etnico',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    color: Color(0xff1A3C7B),
                    onPressed: () {},
                    child: Text(
                      'Restaurant',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    minWidth: 50,
                    color: Color(0xff1A3C7B),
                    onPressed: () {},
                    child: Text(
                      'Pizza',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GoogleMap(
                      onMapCreated: (controller) {
                        setState(() {
                          mapController = controller;
                        });
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            41.9551513, 12.6971716), // Initial map coordinates
                        zoom: 6.0,
                      ),
                      markers: Set<Marker>.of(markers),
                    ),
                  ),
          ],
        ));
  }
}
