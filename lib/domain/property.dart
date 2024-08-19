// ignore_for_file: always_put_required_named_parameters_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const factory Property({
    String? id,
    String? ownerId,
    required String name,
    required List<String> images,
    required double latitude,
    required double longitude,
    required int price,
    required int rooms,
    @Default(true) bool available,
    required DateTime createdAt,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

List<Property> dummyProperties = [
  Property(
    id: 'f47ac10b-58cc-4372-a567-0e02b2c3d479',
    ownerId: '2c1d7f0a-0e99-4c4f-91a5-94a5c61373cb',
    name: 'Sunny Villa',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Sunny+Villa+1',
      'https://dummyimage.com/600x400/000/fff&text=Sunny+Villa+2',
    ],
    latitude: 22.777037,
    longitude: 5.537962,
    price: 5000,
    rooms: 4,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'a1b2c3d4-e5f6-7g8h-9i10-jk11lm12n345',
    ownerId: 'f67e7f1c-676a-481a-932b-31f1c80a1234',
    name: 'Cozy Cottage',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Cozy+Cottage+1',
      'https://dummyimage.com/600x400/000/fff&text=Cozy+Cottage+2',
    ],
    latitude: 22.797037,
    longitude: 5.527962,
    price: 3000,
    rooms: 3,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: '9b8a7c6d-e5f4-3g2h-1i0j-kl98mn76o543',
    ownerId: '12a345b6-789c-012d-345e-f6789gh01234',
    name: 'Urban Apartment',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Urban+Apartment+1',
      'https://dummyimage.com/600x400/000/fff&text=Urban+Apartment+2',
    ],
    latitude: 22.767037,
    longitude: 5.527962,
    price: 4000,
    rooms: 2,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'c9d8e7f6-g5h4-3i2j-1k0l-mn87op65q432',
    ownerId: 'ab1c2d3e-4567-890f-gh12-ijk3lmn4o567',
    name: 'Luxury Penthouse',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Luxury+Penthouse+1',
      'https://dummyimage.com/600x400/000/fff&text=Luxury+Penthouse+2',
    ],
    latitude: 22.787037,
    longitude: 5.537962,
    price: 10000,
    rooms: 5,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'e1f2g3h4-i5j6-7k8l-9m10-nop11qr12st3',
    ownerId: '7891a2b3-c4d5-678e-9f01-gh234i567jk8',
    name: 'Beachside Bungalow',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Beachside+Bungalow+1',
      'https://dummyimage.com/600x400/000/fff&text=Beachside+Bungalow+2',
    ],
    latitude: 22.807037,
    longitude: 5.527962,
    price: 6000,
    rooms: 3,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'opq1r2s3-t4u5-6v7w-8x9y-z101a2b3c4d5',
    ownerId: 'cd34ef56-gh78-ij90-kl12-mn34op56qr78',
    name: 'Mountain Retreat',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Mountain+Retreat+1',
      'https://dummyimage.com/600x400/000/fff&text=Mountain+Retreat+2',
    ],
    latitude: 22.767037,
    longitude: 5.537962,
    price: 7000,
    rooms: 4,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'efgh1ijk-2lmn-3opq-4rst-5uvw6xyz7890',
    ownerId: '1234abcd-5678-efgh-ijkl-9012mnop3456',
    name: 'Countryside Estate',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Countryside+Estate+1',
      'https://dummyimage.com/600x400/000/fff&text=Countryside+Estate+2',
    ],
    latitude: 22.787037,
    longitude: 5.527962,
    price: 8000,
    rooms: 6,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'ijkl2mno-3pqr-4stu-5vwx-6yz7abcd8901',
    ownerId: '3456bcde-7890-fghi-jklm-0123nopq4567',
    name: 'Lakeside Cabin',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Lakeside+Cabin+1',
      'https://dummyimage.com/600x400/000/fff&text=Lakeside+Cabin+2',
    ],
    latitude: 22.807037,
    longitude: 5.537962,
    price: 4000,
    rooms: 2,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'mnop3qrs-4tuv-5wxy-6z78-9012bcde3456',
    ownerId: '4567cdef-8901-ghij-klmn-2345opqr6789',
    name: 'Suburban House',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Suburban+House+1',
      'https://dummyimage.com/600x400/000/fff&text=Suburban+House+2',
    ],
    latitude: 22.787037,
    longitude: 5.527962,
    price: 5000,
    rooms: 3,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'qrst4uvw-5xyz-6ab7-8c90-1234defg5678',
    ownerId: '5678defg-9012-hijk-lmno-3456pqrstu89',
    name: 'City Loft',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=City+Loft+1',
      'https://dummyimage.com/600x400/000/fff&text=City+Loft+2',
    ],
    latitude: 22.807037,
    longitude: 5.547962,
    price: 4000,
    rooms: 2,
    createdAt: DateTime.parse('2024-08-18'),
  ),
  Property(
    id: 'uvwx5yz1-6abc-7def-8ghi-9012jklm3456',
    ownerId: '6789efgh-0123-ijkl-mnop-4567qrst8901',
    name: 'Historic Manor',
    images: [
      'https://dummyimage.com/600x400/000/fff&text=Historic+Manor+1',
      'https://dummyimage.com/600x400/000/fff&text=Historic+Manor+2',
    ],
    latitude: 22.827037,
    longitude: 5.537962,
    price: 9000,
    rooms: 7,
    createdAt: DateTime.parse('2024-08-18'),
  ),
];
