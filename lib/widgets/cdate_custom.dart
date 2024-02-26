class DateInputHelper {
  static String formatInput(String input) {
    String formatted = input.replaceAll(RegExp(r'[^0-9]'), '');

    if (formatted.length >= 8) {
      formatted = formatted.substring(0, 2) +
          '-' +
          formatted.substring(2, 4) +
          '-' +
          formatted.substring(4, 8);
    }

    return formatted;
  }

  static bool isValidDate(String date) {
    if (date.length >= 10) {
      int day = int.tryParse(date.substring(0, 2)) ?? 0;
      int month = int.tryParse(date.substring(3, 5)) ?? 0;
      int year = int.tryParse(date.substring(6, 10)) ?? 0;

      if (year >= 1900 &&
          year <= 2100 &&
          month >= 1 &&
          month <= 12 &&
          day >= 1 &&
          day <= 31) {
        // Additional validation logic (e.g., for days in a month) can be added here
        return true;
      }
    }
    return false;
  }
}
