import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotelsgo/config/constants.dart';
import 'package:hotelsgo/resources/spacing.dart';
import 'package:hotelsgo/resources/strings.dart';
import 'package:hotelsgo/widgets/item_counter.dart';
import 'package:hotelsgo/widgets/room_details.dart';

class RoomsBottomSheet extends StatefulWidget {
  const RoomsBottomSheet({super.key});

  @override
  State<RoomsBottomSheet> createState() => _RoomsBottomSheetState();
}

class _RoomsBottomSheetState extends State<RoomsBottomSheet> {
  final List<RoomDetails> rooms = [
    const RoomDetails(index: 1),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(Spacing.s12),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.roomsAndGuests),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ],
          elevation: 15,
          shadowColor: Colors.grey,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.horizontalPadding,
            vertical: Constants.verticalPadding,
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(Spacing.s12),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(Spacing.s8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.0,
                    spreadRadius: 0.0,
                    offset: Offset(0, 2), // shadow direction: bottom right
                  )
                ],
              ),
              child: ItemCounter(
                name: Strings.rooms,
                onChanged: (value, isPlus) {
                  isPlus
                      ? rooms.add(RoomDetails(index: value))
                      : rooms.removeLast();
                  setState(() {});
                },
              ),
            ),
            ...rooms.map((room) {
              return Column(
                children: [
                  const Gap(Spacing.s12),
                  room,
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
