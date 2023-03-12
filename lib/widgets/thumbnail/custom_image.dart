import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

Image customImage(String? path, {BoxFit fit = BoxFit.contain}) {
  return Image(
    image: path == null ? null : customAdvanceNetworkImage(path),
    fit: fit,
    height: 200.0,
  );
}

dynamic customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}
