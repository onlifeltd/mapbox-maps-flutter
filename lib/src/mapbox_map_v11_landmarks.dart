part of mapbox_maps_flutter;

/// https://www.mapbox.com/blog/global-cities-3d-landmarks
class Landmark {
  /// 17.65/48.853116/2.3499/-18.4/37
  static final cathedralNotreDame = Landmark(
    lat: 48.853116,
    lng: 2.3499,
    zoom: 17.65,
    bearing: -18.4,
    pitch: 37.0,
  );

  /// 15.87/35.678623/139.763192/-145/67
  static final tokyo = Landmark(
    lat: 35.678623,
    lng: 139.763192,
    zoom: 14.87,
    bearing: -145,
    pitch: 67,
    direction: -1.0,
  );

  /// London Stadium on https://labs.mapbox.com/standard-style/#16.52/51.538666/-0.016409/45.7/47
  static final londonStadium = Landmark(
    lat: 51.538666,
    lng: -0.016409,
    zoom: 16.52,
    bearing: 45.7,
    pitch: 47,
  );

  final double lat;
  final double lng;
  final double zoom;
  final double bearing;
  final double pitch;
  final double direction;

  Landmark(
      {required this.lat,
        required this.lng,
        required this.zoom,
        required this.bearing,
        required this.pitch,
        this.direction = 1.0,
      });
}

