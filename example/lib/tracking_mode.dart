import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mapbox_maps_example/utils.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'page.dart';

class TrackingModePage extends ExamplePage {
  TrackingModePage() : super(const Icon(Icons.map), 'Tracking Mode');

  @override
  Widget build(BuildContext context) {
    return const AnimatedRoute();
  }
}

class AnimatedRoute extends StatefulWidget {
  const AnimatedRoute();

  @override
  State createState() => AnimatedRouteState();
}

class AnimatedRouteState extends State<AnimatedRoute> with TickerProviderStateMixin {
  final defaultEdgeInsets = MbxEdgeInsets(top: 100, left: 100, bottom: 100, right: 100);

  late MapboxMap mapboxMap;
  late PointAnnotationManager pointAnnotationManager;
  Timer? timer;
  var trackLocation = true;

  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    this.pointAnnotationManager = await mapboxMap.annotations.createPointAnnotationManager();

    await _getPermission();
  }

  _getPermission() async {
    await Permission.locationWhenInUse.request();
  }

  _onStyleLoadedCallback(StyleLoadedEventData data) {
    setLocationComponent();
    refreshTrackLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    setState(() {
                      trackLocation = !trackLocation;
                      refreshTrackLocation();
                    });
                  },
                  backgroundColor: trackLocation ? Colors.blue : Colors.grey,
                  child: const Icon(FontAwesomeIcons.locationCrosshairs)),
            ],
          ),
        ),
        body: MapWidget(
          key: const ValueKey("mapWidget"),
          cameraOptions: CameraOptions(zoom: 13.0),
          styleUri: MapboxStyles.LIGHT,
          textureView: true,
          onMapCreated: _onMapCreated,
          onStyleLoadedListener: _onStyleLoadedCallback,
          onLocationChangeListener: (locationData) {
            print("Location changed: $locationData");
          },
          onTapListener: (point) {
            print("Map tapped: $point");
          },
          onLongTapListener: (point) {
            print("Map long pressed: $point");
          },
          onScrollListener: (point) {
            print("Map scrolled: $point");
          },
          onGestureDidBeginListener: (_) {
            print('onGestureDidBeginListener');
            if (trackLocation) {
              trackLocation = false;
              refreshTrackLocation();
            }
          },
        ));
  }

  setLocationComponent() async {
    await mapboxMap.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
      ),
    );
  }

  refreshTrackLocation() async {
    timer?.cancel();
    if (trackLocation) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
        final position = await mapboxMap.style.getPuckPosition();
        if (position != null) {
          setCameraPosition(position);
        }
      });
    }
  }

  setCameraPosition(Position position) {
    mapboxMap.easeTo(
        CameraOptions(
          center: Point(coordinates: position),
          padding: defaultEdgeInsets,
          zoom: 15,
        ),
        null);
  }
}
