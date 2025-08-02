import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/utlis/firebase_firestore_utils.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c15_mon/models/event_data.dart';
import 'package:event_app_c15_mon/modules/layout/home/widgets/event_card_item.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomTextFormFiled(
            hintText: "search for event",
            prefixIcon: Icon(Icons.search, color: ColorPallete.primaryColor),
          ),
        ),
        SizedBox(height: 16.0),
        StreamBuilder(
          stream: FirebaseFirestoreUtils.getStreamFavouriteEventTasksList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            List<EventData> eventDataList =
                snapshot.data!.docs.map((element) {
                  return element.data();
                }).toList();

            /// One Time Read
            /// Real Time Read
            return eventDataList.isEmpty
                ? Center(child: Text("No Data"))
                : Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return EventCardItem(eventData: eventDataList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: eventDataList.length,
                  ),
                );
          },
        ),
      ],
    );
  }
}
