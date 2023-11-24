import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'main.dart';
import 'page.dart';

class FullMapPage extends ExamplePage {
  FullMapPage() : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMap? mapboxMap;
  var isLight = true;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
    mapboxMap.subscribe(_eventObserver, [
      MapEvents.STYLE_LOADED,
      MapEvents.MAP_LOADED,
      MapEvents.MAP_IDLE,
    ]);

    mapboxMap.setStyleImportConfigProperty("lightPreset", "night");
    mapboxMap.setStyleImportConfigProperty("showPointOfInterestLabels", false);
    mapboxMap.setStyleImportConfigProperty("showTransitLabels", false);
    mapboxMap.setStyleImportConfigProperty("showPlaceLabels", false);
    mapboxMap.setStyleImportConfigProperty("showRoadLabels", false);
  }

  _eventObserver(Event event) {
    print("Receive event, type: ${event.type}, data: ${event.data}");
  }

  _onStyleLoadedCallback(StyleLoadedEventData data) {
    print("Style loaded :), begin: ${data.begin}");
  }

  _onCameraChangeListener(CameraChangedEventData data) {
    print("CameraChangedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onMapIdleListener(MapIdleEventData data) {
    print("MapIdleEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onMapLoadedListener(MapLoadedEventData data) {
    print("MapLoadedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onMapLoadingErrorListener(MapLoadingErrorEventData data) {
    print("MapLoadingErrorEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onRenderFrameStartedListener(RenderFrameStartedEventData data) {
    // print(
    //     "RenderFrameStartedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onRenderFrameFinishedListener(RenderFrameFinishedEventData data) {
    print(
        "RenderFrameFinishedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onSourceAddedListener(SourceAddedEventData data) {
    print("SourceAddedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onSourceDataLoadedListener(SourceDataLoadedEventData data) {
    print("SourceDataLoadedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onSourceRemovedListener(SourceRemovedEventData data) {
    print("SourceRemovedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onStyleDataLoadedListener(StyleDataLoadedEventData data) {
    print("StyleDataLoadedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onStyleImageMissingListener(StyleImageMissingEventData data) {
    print("StyleImageMissingEventData: begin: ${data.begin}, end: ${data.end}");
  }

  _onStyleImageUnusedListener(StyleImageUnusedEventData data) {
    print("StyleImageUnusedEventData: begin: ${data.begin}, end: ${data.end}");
  }

  static final locationLondonEye =
      Position(-0.11952504657173119, 51.50316108984406);
  static final melbourne = Position(144.97014966047533, -37.81057992982308);
  static final appleSingapore =
      Position(103.85753962019713, 1.2833916359683666);

  static final defaultPoint = appleSingapore;

  bool started = false;
  final end = CameraOptions(
    center: Point(coordinates: defaultPoint).toJson(),
    zoom: (16.5),
    pitch: (75.0),
    bearing: (130.0),
  );
  final start = CameraOptions(
    center: Point(coordinates: defaultPoint).toJson(),
    zoom: (2.0),
    pitch: (0.0),
    bearing: (0.0),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                  child: Icon(Icons.swap_horiz),
                  heroTag: null,
                  onPressed: () {
                    setState(
                      () => isLight = !isLight,
                    );
                    print("_onPointAnnotationClick, started: $started");
                    mapboxMap?.flyTo(started ? start : end,
                        MapAnimationOptions(duration: 2000, startDelay: 0));
                    started = !started;

                    // mapboxMap?.easeTo(cameraOptions, mapAnimationOptions);

                    // if (started) {
                    //   mapboxMap?.setStyleImportConfigProperty(
                    //       "lightPreset", "night");
                    // } else {
                    //   mapboxMap?.setStyleImportConfigProperty(
                    //       "lightPreset", "dusk");
                    // }

                    // print("_onPointAnnotationClick, started: $started");

                    // if (isLight) {
                    //   mapboxMap?.loadStyleURI(MapboxStyles.LIGHT);
                    // } else {
                    //   mapboxMap?.loadStyleURI(MapboxStyles.DARK);
                    // }
                  }),
              SizedBox(height: 10),
            ],
          ),
        ),
        body: MapWidget(
          key: ValueKey("mapWidget"),
          resourceOptions: ResourceOptions(accessToken: MapsDemo.ACCESS_TOKEN),
          cameraOptions: CameraOptions(
              center: Point(coordinates: defaultPoint).toJson(), zoom: 0.75),
          styleUri: 'mapbox://styles/mapbox/standard',
          textureView: true,
          onMapCreated: _onMapCreated,
          onStyleLoadedListener: _onStyleLoadedCallback,
          onCameraChangeListener: _onCameraChangeListener,
          onMapIdleListener: _onMapIdleListener,
          onMapLoadedListener: _onMapLoadedListener,
          onMapLoadErrorListener: _onMapLoadingErrorListener,
          onRenderFrameStartedListener: _onRenderFrameStartedListener,
          onRenderFrameFinishedListener: _onRenderFrameFinishedListener,
          onSourceAddedListener: _onSourceAddedListener,
          onSourceDataLoadedListener: _onSourceDataLoadedListener,
          onSourceRemovedListener: _onSourceRemovedListener,
          onStyleDataLoadedListener: _onStyleDataLoadedListener,
          onStyleImageMissingListener: _onStyleImageMissingListener,
          onStyleImageUnusedListener: _onStyleImageUnusedListener,
        ));
  }
}
