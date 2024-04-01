import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Map Demo Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Open Street Map in Flutter',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: content(),
    );
  }
}

Widget content() {
  return FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(8.8932, 76.6141),
      initialZoom: 15,
      interactionOptions:
          const InteractionOptions(flags: ~InteractiveFlag.doubleTapDragZoom),
    ),
    children: [
      openStreetMapTileLayer,
      const MarkerLayer(
        markers: [
          Marker(
            point: LatLng(8.8932, 76.6150),
            width: 60,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.location_pin,
              size: 60,
              color: Colors.red,
            ),
          ),
          Marker(
            point: LatLng(8.8932, 76.6141),
            width: 60,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.location_pin,
              size: 60,
              color: Colors.red,
            ),
          ),
          Marker(
            point: LatLng(8.8932, 76.6162),
            width: 60,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.location_pin,
              size: 60,
              color: Colors.red,
            ),
          ),
        ],
      ),
    ],
  );
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
