/// Whole numbers the way Turkish users type them: 80000, 80.000 or 80 000.
///
/// A dot only ever groups thousands, so "80.000" is eighty thousand, and an
/// ambiguous "80.00" is rejected instead of being read as 80. Decimals, signs
/// and more than 15 digits (beyond exact integers on the web) are rejected.
/// A latitude or longitude typed with either decimal mark ("38,4237").
/// `double.tryParse` also accepts "NaN" and "Infinity"; neither is a place,
/// and NaN slips past every range comparison, so only finite values count.
double? parseCoordinate(String input) {
  final value = double.tryParse(input.trim().replaceAll(',', '.'));
  return value != null && value.isFinite ? value : null;
}

int? parseTurkishInteger(String input) {
  final token = input.trim().replaceAll(RegExp(r'[\s  ]'), '');
  final digits = RegExp(r'^\d{1,3}(?:\.\d{3})+$').hasMatch(token)
      ? token.replaceAll('.', '')
      : token;
  if (!RegExp(r'^\d{1,15}$').hasMatch(digits)) return null;
  return int.parse(digits);
}
