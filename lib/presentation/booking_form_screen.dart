import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:krili/domain/property.dart';

class BookingFormScreen extends StatefulWidget {
  const BookingFormScreen({required this.property, super.key});
  final Property property;

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Check-In Date'),
          subtitle: Text(
            checkInDate != null
                ? DateFormat('yMMMd').format(checkInDate!)
                : 'Select date',
          ),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
            if (date != null) {
              setState(() => checkInDate = date);
            }
          },
        ),
        ListTile(
          title: const Text('Check-Out Date'),
          subtitle: Text(
            checkOutDate != null
                ? DateFormat('yMMMd').format(checkOutDate!)
                : 'Select date',
          ),
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now().add(const Duration(days: 1)),
              firstDate: DateTime.now().add(const Duration(days: 1)),
              lastDate: DateTime(2101),
            );
            if (date != null) {
              setState(() => checkOutDate = date);
            }
          },
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Book Now'),
        ),
      ],
    );
  }
}
