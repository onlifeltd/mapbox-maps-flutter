import Foundation
@_spi(Experimental) import MapboxMaps
import UIKit

class MapInterfaceController: NSObject, FLT_MapInterface {
    func getResourceOptionsWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTResourceOptions? {
        return nil
    }

    private static let errorCode = "0"
    private var mapboxMap: MapboxMap
    init(withMapboxMap mapboxMap: MapboxMap) {
        self.mapboxMap = mapboxMap
    }

    func loadStyleURIStyleURI(_ styleURI: String, completion: @escaping (FlutterError?) -> Void) {
        self.mapboxMap.loadStyle(StyleURI(rawValue: styleURI)!) { styleResult in
            switch styleResult {
            case nil:
                completion(nil)
            case let error:
                completion(FlutterError(
                    code: "loadStyleUriError",
                    message: error?.localizedDescription ?? "",
                    details: nil
                ))
            }
        }
    }

    func loadStyleJsonStyleJson(_ styleJson: String, completion: @escaping (FlutterError?) -> Void) {
        self.mapboxMap.loadStyle(styleJson) { styleResult in
            switch styleResult {
            case nil:
                completion(nil)
            case let error:
                completion(FlutterError(
                    code: "loadStyleJsonError",
                    message: error?.localizedDescription ?? "",
                    details: nil
                ))
            }
        }
    }

    func clearData(completion: @escaping (FlutterError?) -> Void) {
        MapboxMap.clearData { result in
            if result != nil {
                completion(FlutterError(
                    code: "clearDataError",
                    message: result?.localizedDescription,
                    details: nil
                ))
            } else {
                completion(nil)
            }
        }
    }

    func setMemoryBudgetMapMemoryBudgetInMegabytes(_ mapMemoryBudgetInMegabytes: FLTMapMemoryBudgetInMegabytes?, mapMemoryBudgetInTiles: FLTMapMemoryBudgetInTiles?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
//        if mapMemoryBudgetInMegabytes != nil {
//            self.mapboxMap.setMemoryBudget(MapMemoryBudget.fromMapMemoryBudget(mapMemoryBudgetInMegabytes!.toMapMemoryBudgetInMegabytes()))
//        } else if mapMemoryBudgetInTiles != nil {
//            self.mapboxMap.setMemoryBudget(MapMemoryBudget.fromMapMemoryBudget(mapMemoryBudgetInTiles!.toTMapMemoryBudgetInTiles()))
//        }
    }

    func getSizeWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTSize? {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
        return nil
    }

    func triggerRepaintWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        self.mapboxMap.triggerRepaint()
    }

    func setGestureInProgressInProgress(_ inProgress: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        if inProgress.boolValue {
            self.mapboxMap.beginGesture()
        } else {
            self.mapboxMap.endGesture()
        }
    }

    func isGestureInProgressWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
        return false
    }

    func setUserAnimationInProgressInProgress(_ inProgress: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        if inProgress.boolValue {
            self.mapboxMap.beginAnimation()
        } else {
            self.mapboxMap.endAnimation()
        }
    }

    func isUserAnimationInProgressWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
        return false
    }

    func setPrefetchZoomDeltaDelta(_ delta: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        self.mapboxMap.prefetchZoomDelta = delta.uint8Value
    }

    func getPrefetchZoomDeltaWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        return NSNumber(value: self.mapboxMap.prefetchZoomDelta)
    }

    func setNorthOrientationOrientation(_ orientation: FLTNorthOrientation, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
    }

    func setConstrainModeMode(_ mode: FLTConstrainMode, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
    }

    func setViewportModeMode(_ mode: FLTViewportMode, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
    }

    func getMapOptionsWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTMapOptions? {
        return self.mapboxMap.options.toFLTMapOptions()
    }

    func getDebugWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> [FLTMapDebugOptions]? {
        return self.mapboxMap.debugOptions.map {$0.toFLTMapDebugOptions()}
    }

    func setDebugDebugOptions(_ debugOptions: [FLTMapDebugOptions], value: NSNumber, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        self.mapboxMap.debugOptions = debugOptions.map {$0.toMapDebugOptions()}
    }

    func queryRenderedFeaturesGeometry(_ geometry: FLTRenderedQueryGeometry, options: FLTRenderedQueryOptions, completion: @escaping ([FLTQueriedFeature]?, FlutterError?) -> Void) {
        do {
            if geometry.type == FLTType.SCREEN_BOX {
                let screenBoxArray = convertStringToArray(properties: geometry.value)
                guard let minCoord = screenBoxArray[0] as? [Double] else {return}
                guard let maxCoord = screenBoxArray[1] as? [Double] else {return}

                let screenBox = ScreenBox(min: ScreenCoordinate(x: minCoord[0], y: minCoord[1]),
                                          max: ScreenCoordinate(x: maxCoord[0], y: maxCoord[1]))
                let cgRect = screenBox.toCGRect()
                let queryOptions = try options.toRenderedQueryOptions()
                self.mapboxMap.queryRenderedFeatures(with: cgRect, options: queryOptions) { result in
                    switch result {
                    case .success(let features):
                        completion(features.compactMap({$0.toFLTQueriedFeature()}), nil)
                    case .failure(let error):
                        completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
                    }
                }

            } else if geometry.type == FLTType.SCREEN_COORDINATE {
                guard let pointArray = convertStringToArray(properties: geometry.value) as? [Double] else {return}
                let cgPoint = CGPoint(x: pointArray[0], y: pointArray[1])

                try self.mapboxMap.queryRenderedFeatures(with: cgPoint, options: options.toRenderedQueryOptions()) { result in
                    switch result {
                    case .success(let features):
                        completion(features.map({$0.toFLTQueriedFeature()}), nil)
                    case .failure(let error):
                        completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
                    }
                }
            } else {
                let cgPoints = try JSONDecoder().decode([[Double]].self, from: geometry.value.data(using: String.Encoding.utf8)!)

                try self.mapboxMap.queryRenderedFeatures(with: cgPoints.map({CGPoint(x: $0[0], y: $0[1])}), options: options.toRenderedQueryOptions()) { result in
                    switch result {
                    case .success(let features):
                        completion(features.map({$0.toFLTQueriedFeature()}), nil)
                    case .failure(let error):
                        completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
                    }
                }
            }
        } catch {
            completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
        }
    }

    func querySourceFeaturesSourceId(_ sourceId: String, options: FLTSourceQueryOptions, completion: @escaping ([FLTQueriedFeature]?, FlutterError?) -> Void) {
        do {
            try self.mapboxMap.querySourceFeatures(for: sourceId, options: options.toSourceQueryOptions()) { result in
                switch result {
                case .success(let features):
//                    completion(features.map({$0.toFLTQueriedFeature()}), nil)
                    completion([], nil)
                case .failure(let error):
                    completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
                }
            }
        } catch {
            completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
        }
    }

    func getGeoJsonClusterLeavesSourceIdentifier(_ sourceIdentifier: String, cluster: [String: Any], limit: NSNumber?, offset: NSNumber?, completion: @escaping (FLTFeatureExtensionValue?, FlutterError?) -> Void) {

        guard let feature = convertDictionaryToFeature(dict: cluster) else {
            completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "Feature format error", details: convertDictionaryToString(dict: cluster)))
            return
        }
        self.mapboxMap.getGeoJsonClusterLeaves(forSourceId: sourceIdentifier, feature: feature, limit: limit as? UInt64 ?? 10, offset: offset as? UInt64 ?? 0) { result in
            switch result {
            case .success(let feature):
                completion(feature.toFLTFeatureExtensionValue(), nil)
            case .failure(let error):
                completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
            }
        }
    }

    func getGeoJsonClusterChildrenSourceIdentifier(_ sourceIdentifier: String, cluster: [String: Any], completion: @escaping (FLTFeatureExtensionValue?, FlutterError?) -> Void) {
        guard let feature = convertDictionaryToFeature(dict: cluster) else {
            completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "Feature format error", details: convertDictionaryToString(dict: cluster)))
            return
        }
        self.mapboxMap.getGeoJsonClusterChildren(forSourceId: sourceIdentifier, feature: feature) { result in
            switch result {
            case .success(let feature):
                completion(feature.toFLTFeatureExtensionValue(), nil)
            case .failure(let error):
                completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
            }
        }
    }

    func getGeoJsonClusterExpansionZoomSourceIdentifier(_ sourceIdentifier: String, cluster: [String: Any], completion: @escaping (FLTFeatureExtensionValue?, FlutterError?) -> Void) {
        guard let feature = convertDictionaryToFeature(dict: cluster) else {
            completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "Feature format error", details: convertDictionaryToString(dict: cluster)))
            return
        }
        self.mapboxMap.getGeoJsonClusterExpansionZoom(forSourceId: sourceIdentifier, feature: feature) { result in
            switch result {
            case .success(let feature):
                completion(feature.toFLTFeatureExtensionValue(), nil)
            case .failure(let error):
                completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
            }
        }
    }

    func setFeatureStateSourceId(_ sourceId: String, sourceLayerId: String?, featureId: String, state: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        self.mapboxMap.setFeatureState(sourceId: sourceId, sourceLayerId: sourceLayerId, featureId: featureId, state: convertStringToDictionary(properties: state)) {_ in }
    }

    func getFeatureStateSourceId(_ sourceId: String, sourceLayerId: String?, featureId: String, completion: @escaping (String?, FlutterError?) -> Void) {
        self.mapboxMap.getFeatureState(sourceId: sourceId, sourceLayerId: sourceLayerId, featureId: featureId) { result in
            switch result {
            case .success(let map):
                completion(convertDictionaryToString(dict: map), nil)
            case .failure(let error):
                completion(nil, FlutterError(code: MapInterfaceController.errorCode, message: "\(error)", details: nil))
            }
        }
    }

    func removeFeatureStateSourceId(_ sourceId: String, sourceLayerId: String?, featureId: String, stateKey: String?, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
//        self.mapboxMap.removeFeatureState(sourceId: sourceId, sourceLayerId: sourceLayerId, featureId: featureId, stateKey: stateKey, callback: (_) -> Void {})
    }

    func reduceMemoryUseWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        error.pointee = FlutterError(code: MapInterfaceController.errorCode, message: "Not available.", details: nil)
    }

//    func getResourceOptionsWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTResourceOptions? {
//        return self.mapboxMap.resourceOptions.toFLTResourceOptions()
//    }

    func getElevationCoordinate(_ coordinate: [String: Any], error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
        let number = self.mapboxMap.elevation(at: convertDictionaryToCLLocationCoordinate2D(dict: coordinate)!)
        return NSNumber(value: number!)
    }
}

struct QueryResult: Identifiable {
    struct Feature: Identifiable {
        var id = UUID()
        var props: String

        init(feature: QueriedRenderedFeature) {
            let feature = feature.queriedFeature
            var json = JSONObject()
            json["source"] = .string(feature.source)
            if let sourceLayer = feature.sourceLayer {
                json["source_layer"] = .string(sourceLayer)
            }
            if let featureJson = feature.feature.asJsonObject {
                json["feature"] = .object(featureJson)
            }

            props = json.prettyPrinted ?? ""
        }
    }
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var features: [Feature]

    init(features: [QueriedRenderedFeature], coordinate: CLLocationCoordinate2D) {
        self.features = features.map {
            Feature(feature: $0)
        }
        self.coordinate = coordinate
    }
}


extension JSONObject {
    var prettyPrinted: String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: rawValue, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }
}

extension Feature {
    var asJsonObject: JSONObject? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData)
            guard var jsonObject = jsonObject as? [String: Any?] else { return nil }
            if jsonObject.keys.contains("geometry") {
                // can be too long for example
                jsonObject["geometry"] = ["..."]
            }
            return JSONObject(rawValue: jsonObject)
        } catch {
            return nil
        }
    }
}
