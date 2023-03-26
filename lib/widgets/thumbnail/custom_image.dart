import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

Image customImage(String? path, {BoxFit fit = BoxFit.contain}) {
  return Image(
    image: path == null
        ? customAdvanceNetworkImage(
            'https://caltech-prod.s3.amazonaws.com/main/images/CollinCamerer-ShortSelling-0.2e16d0ba.fill-1600x810-c100.jpg')
        : customAdvanceNetworkImage(path),
    fit: fit,
    height: 200.0,
  );
}

dynamic customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}
