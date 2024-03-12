import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

import 'package:web/src/dom/html.dart';

class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(38.681447133196826, 39.17822870309548);

      // another location
      final myLatlng2 = LatLng(38.681447133196826, 39.17822870309548);

      final mapOptions = MapOptions()
        ..zoom = 10
        ..center = LatLng(38.681447133196826, 39.17822870309548);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem as HTMLElement?, mapOptions);

      final marker = Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!'
        ..label = 'h'
        ..icon =
            'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');

      // Another marker
      Marker(
        MarkerOptions()
          ..position = myLatlng2
          ..map = map,
      );

      final infoWindow =
          InfoWindow(InfoWindowOptions()..content = contentString);
      marker.onClick.listen((event) => infoWindow.open(map, marker));
      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}

var contentString ="";