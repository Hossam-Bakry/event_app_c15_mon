import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/utlis/firebase_firestore_utils.dart';
import 'package:event_app_c15_mon/models/category_data.dart';
import 'package:event_app_c15_mon/models/event_data.dart';
import 'package:event_app_c15_mon/modules/layout/home/widgets/event_card_item.dart';
import 'package:event_app_c15_mon/modules/layout/home/widgets/tab_bar_item_widegt.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedTapIndex = 0;
  List<CategoryData> categoriesDataList = [
    CategoryData(
      id: "sports",
      name: "Sports",
      icon: Icons.sports_basketball,
      image: AppAssets.sportImg,
    ),
    CategoryData(
      id: "book_club",
      name: "Book Club",
      icon: Icons.music_note,
      image: AppAssets.bookClubImg,
    ),
    CategoryData(
      id: "birthday",
      name: "Birthday",
      icon: Icons.cake_outlined,
      image: AppAssets.birthdayImg,
    ),
    CategoryData(
      id: "meeting",
      name: "Meeting",
      icon: Icons.art_track,
      image: AppAssets.meetingImg,
    ),
    CategoryData(
      id: "gaming",
      name: "Gaming",
      icon: Icons.theater_comedy,
      image: AppAssets.gamingImg,
    ),
    CategoryData(
      id: "eating",
      name: "Eating",
      icon: Icons.fastfood_outlined,
      image: AppAssets.eatingImg,
    ),
    CategoryData(
      id: "holiday",
      name: "Holiday",
      icon: Icons.music_note,
      image: AppAssets.holidayImg,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: mediaQuery.size.width,
          padding: EdgeInsets.only(
            top: mediaQuery.size.height * 0.05,
            bottom: 25,
          ),
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back ✨",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Hossam Bakry",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          spacing: 5,
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.mapsIcn),
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "Maadi, Egypt",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "EN",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: ColorPallete.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              DefaultTabController(
                length: categoriesDataList.length,
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(),
                  dividerColor: Colors.transparent,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  tabAlignment: TabAlignment.start,
                  onTap: (index) {
                    setState(() {
                      selectedTapIndex = index;
                    });
                  },
                  tabs:
                      categoriesDataList.map((data) {
                        return TabBarItemWidget(
                          categoryData: data,
                          isSelected:
                              selectedTapIndex ==
                              categoriesDataList.indexOf(data),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),

        // websocket server
        StreamBuilder(
          stream: FirebaseFirestoreUtils.getStreamEventTasksList(
            categoryId: categoriesDataList[selectedTapIndex].id,
          ),
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

        // FutureBuilder<List<EventData>>(
        //   future: FirebaseFirestoreUtils.getEventTasksList(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return Center(
        //         child: Text(
        //           snapshot.error.toString(),
        //           style: theme.textTheme.bodyLarge?.copyWith(
        //             color: Colors.black,
        //           ),
        //         ),
        //       );
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //
        //     List<EventData> eventDataList = snapshot.data ?? [];
        //
        //     /// One Time Read
        //     /// Real Time Read
        //     return Expanded(
        //       child: ListView.separated(
        //         padding: EdgeInsets.symmetric(vertical: 10),
        //         itemBuilder: (context, index) {
        //           return EventCardItem(eventData: eventDataList[index]);
        //         },
        //         separatorBuilder: (context, index) {
        //           return SizedBox(height: 10);
        //         },
        //         itemCount: eventDataList.length,
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
