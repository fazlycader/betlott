class ModelItemCart {
  final String _digitsName;
  final int _ticketsCount;
  final String _digits;
  final int? _pairsGeneratedCount;
  final int _price;

  ModelItemCart({
    required digitsName,
    required ticketsCount,
    required digits,
    pairsGeneratedCount,
    required price,
  })  : _digitsName = digitsName,
        _ticketsCount = ticketsCount,
        _digits = digits,
        _pairsGeneratedCount = pairsGeneratedCount,
        _price = price;

  int? get pairsGeneratedCount => _pairsGeneratedCount;

  String get digits => _digits;

  int get ticketsCount => _ticketsCount;

  String get ticketsCountString {
    var value = "$_ticketsCount";
    if (pairsGeneratedCount != null) {
      value += " x $pairsGeneratedCount";
    }
    return "$value Tickets";
  }

  String get digitsName => _digitsName;

  int get price => _price;

  String get priceString {
    var value = "$price x $ticketsCount";
    if (pairsGeneratedCount != null) {
      value += " x $pairsGeneratedCount";
    }
    return value;
  }
}
