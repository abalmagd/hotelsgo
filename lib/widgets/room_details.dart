import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hotelsgo/resources/spacing.dart';
import 'package:hotelsgo/resources/strings.dart';
import 'package:hotelsgo/widgets/item_counter.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({super.key, required this.index});
  final int index;

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  int childrenCount = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${Strings.room} ${widget.index}',
              style: theme.textTheme.titleMedium),
          const Gap(Spacing.s12),
          ItemCounter(
            name: Strings.adults,
            onChanged: (value, isPlus) {},
          ),
          const Gap(Spacing.m16),
          ItemCounter(
            name: Strings.children,
            onChanged: (value, _) {
              setState(() => childrenCount = value);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: Spacing.m20),
            child: Column(
              children: List.generate(
                  childrenCount,
                  (index) => Padding(
                        padding: const EdgeInsets.only(top: Spacing.s8),
                        child: ChildAge(index: index + 1),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class ChildAge extends StatefulWidget {
  const ChildAge({super.key, required this.index});
  final int index;

  @override
  State<ChildAge> createState() => _ChildAgeState();
}

class _ChildAgeState extends State<ChildAge> {
  late final TextEditingController _controller;


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: Strings.defaultChildAge);
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(
            '${Strings.ageOfChild} ${widget.index}',
            style: theme.textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: TextField(
            maxLines: 1,
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
            ],
            textAlign: TextAlign.center,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
        Text(
          Strings.years,
          style: theme.textTheme.titleSmall,
        ),
      ],
    );
  }
}
