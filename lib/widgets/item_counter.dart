import 'package:flutter/material.dart';
import 'package:hotelsgo/resources/spacing.dart';

class ItemCounter extends StatefulWidget {
  const ItemCounter({super.key, required this.name, required this.onChanged});

  final String name;
  final Function(int, bool isPlus) onChanged;

  @override
  State<ItemCounter> createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter>
    with AutomaticKeepAliveClientMixin {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(widget.name, style: theme.textTheme.titleMedium),
        const Spacer(),
        CounterButton(
          onTap: () {
            setState(() => count--);
            widget.onChanged(count, false);
          },
          isPlus: false,
          isEnabled: count > 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.s12),
          child: Text('$count', style: theme.textTheme.titleMedium),
        ),
        CounterButton(
          onTap: () {
            setState(() => count++);
            widget.onChanged(count, true);
          },
          isPlus: true,
          isEnabled: count <= 9,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.onTap,
    required this.isPlus,
    required this.isEnabled,
  });

  final VoidCallback onTap;
  final bool isPlus;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
              color: theme.primaryColor.withOpacity(isEnabled ? 1 : 0.5),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.s12,
          vertical: Spacing.s4,
        ),
        child: Icon(
          isPlus ? Icons.add : Icons.remove,
          color: theme.primaryColor.withOpacity(isEnabled ? 1 : 0.5),
        ),
      ),
    );
  }
}
