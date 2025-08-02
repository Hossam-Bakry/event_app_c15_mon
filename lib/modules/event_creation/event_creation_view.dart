import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/services/snackbar_service.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/utlis/firebase_firestore_utils.dart';
import 'package:event_app_c15_mon/core/widgets/custom_button.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:event_app_c15_mon/models/category_data.dart';
import 'package:event_app_c15_mon/models/event_data.dart';
import 'package:event_app_c15_mon/modules/event_creation/widgets/create_event_tab_bar_item_widegt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class EventCreationView extends StatefulWidget {
  const EventCreationView({super.key});

  @override
  State<EventCreationView> createState() => _EventCreationViewState();
}

class _EventCreationViewState extends State<EventCreationView> {
  int selectedTapIndex = 0;
  DateTime? selectedDate;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(title: const Text("Create Event")),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            onPressed: () {
              /// validation
              ///
              if (formKey.currentState!.validate()) {
                if (selectedDate != null) {
                  // object EventData
                  var eventData = EventData(
                    eventTitle: titleController.text,
                    eventDescription: descriptionController.text,
                    eventCategoryId: categoriesDataList[selectedTapIndex].id,
                    eventCategoryImg:
                        categoriesDataList[selectedTapIndex].image,
                    selectedDate: selectedDate!,
                  );

                  EasyLoading.show();

                  FirebaseFirestoreUtils.createNewEventTask(eventData).then(((
                    value,
                  ) {
                    Future.delayed(const Duration(seconds: 4), () {
                      EasyLoading.dismiss();
                      if (value) {
                        Navigator.pop(context);
                        SnackBarService.showSuccessMessage(
                          "Event has been created successfully",
                        );
                      } else {
                        SnackBarService.showErrorMessage(
                          "Something wont wrong",
                        );
                      }
                    });
                  }));
                }
              }
            },
            child: Text(
              "Add Event",
              style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    categoriesDataList[selectedTapIndex].image,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.0),
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
                          return CreateEventTabBarItemWidget(
                            categoryData: data,
                            isSelected:
                                selectedTapIndex ==
                                categoriesDataList.indexOf(data),
                          );
                        }).toList(),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Title",
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: ColorPallete.generalTextColor,
                  ),
                ),
                SizedBox(height: 5.0),
                CustomTextFormFiled(
                  controller: titleController,
                  hintText: "Event Title",
                  prefixIcon: Icon(
                    Icons.edit_note_rounded,
                    size: 30,
                    color: ColorPallete.textFormFieldBorderColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0),
                Text(
                  "Description",
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: ColorPallete.generalTextColor,
                  ),
                ),
                SizedBox(height: 5.0),
                CustomTextFormFiled(
                  controller: descriptionController,
                  hintText: "Event Description",
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 15.0),
                    Text(
                      "Event Date",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: ColorPallete.generalTextColor,
                      ),
                    ),
                    Spacer(),
                    Bounceable(
                      onTap: () {
                        getCurrentDate();
                      },
                      child: Text(
                        selectedDate == null
                            ? "Choose Date"
                            : DateFormat(
                              "dd MMM yyyy",
                            ).format(selectedDate!).toString(),
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                CustomButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: ColorPallete.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.my_location,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          "Choose Event Location",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPallete.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getCurrentDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      setState(() {
        selectedDate = value;
      });
    });
  }
}
