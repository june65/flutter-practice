import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

var latitude = "";
var longitude = "";


Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
    return position;
  }
 

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
            print(latitude);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart), // 장바구니 아이콘 생성
            onPressed: () {
              // 아이콘 버튼 실행
              print(longitude);
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
         myLocationEnabled: false,
         myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

Location location = new Location();

bool _serviceEnabled;
PermissionStatus _permissionGranted;
LocationData _locationData;

_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return;
  }
}

_permissionGranted = await location.hasPermission();
//권한 상태를 확인합니다. 
if (_permissionGranted == PermissionStatus.denied) {
  // 권한이 없으면 권한을 요청합니다.
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    // 권한이 없으면 위치정보를 사용할 수 없어 위치정보를 사용하려는 코드에서 에러가 나기때문에 종료합니다.
    return;
  }
}


_locationData = await location.getLocation();
//_locationData에는 위도, 경도, 위치의 정확도, 고도, 속도, 방향 시간등의 정보가 담겨있습니다.