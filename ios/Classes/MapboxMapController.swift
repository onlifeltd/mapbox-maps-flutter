import Flutter
@_spi(Experimental) import MapboxMaps
import UIKit
//
//class EventsObserver: Observer {
//    var notificationHandler: (MapboxCoreMaps.Event) -> Void
//
//    init(with notificationHandler: @escaping (MapboxCoreMaps.Event) -> Void) {
//        self.notificationHandler = notificationHandler
//    }
//
//    func notify(for event: MapboxCoreMaps.Event) {
//        notificationHandler(event)
//    }
//}

class ProxyBinaryMessenger: NSObject, FlutterBinaryMessenger {

    let channelSuffix: String
    let messenger: FlutterBinaryMessenger
    
    init(with messenger: FlutterBinaryMessenger, channelSuffix: String) {
        self.messenger = messenger
        self.channelSuffix = channelSuffix
    }

    func send(onChannel channel: String, message: Data?, binaryReply callback: FlutterBinaryReply? = nil) {
        messenger.send(onChannel: "\(channel)\(channelSuffix)", message: message, binaryReply: callback)
    }

    func send(onChannel channel: String, message: Data?) {
        messenger.send(onChannel: "\(channel)\(channelSuffix)", message: message)
    }

    func setMessageHandlerOnChannel(_ channel: String, binaryMessageHandler handler: FlutterBinaryMessageHandler? = nil) -> FlutterBinaryMessengerConnection {
        messenger.setMessageHandlerOnChannel("\(channel)\(channelSuffix)", binaryMessageHandler: handler)
    }

    func cleanUpConnection(_ connection: FlutterBinaryMessengerConnection) {
        messenger.cleanUpConnection(connection)
    }
}

class MapboxMapController: NSObject, FlutterPlatformView {
    private var registrar: FlutterPluginRegistrar
    private var mapView: MapView
    private var mapboxMap: MapboxMap
    private var channel: FlutterMethodChannel
    private var annotationController: AnnotationController?
    private var gesturesController: GesturesController?
    private var proxyBinaryMessenger: ProxyBinaryMessenger
    
    private var cancelables = Set<AnyCancelable>()
    
    private var lightPreset = StandardLightPreset.night
    private var styleURI = StyleURI.standard
    
    private var mapStyle: MapStyle {
        MapStyle(
            uri: styleURI,
            importConfigurations: [
                .standard(
                    importId: nil,
                    lightPreset: lightPreset,
                    showPointOfInterestLabels: nil,
                    showTransitLabels: nil,
                    showPlaceLabels: nil,
                    showRoadLabels: nil)
            ]
        )
    }


    func view() -> UIView {
        return mapView
    }

    init(
        withFrame frame: CGRect,
        mapInitOptions: MapInitOptions,
        channelSuffix: Int,
        eventTypes: [String],
        arguments args: Any?,
        registrar: FlutterPluginRegistrar,
        pluginVersion: String
    ) {
        self.proxyBinaryMessenger = ProxyBinaryMessenger(with: registrar.messenger(), channelSuffix: "/map_\(channelSuffix)")

//        HttpServiceFactory.getInstance().setInterceptorForInterceptor(HttpUseragentInterceptor(pluginVersion: pluginVersion))
        
        print("mapInitOptions=\(mapInitOptions)")
        
//        let options = MapInitOptions(cameraOptions: CameraOptions(center: CLLocationCoordinate2D(latitude: 51.503279869185356, longitude: -0.11948701621587453), zoom: 15, bearing: 60.0, pitch: 45))

        mapView = MapView(frame: frame, mapInitOptions: mapInitOptions)
        mapboxMap = mapView.mapboxMap
        
        self.registrar = registrar

        channel = FlutterMethodChannel(
            name: "plugins.flutter.io",
            binaryMessenger: proxyBinaryMessenger
        )

        super.init()
        
        channel.setMethodCallHandler { [weak self] in self?.onMethodCall(methodCall: $0, result: $1) }

        let styleController = StyleController(withMapboxMap: mapboxMap)
        FLTStyleManagerSetup(proxyBinaryMessenger, styleController)

        let cameraController = CameraController(withMapboxMap: mapboxMap)
        FLT_CameraManagerSetup(proxyBinaryMessenger, cameraController)

        let mapInterfaceController = MapInterfaceController(withMapboxMap: mapboxMap)
        FLT_MapInterfaceSetup(proxyBinaryMessenger, mapInterfaceController)

        let mapProjectionController = MapProjectionController()
        FLTProjectionSetup(proxyBinaryMessenger, mapProjectionController)

        let animationController = AnimationController(withMapView: mapView)
        FLT_AnimationManagerSetup(proxyBinaryMessenger, animationController)

        let locationController = LocationController(withMapView: mapView)
        FLT_SETTINGSLocationComponentSettingsInterfaceSetup(proxyBinaryMessenger, locationController)

        gesturesController = GesturesController(withMapView: mapView)
        FLT_SETTINGSGesturesSettingsInterfaceSetup(proxyBinaryMessenger, gesturesController)

        let logoController = LogoController(withMapView: mapView)
        FLT_SETTINGSLogoSettingsInterfaceSetup(proxyBinaryMessenger, logoController)

        let attributionController = AttributionController(withMapView: mapView)
        FLT_SETTINGSAttributionSettingsInterfaceSetup(proxyBinaryMessenger, attributionController)

        let compassController = CompassController(withMapView: mapView)
        FLT_SETTINGSCompassSettingsInterfaceSetup(proxyBinaryMessenger, compassController)

        let scaleBarController = ScaleBarController(withMapView: mapView)
        FLT_SETTINGSScaleBarSettingsInterfaceSetup(proxyBinaryMessenger, scaleBarController)

        annotationController = AnnotationController(withMapView: mapView)
        annotationController!.setup(messenger: proxyBinaryMessenger)
        
        eventTypes.forEach { event in
            subscribeEvent(eventType: event)
        }
        
        styleURI = mapInitOptions.styleURI ?? styleURI
        mapView.mapboxMap.mapStyle = mapStyle
    }

    func onMethodCall(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        switch methodCall.method {
        case "map#subscribe":
//            guard let arguments = methodCall.arguments as? [String: Any] else { return }
//            guard let eventType = arguments["event"] as? String else { return }
//            mapboxMap.onEvery(MapEvents.EventKind(rawValue: eventType)!) { (event) in
//                guard let data = event.data as? [String: Any] else {return}
//                self.channel.invokeMethod(self.getEventMethodName(eventType: eventType),
//                                          arguments: self.convertDictionaryToString(dict: data))
//            }
            result(nil)
        case "annotation#create_manager":
            annotationController!.handleCreateManager(methodCall: methodCall, result: result)
        case "annotation#remove_manager":
            annotationController!.handleRemoveManager(methodCall: methodCall, result: result)
        case "gesture#add_listeners":
            gesturesController!.addListeners(messenger: proxyBinaryMessenger)
            result(nil)
        case "gesture#remove_listeners":
            gesturesController!.removeListeners()
            result(nil)
        case "setStyleImportConfigProperty":
            setStyleImportConfigProperty(methodCall: methodCall, result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func subscribeEvent(eventType: String) {
        print("event#\(eventType)")
        let invokeMethod =  { [weak self] (eventData: [String: Any]) in
            guard let self = self else {
                return
            }

            self.channel.invokeMethod(self.getEventMethodName(eventType: eventType),
                                      arguments: self.convertDictionaryToString(dict: eventData))
        }
        
        switch eventType {
        case "render-frame-started":
            mapboxMap.onRenderFrameStarted.observe { event in
                invokeMethod(["begin": Int(event.timestamp.timeIntervalSince1970), "end": 0])
            }.store(in: &cancelables);
        case "style-loaded":
            mapboxMap.onStyleLoaded.observe { event in
                invokeMethod(["begin": Int(event.timeInterval.begin.timeIntervalSince1970), "end": Int(event.timeInterval.end.timeIntervalSince1970)])
            }.store(in: &cancelables);
        default: break
        }
        
    }

    private func getEventMethodName(eventType: String) -> String {
        return "event#\(eventType)"
    }

    private func convertDictionaryToString(dict: [String: Any]) -> String {
        var result: String = ""
        do {
            let jsonData =
            try JSONSerialization.data(
                withJSONObject: dict,
                options: JSONSerialization.WritingOptions.init(rawValue: 0)
            )

            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                result = JSONString
            }
        } catch {
            result = ""
        }
        return result
    }

    private func setStyleImportConfigProperty(methodCall: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let arguments = methodCall.arguments as? [String: Any] else { return }
        guard let config = arguments["config"] as? String else { return }
        guard let value = arguments["value"] else { return }
        
        try? self.mapView.mapboxMap.setStyleImportConfigProperty(for: "basemap", config: config, value: value)
        
        result(nil)
    }
}
