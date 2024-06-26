import Foundation
import MapboxMaps
import Flutter

public enum AnnotationControllerError: Error {
    case noManagerFound
    case noAnnotationFound
    case wrongManagerType
}

public protocol ControllerDelegate: AnyObject {
    func getManager(managerId: String) throws -> AnnotationManager
}

extension AnnotationController: AnnotationInteractionDelegate {
    func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
        let annotation = annotations.first
        switch annotation {
        case let annotation as MapboxMaps.PointAnnotation:
            self.onPointAnnotationClickListener?.onPointAnnotationClick(
                annotation: annotation.toFLTPointAnnotation(),
                completion: {_ in }
            )
        case let annotation as MapboxMaps.CircleAnnotation:
            self.onCircleAnnotationClickListener?.onCircleAnnotationClick(
                annotation: annotation.toFLTCircleAnnotation(),
                completion: {_ in }
            )
        case let annotation as MapboxMaps.PolygonAnnotation:
            self.onPolygonAnnotationClickListener?.onPolygonAnnotationClick(
                annotation: annotation.toFLTPolygonAnnotation(),
                completion: {_ in }
            )
        case let annotation as MapboxMaps.PolylineAnnotation:
            self.onPolylineAnnotationClickListener?.onPolylineAnnotationClick(
                annotation: annotation.toFLTPolylineAnnotation(),
                completion: {_ in }
            )
        default:
            print("Can't detemine the type of annotation: \(String(describing: annotation))")
        }
    }
}

class AnnotationController: ControllerDelegate {
    private var mapView: MapView
    private var annotationManagers = [String: AnnotationManager]()
    private var circleAnnotationController: CircleAnnotationController?
    private var pointAnnotationController: PointAnnotationController?
    private var polygonAnnotationController: PolygonAnnotationController?
    private var polylineAnnotationController: PolylineAnnotationController?
    private var onPointAnnotationClickListener: OnPointAnnotationClickListener?
    private var onCircleAnnotationClickListener: OnCircleAnnotationClickListener?
    private var onPolygonAnnotationClickListener: OnPolygonAnnotationClickListener?
    private var onPolylineAnnotationClickListener: OnPolylineAnnotationClickListener?

    init(withMapView mapView: MapView) {
        self.mapView = mapView
        circleAnnotationController = CircleAnnotationController(withDelegate: self)
        pointAnnotationController = PointAnnotationController(withDelegate: self)
        polygonAnnotationController = PolygonAnnotationController(withDelegate: self)
        polylineAnnotationController = PolylineAnnotationController(withDelegate: self)
    }

    func createClusterOptions(options: [String: Any]?) -> ClusterOptions? {
        if (options == nil) {
            return nil;
        }

        var circleRadius: Value<Double> = .constant(18)
        var circleColor: Value<StyleColor> = .constant(StyleColor(.black))
        var textColor: Value<StyleColor> = .constant(StyleColor(.white))
        var textSize: Value<Double> = .constant(12)
        var textField: Value<String> = .expression(Exp(.get) { "point_count" })
        let clusterRadius: Double = options!["clusterRadius"] as? Double ?? 50
        let clusterMaxZoom: Double = options!["clusterMaxZoom"] as? Double ?? 14

        if let circleRadiusExpressionFromArgs = (options!["circleRadiusExpression"] as? String?) {
            if (circleRadiusExpressionFromArgs?.utf8 != nil) {
                let decodedExpression = try! JSONDecoder().decode(Expression.self, from: Data( circleRadiusExpressionFromArgs!.utf8))
                circleRadius = .expression(decodedExpression)
            }
        }
        if let circleColorExpressionFromArgs = (options!["circleColorExpression"] as? String?) {
            if (circleColorExpressionFromArgs?.utf8 != nil) {
                let decodedExpression = try! JSONDecoder().decode(Expression.self, from: Data( circleColorExpressionFromArgs!.utf8))
                circleColor = .expression(decodedExpression)
            }
        }
        if let textColorExpressionFromArgs = (options!["textColorExpression"] as? String?) {
            if (textColorExpressionFromArgs?.utf8 != nil) {
                let decodedExpression = try! JSONDecoder().decode(Expression.self, from: Data( textColorExpressionFromArgs!.utf8))
                textColor = .expression(decodedExpression)
            }
        }
        if let textSizeExpressionFromArgs = (options!["textSizeExpression"] as? String?) {
            if (textSizeExpressionFromArgs?.utf8 != nil) {
                let decodedExpression = try! JSONDecoder().decode(Expression.self, from: Data( textSizeExpressionFromArgs!.utf8))
                textSize = .expression(decodedExpression)
            }
        }
        if let textFieldExpressionFromArgs = (options!["textFieldExpression"] as? String?) {
            if (textFieldExpressionFromArgs?.utf8 != nil) {
                let decodedExpression = try! JSONDecoder().decode(Expression.self, from: Data( textFieldExpressionFromArgs!.utf8))
                textField = .expression(decodedExpression)
            }
        }

        // Select the options for clustering and pass them to the PointAnnotationManager to display
        return ClusterOptions(circleRadius: circleRadius,
                              circleColor: circleColor,
                              textColor: textColor,
                              textSize: textSize,
                              textField: textField,
                              clusterRadius: clusterRadius,
                              clusterMaxZoom: clusterMaxZoom)
    }

    func handleCreateManager(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let arguments = methodCall.arguments as? [String: Any] else { return }
        guard let type = arguments["type"] as? String else { return }
        let id = (arguments["id"] as? String) ?? String(UUID().uuidString.prefix(5))
        let belowLayerId: String?
        if let layerId = arguments["belowLayerId"] as? String, mapView.mapboxMap.layerExists(withId: layerId) {
            belowLayerId = layerId
        } else {
            belowLayerId = nil
        }

        if let manager = { () -> AnnotationManager? in
            switch type {
            case "circle":
                let circleManager = mapView.annotations.makeCircleAnnotationManager(
                    id: id,
                    layerPosition: belowLayerId.map(MapboxMaps.LayerPosition.below)
                )
                circleManager.delegate = self
                return circleManager
            case "point":
                let pointManager = mapView.annotations.makePointAnnotationManager(
                    id: id,
                    layerPosition: belowLayerId.map(MapboxMaps.LayerPosition.below),
                    clusterOptions: createClusterOptions(options: arguments["clusterOptions"] as? [String: Any])
                )
                pointManager.delegate = self
                return pointManager
            case "polygon":
                let polygonManager: PolygonAnnotationManager = mapView.annotations.makePolygonAnnotationManager(
                    id: id,
                    layerPosition: belowLayerId.map(MapboxMaps.LayerPosition.below)
                )
                polygonManager.delegate = self
                return polygonManager
            case "polyline":
                let polylineManager: PolylineAnnotationManager = mapView.annotations.makePolylineAnnotationManager(
                    id: id,
                    layerPosition: belowLayerId.map(MapboxMaps.LayerPosition.below)
                )
                polylineManager.delegate = self
                return polylineManager
            default:
                return nil
            }
        }() {
            annotationManagers[manager.id] = manager
            result(manager.id)
        } else {
            result(AnnotationControllerError.wrongManagerType)
        }
    }

    func handleRemoveManager(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let arguments = methodCall.arguments as? [String: Any] else { return }
        guard let id = arguments["id"] as? String else { return }
        annotationManagers.removeValue(forKey: id)
        mapView.annotations.removeAnnotationManager(withId: id)
        result(nil)
    }

    func setup(messenger: FlutterBinaryMessenger) {
        _CircleAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: circleAnnotationController)
        _PointAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: pointAnnotationController)
        _PolygonAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: polygonAnnotationController)
        _PolylineAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: polylineAnnotationController)
        onPointAnnotationClickListener = OnPointAnnotationClickListener(binaryMessenger: messenger)
        onCircleAnnotationClickListener = OnCircleAnnotationClickListener(binaryMessenger: messenger)
        onPolygonAnnotationClickListener = OnPolygonAnnotationClickListener(binaryMessenger: messenger)
        onPolylineAnnotationClickListener = OnPolylineAnnotationClickListener(binaryMessenger: messenger)
    }

    func tearDown(messenger: FlutterBinaryMessenger) {
        _CircleAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: nil)
        _PointAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: nil)
        _PolygonAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: nil)
        _PolylineAnnotationMessengerSetup.setUp(binaryMessenger: messenger, api: nil)
        onPointAnnotationClickListener = nil
        onCircleAnnotationClickListener = nil
        onPolygonAnnotationClickListener = nil
        onPolylineAnnotationClickListener = nil
    }

    func getManager(managerId: String) throws -> AnnotationManager {
        if annotationManagers[managerId] == nil {
            throw AnnotationControllerError.noManagerFound
        }
        return annotationManagers[managerId]!
    }
}
