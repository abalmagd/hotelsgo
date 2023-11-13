import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotelsgo/config/constants.dart';
import 'package:hotelsgo/config/data.dart';
import 'package:hotelsgo/config/theme/palette.dart';
import 'package:hotelsgo/resources/assets.dart';
import 'package:hotelsgo/resources/spacing.dart';
import 'package:hotelsgo/resources/strings.dart';
import 'package:hotelsgo/screens/rooms_bottom_sheet.dart';
import 'package:hotelsgo/widgets/form_dropdown.dart';
import 'package:hotelsgo/widgets/search_clip_path.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  DateTime? firstDate;
  DateTime? secondDate;

  final format = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.background,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
              vertical: Constants.verticalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPaint(
                  painter: SearchTextPainter(),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      Spacing.s12,
                      Spacing.s12,
                      Spacing.s0,
                      Spacing.s12,
                    ),
                    color: theme.primaryColor,
                    child: Text(
                      Strings.hotelsSearch,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.s8),
                Container(
                  decoration: BoxDecoration(
                    color: Palette.formBackgroundColor,
                    borderRadius: BorderRadius.circular(Spacing.s12),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Spacing.s12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.primaryColor,
                              Palette.lightBlue300,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(Spacing.s12),
                        ),
                        child: Column(
                          children: [
                            const FormDropdown(
                              items: Data.cities,
                              hint: Strings.selectCity,
                            ),
                            const Gap(Spacing.s12),
                            GestureDetector(
                              onTap: () async {
                                final now = DateTime.now();

                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: now,
                                  firstDate: now,
                                  lastDate: DateTime(now.year + 1, 12),
                                );

                                if (firstDate == null ||
                                    (firstDate != null && secondDate != null)) {
                                  firstDate = date;
                                  secondDate = null;
                                  setState(() {});
                                  return;
                                }

                                secondDate = date;
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius:
                                      BorderRadius.circular(Spacing.s12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Spacing.m16,
                                ),
                                alignment: Alignment.centerLeft,
                                height: Spacing.l48,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      firstDate == null
                                          ? Strings.selectDate
                                          : '${format.format(firstDate!)} To ${secondDate == null ? Strings.secondDate : format.format(secondDate!)}',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    const Icon(Icons.calendar_month),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(Spacing.s12),
                            const FormDropdown(
                              items: Data.nationalities,
                              hint: Strings.selectNationality,
                            ),
                            const Gap(Spacing.s12),
                            const FormDropdown(
                              items: Data.rooms,
                              hint: Strings.selectRoom,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const FractionallySizedBox(
                              heightFactor: 0.9,
                              child: RoomsBottomSheet(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.findHotels,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.secondaryContainer,
                              ),
                            ),
                            const SizedBox(width: Spacing.s4),
                            Icon(
                              Icons.search,
                              color: theme.colorScheme.secondaryContainer,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
