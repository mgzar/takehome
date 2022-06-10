class BookingResponse {
  String? date;
  List<Slots>? slots;

  BookingResponse({this.date, this.slots});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  String? startTime;
  String? endTime;
  bool? available;

  Slots({this.startTime, this.endTime, this.available});

  Slots.fromJson(Map<String, dynamic> json) {
    startTime = json['start_time'];
    endTime = json['end_time'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['available'] = available;
    return data;
  }
}