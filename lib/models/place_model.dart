import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({
    required this.id,
    required this.name,
    required this.latLng,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: 'شرشابة',
    latLng: const LatLng(30.79093040405956, 31.172998110032424),
  ),
  PlaceModel(
    id: 2,
    name: 'ميت حواى',
    latLng: const LatLng(30.79147731961817, 31.105640052830033),
  ),
  PlaceModel(
    id: 3,
    name: 'إشناواى',
    latLng: const LatLng(30.80379502906458, 31.05995296067951),
  ),
  PlaceModel(
    id: 4,
    name: 'القرشية',
    latLng: const LatLng(30.846278056937937, 31.12309850853358),
  ),
  PlaceModel(
    id: 5,
    name: 'صفط تراب',
    latLng: const LatLng(30.893112556436137, 31.11839821510704),
  ),
];
