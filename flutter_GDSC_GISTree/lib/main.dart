import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Trash Can",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed:() {
            print("latitude");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart), // 장바구니 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행
              print("longitude");
            },
          ),
          IconButton(
            icon: Icon(Icons.search), // 검색 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행
              print('Search button is clicked');
            },
          ),
        ],
      ),
      body: GoogleMap(
        // Map type (일반, 인공위성 등등)
        mapType: MapType.normal,
        // Map 초기 위치 및 줌
        initialCameraPosition: CameraPosition(
          target: LatLng(35.229027, 126.847610),
          zoom: 17,
        ),
        // 현재 내 위치
         myLocationEnabled: true,
         myLocationButtonEnabled: true,
         zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
