part of mapbox_maps_flutter;

/// Part of the icon placed closest to the anchor.
enum IconAnchor {
  /// The center of the icon is placed closest to the anchor.
  CENTER,

  /// The left side of the icon is placed closest to the anchor.
  LEFT,

  /// The right side of the icon is placed closest to the anchor.
  RIGHT,

  /// The top of the icon is placed closest to the anchor.
  TOP,

  /// The bottom of the icon is placed closest to the anchor.
  BOTTOM,

  /// The top left corner of the icon is placed closest to the anchor.
  TOP_LEFT,

  /// The top right corner of the icon is placed closest to the anchor.
  TOP_RIGHT,

  /// The bottom left corner of the icon is placed closest to the anchor.
  BOTTOM_LEFT,

  /// The bottom right corner of the icon is placed closest to the anchor.
  BOTTOM_RIGHT,
}

/// Orientation of icon when map is pitched.
enum IconPitchAlignment {
  /// The icon is aligned to the plane of the map.
  MAP,

  /// The icon is aligned to the plane of the viewport.
  VIEWPORT,

  /// Automatically matches the value of {@link ICON_ROTATION_ALIGNMENT}.
  AUTO,
}

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
enum IconRotationAlignment {
  /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns icons east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns icon x-axes with the line.
  MAP,

  /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
  VIEWPORT,

  /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#ICON_ROTATION_ALIGNMENT_MAP}.
  AUTO,
}

/// Scales the icon to fit around the associated text.
enum IconTextFit {
  /// The icon is displayed at its intrinsic aspect ratio.
  NONE,

  /// The icon is scaled in the x-dimension to fit the width of the text.
  WIDTH,

  /// The icon is scaled in the y-dimension to fit the height of the text.
  HEIGHT,

  /// The icon is scaled in both x- and y-dimensions.
  BOTH,
}

/// Label placement relative to its geometry.
enum SymbolPlacement {
  /// The label is placed at the point where the geometry is located.
  POINT,

  /// The label is placed along the line of the geometry. Can only be used on LineString and Polygon geometries.
  LINE,

  /// The label is placed at the center of the line of the geometry. Can only be used on LineString and Polygon geometries. Note that a single feature in a vector tile may contain multiple line geometries.
  LINE_CENTER,
}

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
enum SymbolZOrder {
  /// Sorts symbols by symbol sort key if set. Otherwise, sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
  AUTO,

  /// Sorts symbols by their y-position relative to the viewport if {@link ICON_ALLOW_OVERLAP} or {@link TEXT_ALLOW_OVERLAP} is set to {@link TRUE} or {@link ICON_IGNORE_PLACEMENT} or {@link TEXT_IGNORE_PLACEMENT} is {@link FALSE}.
  VIEWPORT_Y,

  /// Sorts symbols by symbol sort key if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
  SOURCE,
}

/// Part of the text placed closest to the anchor.
enum TextAnchor {
  /// The center of the text is placed closest to the anchor.
  CENTER,

  /// The left side of the text is placed closest to the anchor.
  LEFT,

  /// The right side of the text is placed closest to the anchor.
  RIGHT,

  /// The top of the text is placed closest to the anchor.
  TOP,

  /// The bottom of the text is placed closest to the anchor.
  BOTTOM,

  /// The top left corner of the text is placed closest to the anchor.
  TOP_LEFT,

  /// The top right corner of the text is placed closest to the anchor.
  TOP_RIGHT,

  /// The bottom left corner of the text is placed closest to the anchor.
  BOTTOM_LEFT,

  /// The bottom right corner of the text is placed closest to the anchor.
  BOTTOM_RIGHT,
}

/// Text justification options.
enum TextJustify {
  /// The text is aligned towards the anchor position.
  AUTO,

  /// The text is aligned to the left.
  LEFT,

  /// The text is centered.
  CENTER,

  /// The text is aligned to the right.
  RIGHT,
}

/// Orientation of text when map is pitched.
enum TextPitchAlignment {
  /// The text is aligned to the plane of the map.
  MAP,

  /// The text is aligned to the plane of the viewport.
  VIEWPORT,

  /// Automatically matches the value of {@link TEXT_ROTATION_ALIGNMENT}.
  AUTO,
}

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
enum TextRotationAlignment {
  /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, aligns text east-west. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, aligns text x-axes with the line.
  MAP,

  /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of {@link SYMBOL_PLACEMENT}.
  VIEWPORT,

  /// When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_POINT}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_VIEWPORT}. When {@link SYMBOL_PLACEMENT} is set to {@link Property#SYMBOL_PLACEMENT_LINE} or {@link Property#SYMBOL_PLACEMENT_LINE_CENTER}, this is equivalent to {@link Property#TEXT_ROTATION_ALIGNMENT_MAP}.
  AUTO,
}

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
enum TextTransform {
  /// The text is not altered.
  NONE,

  /// Forces all letters to be displayed in uppercase.
  UPPERCASE,

  /// Forces all letters to be displayed in lowercase.
  LOWERCASE,
}

/// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
enum TextVariableAnchor {
  /// The center of the text is placed closest to the anchor.
  CENTER,

  /// The left side of the text is placed closest to the anchor.
  LEFT,

  /// The right side of the text is placed closest to the anchor.
  RIGHT,

  /// The top of the text is placed closest to the anchor.
  TOP,

  /// The bottom of the text is placed closest to the anchor.
  BOTTOM,

  /// The top left corner of the text is placed closest to the anchor.
  TOP_LEFT,

  /// The top right corner of the text is placed closest to the anchor.
  TOP_RIGHT,

  /// The bottom left corner of the text is placed closest to the anchor.
  BOTTOM_LEFT,

  /// The bottom right corner of the text is placed closest to the anchor.
  BOTTOM_RIGHT,
}

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
enum TextWritingMode {
  /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
  HORIZONTAL,

  /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
  VERTICAL,
}

/// Controls the frame of reference for `icon-translate`.
enum IconTranslateAnchor {
  /// Icons are translated relative to the map.
  MAP,

  /// Icons are translated relative to the viewport.
  VIEWPORT,
}

/// Controls the frame of reference for `text-translate`.
enum TextTranslateAnchor {
  /// The text is translated relative to the map.
  MAP,

  /// The text is translated relative to the viewport.
  VIEWPORT,
}

class PointAnnotation {
  PointAnnotation({
    required this.id,
    this.geometry,
    this.image,
    this.iconAnchor,
    this.iconImage,
    this.iconOffset,
    this.iconRotate,
    this.iconSize,
    this.iconTextFit,
    this.iconTextFitPadding,
    this.symbolSortKey,
    this.textAnchor,
    this.textField,
    this.textJustify,
    this.textLetterSpacing,
    this.textLineHeight,
    this.textMaxWidth,
    this.textOffset,
    this.textRadialOffset,
    this.textRotate,
    this.textSize,
    this.textTransform,
    this.iconColor,
    this.iconEmissiveStrength,
    this.iconHaloBlur,
    this.iconHaloColor,
    this.iconHaloWidth,
    this.iconImageCrossFade,
    this.iconOpacity,
    this.textColor,
    this.textEmissiveStrength,
    this.textHaloBlur,
    this.textHaloColor,
    this.textHaloWidth,
    this.textOpacity,
  });

  /// The id for annotation
  String id;

  /// The geometry that determines the location/shape of this annotation
  Map<String?, Object?>? geometry;

  /// The bitmap image for this Annotation
  /// Will not take effect if [iconImage] has been set.
  Uint8List? image;

  /// Part of the icon placed closest to the anchor.
  IconAnchor? iconAnchor;

  /// Name of image in sprite to use for drawing an image background.
  String? iconImage;

  /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
  List<double?>? iconOffset;

  /// Rotates the icon clockwise.
  double? iconRotate;

  /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
  double? iconSize;

  /// Scales the icon to fit around the associated text.
  IconTextFit? iconTextFit;

  /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
  List<double?>? iconTextFitPadding;

  /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first. When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
  double? symbolSortKey;

  /// Part of the text placed closest to the anchor.
  TextAnchor? textAnchor;

  /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
  String? textField;

  /// Text justification options.
  TextJustify? textJustify;

  /// Text tracking amount.
  double? textLetterSpacing;

  /// Text leading value for multi-line text.
  double? textLineHeight;

  /// The maximum line width for text wrapping.
  double? textMaxWidth;

  /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
  List<double?>? textOffset;

  /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
  double? textRadialOffset;

  /// Rotates the text clockwise.
  double? textRotate;

  /// Font size.
  double? textSize;

  /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
  TextTransform? textTransform;

  /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
  int? iconColor;

  /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
  double? iconEmissiveStrength;

  /// Fade out the halo towards the outside.
  double? iconHaloBlur;

  /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
  int? iconHaloColor;

  /// Distance of halo to the icon outline.
  double? iconHaloWidth;

  /// Controls the transition progress between the image variants of icon-image. Zero means the first variant is used, one is the second, and in between they are blended together.
  double? iconImageCrossFade;

  /// The opacity at which the icon will be drawn.
  double? iconOpacity;

  /// The color with which the text will be drawn.
  int? textColor;

  /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
  double? textEmissiveStrength;

  /// The halo's fadeout distance towards the outside.
  double? textHaloBlur;

  /// The color of the text's halo, which helps it stand out from backgrounds.
  int? textHaloColor;

  /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
  double? textHaloWidth;

  /// The opacity at which the text will be drawn.
  double? textOpacity;

  Object encode() {
    return <Object?>[
      id,
      geometry,
      image,
      iconAnchor?.index,
      iconImage,
      iconOffset,
      iconRotate,
      iconSize,
      iconTextFit?.index,
      iconTextFitPadding,
      symbolSortKey,
      textAnchor?.index,
      textField,
      textJustify?.index,
      textLetterSpacing,
      textLineHeight,
      textMaxWidth,
      textOffset,
      textRadialOffset,
      textRotate,
      textSize,
      textTransform?.index,
      iconColor,
      iconEmissiveStrength,
      iconHaloBlur,
      iconHaloColor,
      iconHaloWidth,
      iconImageCrossFade,
      iconOpacity,
      textColor,
      textEmissiveStrength,
      textHaloBlur,
      textHaloColor,
      textHaloWidth,
      textOpacity,
    ];
  }

  static PointAnnotation decode(Object result) {
    result as List<Object?>;
    return PointAnnotation(
      id: result[0]! as String,
      geometry: (result[1] as Map<Object?, Object?>?)?.cast<String?, Object?>(),
      image: result[2] as Uint8List?,
      iconAnchor:
          result[3] != null ? IconAnchor.values[result[3]! as int] : null,
      iconImage: result[4] as String?,
      iconOffset: (result[5] as List<Object?>?)?.cast<double?>(),
      iconRotate: result[6] as double?,
      iconSize: result[7] as double?,
      iconTextFit:
          result[8] != null ? IconTextFit.values[result[8]! as int] : null,
      iconTextFitPadding: (result[9] as List<Object?>?)?.cast<double?>(),
      symbolSortKey: result[10] as double?,
      textAnchor:
          result[11] != null ? TextAnchor.values[result[11]! as int] : null,
      textField: result[12] as String?,
      textJustify:
          result[13] != null ? TextJustify.values[result[13]! as int] : null,
      textLetterSpacing: result[14] as double?,
      textLineHeight: result[15] as double?,
      textMaxWidth: result[16] as double?,
      textOffset: (result[17] as List<Object?>?)?.cast<double?>(),
      textRadialOffset: result[18] as double?,
      textRotate: result[19] as double?,
      textSize: result[20] as double?,
      textTransform:
          result[21] != null ? TextTransform.values[result[21]! as int] : null,
      iconColor: result[22] as int?,
      iconEmissiveStrength: result[23] as double?,
      iconHaloBlur: result[24] as double?,
      iconHaloColor: result[25] as int?,
      iconHaloWidth: result[26] as double?,
      iconImageCrossFade: result[27] as double?,
      iconOpacity: result[28] as double?,
      textColor: result[29] as int?,
      textEmissiveStrength: result[30] as double?,
      textHaloBlur: result[31] as double?,
      textHaloColor: result[32] as int?,
      textHaloWidth: result[33] as double?,
      textOpacity: result[34] as double?,
    );
  }
}

class PointAnnotationOptions {
  PointAnnotationOptions({
    this.geometry,
    this.image,
    this.iconAnchor,
    this.iconImage,
    this.iconOffset,
    this.iconRotate,
    this.iconSize,
    this.iconTextFit,
    this.iconTextFitPadding,
    this.symbolSortKey,
    this.textAnchor,
    this.textField,
    this.textJustify,
    this.textLetterSpacing,
    this.textLineHeight,
    this.textMaxWidth,
    this.textOffset,
    this.textRadialOffset,
    this.textRotate,
    this.textSize,
    this.textTransform,
    this.iconColor,
    this.iconEmissiveStrength,
    this.iconHaloBlur,
    this.iconHaloColor,
    this.iconHaloWidth,
    this.iconImageCrossFade,
    this.iconOpacity,
    this.textColor,
    this.textEmissiveStrength,
    this.textHaloBlur,
    this.textHaloColor,
    this.textHaloWidth,
    this.textOpacity,
  });

  /// The geometry that determines the location/shape of this annotation
  Map<String?, Object?>? geometry;

  /// The bitmap image for this Annotation
  /// Will not take effect if [iconImage] has been set.
  Uint8List? image;

  /// Part of the icon placed closest to the anchor.
  IconAnchor? iconAnchor;

  /// Name of image in sprite to use for drawing an image background.
  String? iconImage;

  /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
  List<double?>? iconOffset;

  /// Rotates the icon clockwise.
  double? iconRotate;

  /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
  double? iconSize;

  /// Scales the icon to fit around the associated text.
  IconTextFit? iconTextFit;

  /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
  List<double?>? iconTextFitPadding;

  /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first. When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
  double? symbolSortKey;

  /// Part of the text placed closest to the anchor.
  TextAnchor? textAnchor;

  /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
  String? textField;

  /// Text justification options.
  TextJustify? textJustify;

  /// Text tracking amount.
  double? textLetterSpacing;

  /// Text leading value for multi-line text.
  double? textLineHeight;

  /// The maximum line width for text wrapping.
  double? textMaxWidth;

  /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
  List<double?>? textOffset;

  /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
  double? textRadialOffset;

  /// Rotates the text clockwise.
  double? textRotate;

  /// Font size.
  double? textSize;

  /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
  TextTransform? textTransform;

  /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
  int? iconColor;

  /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
  double? iconEmissiveStrength;

  /// Fade out the halo towards the outside.
  double? iconHaloBlur;

  /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
  int? iconHaloColor;

  /// Distance of halo to the icon outline.
  double? iconHaloWidth;

  /// Controls the transition progress between the image variants of icon-image. Zero means the first variant is used, one is the second, and in between they are blended together.
  double? iconImageCrossFade;

  /// The opacity at which the icon will be drawn.
  double? iconOpacity;

  /// The color with which the text will be drawn.
  int? textColor;

  /// Controls the intensity of light emitted on the source features. This property works only with 3D light, i.e. when `lights` root property is defined.
  double? textEmissiveStrength;

  /// The halo's fadeout distance towards the outside.
  double? textHaloBlur;

  /// The color of the text's halo, which helps it stand out from backgrounds.
  int? textHaloColor;

  /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
  double? textHaloWidth;

  /// The opacity at which the text will be drawn.
  double? textOpacity;

  Object encode() {
    return <Object?>[
      geometry,
      image,
      iconAnchor?.index,
      iconImage,
      iconOffset,
      iconRotate,
      iconSize,
      iconTextFit?.index,
      iconTextFitPadding,
      symbolSortKey,
      textAnchor?.index,
      textField,
      textJustify?.index,
      textLetterSpacing,
      textLineHeight,
      textMaxWidth,
      textOffset,
      textRadialOffset,
      textRotate,
      textSize,
      textTransform?.index,
      iconColor,
      iconEmissiveStrength,
      iconHaloBlur,
      iconHaloColor,
      iconHaloWidth,
      iconImageCrossFade,
      iconOpacity,
      textColor,
      textEmissiveStrength,
      textHaloBlur,
      textHaloColor,
      textHaloWidth,
      textOpacity,
    ];
  }

  static PointAnnotationOptions decode(Object result) {
    result as List<Object?>;
    return PointAnnotationOptions(
      geometry: (result[0] as Map<Object?, Object?>?)?.cast<String?, Object?>(),
      image: result[1] as Uint8List?,
      iconAnchor:
          result[2] != null ? IconAnchor.values[result[2]! as int] : null,
      iconImage: result[3] as String?,
      iconOffset: (result[4] as List<Object?>?)?.cast<double?>(),
      iconRotate: result[5] as double?,
      iconSize: result[6] as double?,
      iconTextFit:
          result[7] != null ? IconTextFit.values[result[7]! as int] : null,
      iconTextFitPadding: (result[8] as List<Object?>?)?.cast<double?>(),
      symbolSortKey: result[9] as double?,
      textAnchor:
          result[10] != null ? TextAnchor.values[result[10]! as int] : null,
      textField: result[11] as String?,
      textJustify:
          result[12] != null ? TextJustify.values[result[12]! as int] : null,
      textLetterSpacing: result[13] as double?,
      textLineHeight: result[14] as double?,
      textMaxWidth: result[15] as double?,
      textOffset: (result[16] as List<Object?>?)?.cast<double?>(),
      textRadialOffset: result[17] as double?,
      textRotate: result[18] as double?,
      textSize: result[19] as double?,
      textTransform:
          result[20] != null ? TextTransform.values[result[20]! as int] : null,
      iconColor: result[21] as int?,
      iconEmissiveStrength: result[22] as double?,
      iconHaloBlur: result[23] as double?,
      iconHaloColor: result[24] as int?,
      iconHaloWidth: result[25] as double?,
      iconImageCrossFade: result[26] as double?,
      iconOpacity: result[27] as double?,
      textColor: result[28] as int?,
      textEmissiveStrength: result[29] as double?,
      textHaloBlur: result[30] as double?,
      textHaloColor: result[31] as int?,
      textHaloWidth: result[32] as double?,
      textOpacity: result[33] as double?,
    );
  }
}

/// Options to configure point annotation clustering with PointAnnotationManager.
///
/// ClusterOptions exposes a minimal of configuration options, a more advanced setup can be created manually with
/// using CircleLayer and SymbolLayers directly.
class ClusterOptions {
  ClusterOptions({
    this.circleRadiusExpression,
    this.circleColorExpression,
    this.textColorExpression,
    this.textSizeExpression,
    this.textFieldExpression,
    this.clusterMaxZoom,
    this.clusterRadius,
    // this.clusterProperties,
  });

  /// The circle radius of the cluster items, 18 by default. Units in pixels.
  final String? circleRadiusExpression;

  /// The circle color, black by default.
  final String? circleColorExpression;

  /// The text color of cluster item, white by default
  final String? textColorExpression;

  /// The text size of cluster item, 12 by default. Units in pixels.
  final String? textSizeExpression;

  /// Value to use for a text label of the cluster. `get("point_count")` by default which
  /// will show the count of points in the cluster
  final String? textFieldExpression;

  /// Radius of each cluster if clustering is enabled. A value of 512 indicates a radius equal
  /// to the width of a tile, 50 by default. Value must be greater than or equal to 0.
  final double? clusterRadius;

  /// Max zoom on which to cluster points if clustering is enabled. Defaults to one zoom less
  /// than maxzoom (so that last zoom features are not clustered). Clusters are re-evaluated at integer zoom
  /// levels so setting clusterMaxZoom to 14 means the clusters will be displayed until z15.
  final double? clusterMaxZoom;

  /// An object defining custom properties on the generated clusters if clustering is enabled, aggregating values from
  /// clustered points. Has the form `{"property_name": [operator, map_expression]}`.
  /// `operator` is any expression function that accepts at
  /// least 2 operands (e.g. `"+"` or `"max"`) — it accumulates the property value from clusters/points the
  /// cluster contains; `map_expression` produces the value of a single point. Example:
  ///
  /// ``Expression`` syntax:
  /// ```
  /// let expression = Exp(.sum) {
  ///     Exp(.get) { "scalerank" }
  /// }
  /// clusterProperties: ["sum": expression]
  /// ```
  ///
  /// JSON syntax:
  /// `{"sum": ["+", ["get", "scalerank"]]}`
  ///
  /// For more advanced use cases, in place of `operator`, you can use a custom reduce expression that references a special `["accumulated"]` value. Example:
  ///
  /// ``Expression`` syntax:
  /// ```
  /// let expression = Exp {
  ///     Exp(.sum) {
  ///         Exp(.accumulated)
  ///         Exp(.get) { "sum" }
  ///     }
  ///     Exp(.get) { "scalerank" }
  /// }
  /// clusterProperties: ["sum": expression]
  /// ```
  ///
  /// JSON syntax:
  /// `{"sum": [["+", ["accumulated"], ["get", "sum"]], ["get", "scalerank"]]}`
  // final Map<String, String>? clusterProperties;

  Map<String, dynamic> toMap() {
    return {
      if (circleRadiusExpression != null)
        'circleRadiusExpression': circleRadiusExpression,
      if (circleColorExpression != null)
        'circleColorExpression': circleColorExpression,
      if (textColorExpression != null)
        'textColorExpression': textColorExpression,
      if (textSizeExpression != null) 'textSizeExpression': textSizeExpression,
      if (textFieldExpression != null)
        'textFieldExpression': textFieldExpression,
      if (clusterMaxZoom != null) 'clusterMaxZoom': clusterMaxZoom,
      if (clusterRadius != null) 'clusterRadius': clusterRadius,
      // if (clusterProperties != null) 'clusterProperties': clusterProperties,
    };
  }
}

class _OnPointAnnotationClickListenerCodec extends StandardMessageCodec {
  const _OnPointAnnotationClickListenerCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PointAnnotation) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return PointAnnotation.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class OnPointAnnotationClickListener {
  static const MessageCodec<Object?> codec =
      _OnPointAnnotationClickListenerCodec();

  void onPointAnnotationClick(PointAnnotation annotation);

  static void setup(OnPointAnnotationClickListener? api,
      {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.OnPointAnnotationClickListener.onPointAnnotationClick',
          codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.OnPointAnnotationClickListener.onPointAnnotationClick was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PointAnnotation? arg_annotation = (args[0] as PointAnnotation?);
          assert(arg_annotation != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.OnPointAnnotationClickListener.onPointAnnotationClick was null, expected non-null PointAnnotation.');
          api.onPointAnnotationClick(arg_annotation!);
          return;
        });
      }
    }
  }
}

class __PointAnnotationMessagerCodec extends StandardMessageCodec {
  const __PointAnnotationMessagerCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PointAnnotation) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PointAnnotationOptions) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return PointAnnotation.decode(readValue(buffer)!);
      case 129:
        return PointAnnotationOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class _PointAnnotationMessager {
  /// Constructor for [_PointAnnotationMessager].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  _PointAnnotationMessager({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = __PointAnnotationMessagerCodec();

  Future<PointAnnotation> create(
      String arg_managerId, PointAnnotationOptions arg_annotationOption) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.create',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_annotationOption]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as PointAnnotation?)!;
    }
  }

  Future<List<PointAnnotation?>> createMulti(String arg_managerId,
      List<PointAnnotationOptions?> arg_annotationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.createMulti',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId, arg_annotationOptions])
            as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as List<Object?>?)!.cast<PointAnnotation?>();
    }
  }

  Future<void> update(
      String arg_managerId, PointAnnotation arg_annotation) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.update',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_annotation]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> delete(
      String arg_managerId, PointAnnotation arg_annotation) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.delete',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_annotation]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> deleteAll(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.deleteAll',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setIconAllowOverlap(
      String arg_managerId, bool arg_iconAllowOverlap) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconAllowOverlap',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_iconAllowOverlap]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getIconAllowOverlap(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconAllowOverlap',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setIconIgnorePlacement(
      String arg_managerId, bool arg_iconIgnorePlacement) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconIgnorePlacement',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId, arg_iconIgnorePlacement])
            as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getIconIgnorePlacement(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconIgnorePlacement',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setIconKeepUpright(
      String arg_managerId, bool arg_iconKeepUpright) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconKeepUpright',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_iconKeepUpright]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getIconKeepUpright(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconKeepUpright',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setIconOptional(
      String arg_managerId, bool arg_iconOptional) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconOptional',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_iconOptional]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getIconOptional(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconOptional',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setIconPadding(
      String arg_managerId, double arg_iconPadding) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconPadding',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_iconPadding]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<double?> getIconPadding(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconPadding',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as double?);
    }
  }

  Future<void> setIconPitchAlignment(
      String arg_managerId, IconPitchAlignment arg_iconPitchAlignment) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconPitchAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_managerId, arg_iconPitchAlignment.index])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<IconPitchAlignment?> getIconPitchAlignment(
      String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconPitchAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : IconPitchAlignment.values[replyList[0]! as int];
    }
  }

  Future<void> setIconRotationAlignment(String arg_managerId,
      IconRotationAlignment arg_iconRotationAlignment) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconRotationAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_managerId, arg_iconRotationAlignment.index])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<IconRotationAlignment?> getIconRotationAlignment(
      String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconRotationAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : IconRotationAlignment.values[replyList[0]! as int];
    }
  }

  Future<void> setSymbolAvoidEdges(
      String arg_managerId, bool arg_symbolAvoidEdges) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setSymbolAvoidEdges',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_symbolAvoidEdges]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getSymbolAvoidEdges(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getSymbolAvoidEdges',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setSymbolPlacement(
      String arg_managerId, SymbolPlacement arg_symbolPlacement) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setSymbolPlacement',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId, arg_symbolPlacement.index])
            as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<SymbolPlacement?> getSymbolPlacement(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getSymbolPlacement',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : SymbolPlacement.values[replyList[0]! as int];
    }
  }

  Future<void> setSymbolSpacing(
      String arg_managerId, double arg_symbolSpacing) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setSymbolSpacing',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_symbolSpacing]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<double?> getSymbolSpacing(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getSymbolSpacing',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as double?);
    }
  }

  Future<void> setSymbolZElevate(
      String arg_managerId, bool arg_symbolZElevate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setSymbolZElevate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_symbolZElevate]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getSymbolZElevate(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getSymbolZElevate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setSymbolZOrder(
      String arg_managerId, SymbolZOrder arg_symbolZOrder) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setSymbolZOrder',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId, arg_symbolZOrder.index])
            as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<SymbolZOrder?> getSymbolZOrder(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getSymbolZOrder',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : SymbolZOrder.values[replyList[0]! as int];
    }
  }

  Future<void> setTextAllowOverlap(
      String arg_managerId, bool arg_textAllowOverlap) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextAllowOverlap',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textAllowOverlap]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getTextAllowOverlap(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextAllowOverlap',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setTextFont(
      String arg_managerId, List<String?> arg_textFont) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextFont',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textFont]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<List<String?>?> getTextFont(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextFont',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as List<Object?>?)?.cast<String?>();
    }
  }

  Future<void> setTextIgnorePlacement(
      String arg_managerId, bool arg_textIgnorePlacement) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextIgnorePlacement',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId, arg_textIgnorePlacement])
            as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getTextIgnorePlacement(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextIgnorePlacement',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setTextKeepUpright(
      String arg_managerId, bool arg_textKeepUpright) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextKeepUpright',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textKeepUpright]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getTextKeepUpright(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextKeepUpright',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setTextMaxAngle(
      String arg_managerId, double arg_textMaxAngle) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextMaxAngle',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textMaxAngle]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<double?> getTextMaxAngle(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextMaxAngle',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as double?);
    }
  }

  Future<void> setTextOptional(
      String arg_managerId, bool arg_textOptional) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextOptional',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textOptional]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool?> getTextOptional(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextOptional',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as bool?);
    }
  }

  Future<void> setTextPadding(
      String arg_managerId, double arg_textPadding) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextPadding',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textPadding]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<double?> getTextPadding(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextPadding',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as double?);
    }
  }

  Future<void> setTextPitchAlignment(
      String arg_managerId, TextPitchAlignment arg_textPitchAlignment) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextPitchAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_managerId, arg_textPitchAlignment.index])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<TextPitchAlignment?> getTextPitchAlignment(
      String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextPitchAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : TextPitchAlignment.values[replyList[0]! as int];
    }
  }

  Future<void> setTextRotationAlignment(String arg_managerId,
      TextRotationAlignment arg_textRotationAlignment) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextRotationAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_managerId, arg_textRotationAlignment.index])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<TextRotationAlignment?> getTextRotationAlignment(
      String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextRotationAlignment',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : TextRotationAlignment.values[replyList[0]! as int];
    }
  }

  Future<void> setIconTranslate(
      String arg_managerId, List<double?> arg_iconTranslate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconTranslate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_iconTranslate]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<List<double?>?> getIconTranslate(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconTranslate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as List<Object?>?)?.cast<double?>();
    }
  }

  Future<void> setIconTranslateAnchor(
      String arg_managerId, IconTranslateAnchor arg_iconTranslateAnchor) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setIconTranslateAnchor',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_managerId, arg_iconTranslateAnchor.index])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<IconTranslateAnchor?> getIconTranslateAnchor(
      String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getIconTranslateAnchor',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : IconTranslateAnchor.values[replyList[0]! as int];
    }
  }

  Future<void> setTextTranslate(
      String arg_managerId, List<double?> arg_textTranslate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextTranslate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_managerId, arg_textTranslate]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<List<double?>?> getTextTranslate(String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextTranslate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as List<Object?>?)?.cast<double?>();
    }
  }

  Future<void> setTextTranslateAnchor(
      String arg_managerId, TextTranslateAnchor arg_textTranslateAnchor) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.setTextTranslateAnchor',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_managerId, arg_textTranslateAnchor.index])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<TextTranslateAnchor?> getTextTranslateAnchor(
      String arg_managerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._PointAnnotationMessager.getTextTranslateAnchor',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_managerId]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as int?) == null
          ? null
          : TextTranslateAnchor.values[replyList[0]! as int];
    }
  }
}
