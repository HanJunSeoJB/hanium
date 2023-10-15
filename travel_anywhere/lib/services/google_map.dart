import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_anywhere/screens/payment_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> _markers = [];
  Set<Polyline> _polylines = Set<Polyline>();

  List<LatLng> points = [
    LatLng(33.3116723, 126.4561858),
    LatLng(33.2486567, 126.4098625),
    LatLng(33.246961, 126.5441173),
    LatLng(33.458073, 126.9322003),
    LatLng(33.2259938, 126.3617521),
    LatLng(33.2448566, 126.5692283),
  ];

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker1'),
          position: points[0],
          infoWindow: InfoWindow(
            title: '서귀포 자연휴양림',
            snippet: '1일 오전',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('marker2'),
          position: points[1],
          infoWindow: InfoWindow(
            title: '중문관광단지',
            snippet: '1일 오후',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('marker3'),
          position: points[2],
          infoWindow: InfoWindow(
            title: '천지연폭포',
            snippet: '1일 오후',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('marker4'),
          position: points[3],
          infoWindow: InfoWindow(
            title: '성산일출봉',
            snippet: '2일 오전',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('marker5'),
          position: points[4],
          infoWindow: InfoWindow(
            title: '송악산성',
            snippet: '2일 오전',
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('marker6'),
          position: points[5],
          infoWindow: InfoWindow(
            title: '정방폭포',
            snippet: '3일 오전',
          ),
        ),
      );

      _polylines.add(
        Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          // 폴리라인 색상 및 너비 설정
          color: Colors.green,
          width: 4,
          // 지정된 좌표 포인트들을 사용하여 폴리라인 지점 설정
          points: points,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        position: points[0],
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.pop(context); // 이전 화면으로 돌아갑니다
      },
    ),
        title: Text(
          '일정리스트',
          style:
              TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          );
        },
        child: Text('예약하기', style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold)),
      ),
    ),
  ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        //구글 맵 사용
        mapType: MapType.normal, //지도 유형 설정
        markers: Set.from(_markers),
        initialCameraPosition: CameraPosition(
          target: points[0], // 카메라 초기 위치를 첫 번째 지점으로 설정
          zoom: 15,
        ),
        polylines: _polylines, //지도 초기 위치 설정
      ),
    );
  }
}
