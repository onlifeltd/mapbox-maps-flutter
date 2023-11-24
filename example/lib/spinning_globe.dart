import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'main.dart';
import 'page.dart';

class SpinningGlobePage extends ExamplePage {
  SpinningGlobePage() : super(const Icon(Icons.map), 'Spinning globe');

  @override
  Widget build(BuildContext context) {
    return const SpinningGlobe();
  }
}

class SpinningGlobe extends StatefulWidget {
  const SpinningGlobe();

  @override
  State createState() => SpinningGlobeState();
}

class SpinningGlobeState extends State<SpinningGlobe> {
  MapboxMap? mapboxMap;

  static final defaultLandmark = Landmark.tokyo;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;

    mapboxMap.setStyleImportConfigProperty("lightPreset", "night");
    mapboxMap.setStyleImportConfigProperty("showPointOfInterestLabels", false);
    mapboxMap.setStyleImportConfigProperty("showTransitLabels", false);
    mapboxMap.setStyleImportConfigProperty("showPlaceLabels", false);
    mapboxMap.setStyleImportConfigProperty("showRoadLabels", false);

    if (false) {
      _spinning(mapboxMap);
    } else {
      _opening(mapboxMap);
    }
  }

  _opening(MapboxMap mapboxMap) async {
    const secPerRevolution = 120.0;
    const distancePerSecond = 360.0 / secPerRevolution;
    const step1 = 3000;
    const step2 = 8000;

    final cameraState = await mapboxMap.getCameraState();
    final coordinates = cameraState.center['coordinates'] as List;

    Position center = Position(
      coordinates[0] as double,
      coordinates[1] as double,
    );

    final diff = distancePerSecond * step1.toDouble() / 1000.0;

    await Future.delayed(Duration(milliseconds: 100));

    await mapboxMap.easeTo(
        CameraOptions(
          center: Point(
              coordinates: Position(
            center.lng + diff,
            center.lat,
          )).toJson(),
        ),
        MapAnimationOptions(duration: step1, curve: 2));

    await Future.delayed(Duration(milliseconds: step1));

    await mapboxMap?.flyTo(
        CameraOptions(
          center: Point(
                  coordinates:
                      Position(defaultLandmark.lng, defaultLandmark.lat))
              .toJson(),
          zoom: defaultLandmark.zoom,
          pitch: defaultLandmark.pitch,
          bearing: defaultLandmark.bearing,
        ),
        MapAnimationOptions(duration: step2, curve: 3));

    await Future.delayed(Duration(milliseconds: step2));

    _hovering(mapboxMap, defaultLandmark.direction);
  }

  Timer? _hoveringTimer;
  _hovering(MapboxMap mapboxMap, double direction) {
    const minutePerRevolution = 5.0;
    const distancePerSecond = 360.0 / minutePerRevolution / 60.0;
    const intervalSecond = 1;

    final hoveringStep = () async {
      final cameraState = await mapboxMap.getCameraState();

      final targetBearing = cameraState.bearing + direction * distancePerSecond;

      await mapboxMap.easeTo(
          CameraOptions(
            bearing: targetBearing,
          ),
          MapAnimationOptions(duration: intervalSecond * 1000, curve: 3));
    };

    _hoveringTimer?.cancel();
    hoveringStep();
    _hoveringTimer =
        Timer.periodic(const Duration(seconds: intervalSecond), (timer) async {
      hoveringStep();
    });
  }

  Timer? spinningTimer;
  _spinning(MapboxMap mapboxMap) {
    const secPerRevolution = 120.0;
    const distancePerSecond = 360.0 / secPerRevolution;
    const intervalSecond = 1;

    spinningTimer?.cancel();
    spinningTimer =
        Timer.periodic(const Duration(seconds: intervalSecond), (timer) async {
      final cameraState = await mapboxMap.getCameraState();
      final coordinates = cameraState.center['coordinates'] as List;

      Position center = Position(
        coordinates[0] as double,
        coordinates[1] as double,
      );

      await mapboxMap.easeTo(
          CameraOptions(
            center: Point(
                coordinates: Position(
              center.lng + distancePerSecond * intervalSecond,
              center.lat,
            )).toJson(),
          ),
          MapAnimationOptions(duration: intervalSecond * 1000, curve: 3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: MapWidget(
      key: ValueKey("mapWidget"),
      resourceOptions: ResourceOptions(accessToken: MapsDemo.ACCESS_TOKEN),
      cameraOptions: CameraOptions(
          center: Point(
                  coordinates:
                      Position(defaultLandmark.lng, defaultLandmark.lat))
              .toJson(),
          zoom: 0.75),
      styleUri: 'mapbox://styles/mapbox/standard',
      textureView: true,
      onMapCreated: _onMapCreated,
    ));
  }
}
