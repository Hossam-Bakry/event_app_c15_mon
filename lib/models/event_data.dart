class EventData {
  static const String collectionName = "event_tasks";
  String? eventId;
  String eventTitle;
  String eventDescription;
  String eventCategoryImg;
  String eventCategoryId;
  bool isFavourite;
  DateTime selectedDate;

  EventData({
    this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventCategoryImg,
    required this.eventCategoryId,
    this.isFavourite = false,
    required this.selectedDate,
  });

  /// Json || Map<String, dynamic>
  factory EventData.fromFireStore(Map<String, dynamic> data) {
    return EventData(
      eventId: data["eventId"],
      eventTitle: data["eventTitle"],
      eventDescription: data["eventDescription"],
      eventCategoryImg: data["eventCategoryImg"],
      eventCategoryId: data["eventCategoryId"],
      isFavourite: data["isFavourite"],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(data["selectedDate"]),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "eventId": eventId,
      "eventTitle": eventTitle,
      "eventDescription": eventDescription,
      "eventCategoryImg": eventCategoryImg,
      "eventCategoryId": eventCategoryId,
      "isFavourite": isFavourite,
      "selectedDate": selectedDate.millisecondsSinceEpoch,
    };
  }
}
