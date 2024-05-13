import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monie_point_ui/resources/colors.dart';
import 'package:monie_point_ui/util/widget_to_bitmap.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder<BitmapDescriptor>(
                future: getCustomIcon(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    return GoogleMap(
                        style: googleMapsStyle,
                        markers: Set.from(List.generate(10, (index) {
                          final double latitude =
                              -1.286389 + random.nextDouble() * 0.2;
                          final double longitude =
                              36.817223 + random.nextDouble() * 0.3;

                          return Marker(
                              markerId: MarkerId(latitude.toString()),
                              position: LatLng(latitude, longitude),
                              icon: snapshot.data!);
                        })),
                        initialCameraPosition: const CameraPosition(
                            zoom: 12,
                            target: LatLng(
                              -1.29,
                              36.82,
                            )));
                  } else {
                    return const SizedBox();
                  }
                }),
          ),
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Saint Louis, MO',
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          // Show filter dialog
                        }),
                  )
                ],
              )),
          Positioned(
              bottom: 100,
              left: 20,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    radius: 25,
                    child: IconButton(
                        icon: const Icon(
                          Icons.filter,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Show filter dialog
                        }),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    radius: 25,
                    child: IconButton(
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Show filter dialog
                        }),
                  ),
                ],
              )),
          Positioned(
              bottom: 100,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Show filter dialog
                        }),
                    const Text('List of Variants',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 10)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

Future<BitmapDescriptor> getCustomIcon() async {
  return SizedBox(
      height: 40,
      width: 40,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
              topRight: Radius.circular(5),
            )),
        child: const Center(
            child: Icon(Icons.apartment_sharp, color: Colors.white)),
      )).toBitmapDescriptor();
}

String googleMapsStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#fc9d11"
      }
    ]
  }
]
''';
