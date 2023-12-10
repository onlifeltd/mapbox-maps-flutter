import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mapbox_maps_example/utils.dart';

import 'main.dart';
import 'page.dart';

class ClusterPointAnnotationsPage extends ExamplePage {
  ClusterPointAnnotationsPage()
      : super(const Icon(Icons.map), 'Point Annotations');

  @override
  Widget build(BuildContext context) {
    return const ClusterPointAnnotationPageBody();
  }
}

class ClusterPointAnnotationPageBody extends StatefulWidget {
  const ClusterPointAnnotationPageBody();

  @override
  State<StatefulWidget> createState() => ClusterPointAnnotationPageBodyState();
}

class AnnotationClickListener extends OnPointAnnotationClickListener {
  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    print("onAnnotationClick, id: ${annotation.id}");
  }
}

class ClusterPointAnnotationPageBodyState
    extends State<ClusterPointAnnotationPageBody> {
  ClusterPointAnnotationPageBodyState();

  MapboxMap? mapboxMap;
  PointAnnotation? pointAnnotation;
  PointAnnotationManager? pointAnnotationManager;
  int styleIndex = 1;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    mapboxMap.annotations
        .createPointAnnotationManager(
      ClusterOptions(
        circleRadiusExpression:
            '["step",["get", "point_count"],25,50,50,100,70]',
        circleColorExpression:
            '["step",["get", "point_count"],["rgb",255,0,0],10,["rgb",178,141,252],50,["rgb",125,173,62]]',
        clusterMaxZoom: 15,
        clusterRadius: 50,
        textColorExpression:
            '["step",["get", "point_count"],["rgb",30,125,211],10,["rgb",8,45,42],50,["rgb",76,43,143]]',
        textFieldExpression:
            '["case",["has", "point_count"],["concat","Count:",["get", "point_count"]], ["string", ""]]',
      ),
    )
        .then((value) async {
      pointAnnotationManager = value;
      final ByteData bytes =
          await rootBundle.load('assets/symbols/custom-icon.png');
      final Uint8List list = bytes.buffer.asUint8List();
      _createOneAnnotation(list);
      var options = <PointAnnotationOptions>[];
      for (var i = 0; i < 1000; i++) {
        options.add(PointAnnotationOptions(
            geometry: createRandomPoint().toJson(), image: list));
      }
      pointAnnotationManager?.createMulti(options);

      var carOptions = <PointAnnotationOptions>[];
      for (var i = 0; i < 20; i++) {
        carOptions.add(PointAnnotationOptions(
            geometry: createRandomPoint().toJson(), iconImage: "car-15"));
      }
      pointAnnotationManager?.createMulti(carOptions);
      pointAnnotationManager
          ?.addOnPointAnnotationClickListener(AnnotationClickListener());
    });
  }

  void _createOneAnnotation(Uint8List list) {
    pointAnnotationManager
        ?.create(PointAnnotationOptions(
            geometry: Point(
                coordinates: Position(
              0.381457,
              6.687337,
            )).toJson(),
            textField: "custom-icon",
            textOffset: [0.0, -2.0],
            textColor: Colors.red.value,
            iconSize: 1.3,
            iconOffset: [0.0, -5.0],
            symbolSortKey: 10,
            image: list))
        .then((value) => pointAnnotation = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapWidget(
        key: ValueKey("mapWidget"),
        resourceOptions: ResourceOptions(accessToken: MapsDemo.ACCESS_TOKEN),
        onMapCreated: _onMapCreated,
      ),
    );
  }
}