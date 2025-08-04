String convertToArabicOrdinal(int number) {
  final units = [
    '',
    'الأول',
    'الثاني',
    'الثالث',
    'الرابع',
    'الخامس',
    'السادس',
    'السابع',
    'الثامن',
    'التاسع'
  ];

  final tens = [
    
    'العاشر',
    'الحادي عشر',
    'الثاني عشر',
    'الثالث عشر',
    'الرابع عشر',
    'الخامس عشر',
    'السادس عشر',
    'السابع عشر',
    'الثامن عشر',
    'التاسع عشر'
  ];

  final tensNames = [
    '',
    '',
    'العشرون',
    'الثلاثون',
    'الأربعون',
    'الخمسون',
    'الستون',
    'السبعون',
    'الثمانون',
    'التسعون'
  ];

  if (number == 0) return 'الأول'; // افتراضًا
  if (number == 1) return 'الأول';
  if (number == 2) return 'الثاني';
  if (number < 10) return units[number];
  if (number <= 19) return tens[number - 10];
  if (number < 100) {
    int u = number % 10;
    int t = number ~/ 10;
    if (u == 0) return tensNames[t];
    return '${units[u]} و${tensNames[t]}';
  }
  if (number < 1000) {
    int h = number ~/ 100;
    int rem = number % 100;
    String hundreds = '';

    switch (h) {
      case 1:
        hundreds = 'المائة';
        break;
      case 2:
        hundreds = 'المائتين';
        break;
      default:
        hundreds = '${units[h]} مائة';
    }

    if (rem == 0) return hundreds;
    return '$hundreds و${convertToArabicOrdinal(rem)}';
  }

  if (number == 1000) return 'الألف';

  return 'الرقم غير مدعوم';
}
