import 'package:equatable/equatable.dart';

class LandInfo extends Equatable {
  final String time;
  final String imageUrl;
  final String dimention;
  final String colorCode;
  final String landId;
  final double latitude;
  final double longitude;
  final String owner;
  final String founder;
  final String tokenId;
  final String tokenStandard;
  final String chain;
  final String qrcode;

  const LandInfo({
    required this.time,
    required this.imageUrl,
    required this.dimention,
    required this.colorCode,
    required this.landId,
    required this.latitude,
    required this.longitude,
    required this.owner,
    required this.founder,
    required this.tokenId,
    required this.tokenStandard,
    required this.chain,
    required this.qrcode,
  });

  @override
  List<Object?> get props => [
        time,
        imageUrl,
        dimention,
        colorCode,
        landId,
        latitude,
        longitude,
        owner,
        founder,
        tokenId,
        tokenStandard,
        chain,
        qrcode
      ];
}
