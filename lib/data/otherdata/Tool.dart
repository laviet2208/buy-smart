import 'Time.dart';

String getAllTimeString(Time time) {
  return (time.hour >= 10 ? time.hour.toString() : '0' + time.hour.toString()) + ":" + (time.minute >= 10 ? time.minute.toString() : '0' + time.minute.toString()) + " " + (time.day >= 10 ? time.day.toString() : '0' + time.day.toString()) + "/" + (time.month >= 10 ? time.month.toString() : '0' + time.month.toString()) + "/" + time.year.toString();
}

Time getCurrentTime() {
  DateTime now = DateTime.now();

  Time currentTime = Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0);
  currentTime.second = now.second;
  currentTime.minute = now.minute;
  currentTime.hour = now.hour;
  currentTime.day = now.day;
  currentTime.month = now.month;
  currentTime.year = now.year;

  return currentTime;
}

int calculateDiscountPercentage(double originalPrice, double discountedPrice) {
  // Tính phần trăm giảm giá
  double discount = ((originalPrice - discountedPrice) / originalPrice) * 100;
  // Làm tròn về số nguyên
  return discount.round();
}

String getStringNumber(double number) {
  String result = number.toStringAsFixed(0); // làm tròn số
  result = result.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},'); // chuyển đổi phân tách hàng nghìn
  return result;
}