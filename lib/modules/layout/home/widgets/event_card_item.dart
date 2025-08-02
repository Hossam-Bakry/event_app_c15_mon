import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/utlis/firebase_firestore_utils.dart';
import 'package:event_app_c15_mon/models/event_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';

class EventCardItem extends StatelessWidget {
  final EventData eventData;

  const EventCardItem({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 210,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: ColorPallete.primaryColor),
        image: DecorationImage(
          image: AssetImage(eventData.eventCategoryImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 43,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              DateFormat("dd MMM").format(eventData.selectedDate),
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPallete.primaryColor,
                height: 1,
              ),
            ),
          ),
          Container(
            width: double.infinity,

            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    eventData.eventTitle,
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    eventData.isFavourite = !eventData.isFavourite;
                    FirebaseFirestoreUtils.updateEventTask(
                      eventData: eventData,
                    );
                  },
                  child: Icon(
                    eventData.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: ColorPallete.primaryColor,
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
