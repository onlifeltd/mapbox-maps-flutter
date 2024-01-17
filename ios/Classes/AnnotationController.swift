import Foundation
import MapboxMaps
import UIKit

public enum AnnotationControllerError: Error {
    case noManagerFound
    case noAnnotationFound
    case wrongManagerType
}

public protocol ControllerDelegate: class {
    func getManager(managerId: String) throws -> AnnotationManager
}

extension AnnotationController: AnnotationInteractionDelegate {
    func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
        let annotation = annotations.first
        switch annotation {
        case let annotation as PointAnnotation:
            self.onPointAnnotationClickListener?.onPointAnnotationClick(annotation.toFLTPointAnnotation(), completion: {_ in })
        case let annotation as CircleAnnotation:
            self.onCircleAnnotationClickListener?.onCircleAnnotationClick(annotation.toFLTCircleAnnotation(), completion: {_ in })
        case let annotation as PolygonAnnotation:
            self.onPolygonAnnotationClickListener?.onPolygonAnnotationClick(annotation.toFLTPolygonAnnotation(), completion: {_ in })
        case let annotation as PolylineAnnotation:
            self.onPolylineAnnotationClickListener?.onPolylineAnnotationClick(annotation.toFLTPolylineAnnotation(), completion: {_ in })
        default:
            print("Can't detemine the type of annotation: \(annotation)")
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
    private var onPointAnnotationClickListener: FLTOnPointAnnotationClickListener?
    private var onCircleAnnotationClickListener: FLTOnCircleAnnotationClickListener?
    private var onPolygonAnnotationClickListener: FLTOnPolygonAnnotationClickListener?
    private var onPolylineAnnotationClickListener: FLTOnPolylineAnnotationClickListener?

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

        if let manager = { () -> AnnotationManager? in
            switch type {
            case "circle":
                let circleManager = mapView.annotations.makeCircleAnnotationManager()
                circleManager.delegate = self
                return circleManager
            case "point":
                let pointManager = mapView.annotations.makePointAnnotationManager(clusterOptions: createClusterOptions(options: arguments["clusterOptions"] as? [String: Any]))
                pointManager.delegate = self
                return pointManager
            case "polygon":
                let polygonManager: PolygonAnnotationManager = mapView.annotations.makePolygonAnnotationManager()
                polygonManager.delegate = self
                return polygonManager
            case "polyline":
                let polylineManager: PolylineAnnotationManager = mapView.annotations.makePolylineAnnotationManager()
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
        FLT_CircleAnnotationMessagerSetup(messenger, circleAnnotationController)
        FLT_PointAnnotationMessagerSetup(messenger, pointAnnotationController)
        FLT_PolygonAnnotationMessagerSetup(messenger, polygonAnnotationController)
        FLT_PolylineAnnotationMessagerSetup(messenger, polylineAnnotationController)
        onPointAnnotationClickListener = FLTOnPointAnnotationClickListener.init(binaryMessenger: messenger)
        onCircleAnnotationClickListener = FLTOnCircleAnnotationClickListener.init(binaryMessenger: messenger)
        onPolygonAnnotationClickListener = FLTOnPolygonAnnotationClickListener.init(binaryMessenger: messenger)
        onPolylineAnnotationClickListener = FLTOnPolylineAnnotationClickListener.init(binaryMessenger: messenger)
    }

    func getManager(managerId: String) throws -> AnnotationManager {
        if annotationManagers[managerId] == nil {
            throw AnnotationControllerError.noManagerFound
        }
        return annotationManagers[managerId]!
    }
}
